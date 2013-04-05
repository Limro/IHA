#include "LCD.h"
#include "keyboard.h"
#include "system.h"
#include "altera_avalon_pio_regs.h"
#include "altera_up_avalon_audio_and_video_config.h"
#include <math.h>
// #include <unistd.h>

#define KEYBOARD_BUFFER_SIZE 6
#define KEYBOARD_BUFFER_SIZE_WITH_TERMINATE KEYBOARD_BUFFER_SIZE+1 // Only for the start

#define KEY_BUFFER_SIZE 3
#define KEY_BUFFER_SIZE_WITH_TERMINATE KEYBOARD_BUFFER_SIZE+1 // Only for the start

#define QUARTER_SOUND_SAMPLES 60
#define SOUND_HERTZ 48000
#define MAX_CODEC_SIZE 16777216
#define HALF_MAX_CODEC_SIZE (MAX_CODEC_SIZE/2)
#define PI 3.14159265

void initCodecAsMaster(void){
	int err = 0;
	alt_up_av_config_dev* audio_dev = alt_up_av_config_open_dev(AUDIO_AND_VIDEO_CONFIG_0_NAME);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x00, 0x17); // Left line-in 0dB attn, Mute disable
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x01, 0x17); // Right line-in 0dB attn, Mute disable
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x02, 0x79);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x03, 0x79);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x04, 0x12);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x05, 0x00);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x06, 0x00);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x07, 0x4A);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x08, 0x01);
	err = alt_up_av_config_write_audio_cfg_register(audio_dev, 0x09, 0x01);
	if(err < 0)
		printf("Audio Configuration Failed\n");
	else
		printf("Audio Configuration Succesful\n");
}

int main(void)
{
	/* Used for sound buffer */
	long quarter_sound_samples[QUARTER_SOUND_SAMPLES];
	unsigned char quarter_samples = 0, full_samples = 0, sample_i = 0;
	int hertz = 0, old_hertz = 0;

	/* used for key buffer */
	char key_keys[KEY_BUFFER_SIZE_WITH_TERMINATE];

	/* used for PS/2 port data */
	alt_up_ps2_dev *PS2_dev;
	unsigned char keyboard_keys[KEYBOARD_BUFFER_SIZE_WITH_TERMINATE];
	unsigned char keyboard_key = NULL_TERMINATE, keyboard_oldkey = NULL_TERMINATE, i=0;

	// Init Keyboard-buffer - also the extra space in the end (constantly null terminate)
	for(i=0; i<KEYBOARD_BUFFER_SIZE_WITH_TERMINATE;i++)
	{
		keyboard_keys[i] = NULL_TERMINATE;
	}

	initCodecAsMaster();

	// Open the PS2 port
	PS2_dev = alt_up_ps2_open_dev (PS2_PORT_NAME);
	if (PS2_dev == NULL)
	{
		alt_printf ("Error: could not open PS/2 device!!!\n");
		return -1;
	}
	else
	{
		alt_printf ("Opened PS/2 device\n");
		(void) alt_up_ps2_write_data_byte (PS2_dev, 0xFF);	// Reset PS/2
	}

	// Loop main functions
	while(1)
	{
		long switches = IORD_ALTERA_AVALON_PIO_DATA(PIO_INPUT_SW_BASE);
		if(switches & 1 == 1)
		{
			updateKeyKeys(&key_keys);

			// Write information on LCD
			writeToLCD("Keys pressed:",1);
			writeToLCD(key_keys,2);
			hertz= 440;
		} else
		{
			keyboard_key = updateKeyboardKeys(PS2_dev,&keyboard_keys,KEYBOARD_BUFFER_SIZE);
			if(keyboard_key != keyboard_oldkey)
			{
				printf ("Last pressed down PS/2-key: %c\n", keyboard_key);
				keyboard_oldkey = keyboard_key;
				hertz = keyboardKeyToHertz(keyboard_key);
				//hertz = getHertzFromKeyboardKey(keyboard_key);

			}

			// Write information on LCD
			writeToLCD("Keyboard press:",1);
			writeToLCD(keyboard_keys,2);
		}

		// Do all the sound-things if hertz have changed!
		if(hertz != old_hertz)
		{
			old_hertz = hertz;

			printBCDon7Seg(hertz);
			printf("Printed hertz: %u\n",hertz);

			// Find sound-samples and send to VHDL
			if(hertz == 0)
			{
				// SEND 0 to VHDL
			}
			else
			{
				quarter_samples = SOUND_HERTZ/hertz/4;
				full_samples = quarter_samples*4;

				// Write number of samples to RAM-controller
				IOWR_16DIRECT(RAM_SOUND_0_BASE, 0, full_samples);

				if(quarter_samples > QUARTER_SOUND_SAMPLES)
				{
					printf("ERROR: Number of samples (%u) exceeds size of sample-buffer (%u) for %u Hz!\n",
							full_samples, QUARTER_SOUND_SAMPLES*4, hertz);
				}
				else
				{
					// FIRST QUARTER
					for(sample_i = 0; sample_i < quarter_samples; sample_i++)
					{
						quarter_sound_samples[sample_i] = (1+sin((sample_i*2*PI)/full_samples))*HALF_MAX_CODEC_SIZE;
						//printf("%u,",quarter_sound_samples[sample_i]);
						IOWR_16DIRECT(RAM_SOUND_0_BASE, 4, quarter_sound_samples[sample_i]);
					}

					// SECOND QUARTER
					for(sample_i = quarter_samples; sample_i > 0; sample_i--)
					{
						// SEND TO PORT
						//printf("%u,",quarter_sound_samples[sample_i-1]);
						IOWR_16DIRECT(RAM_SOUND_0_BASE, 4, quarter_sound_samples[sample_i-1]);
					}

					// THIRD QUARTER
					for(sample_i = 0; sample_i < quarter_samples; sample_i++)
					{
						// SEND TO PORT
						//printf("%u,", MAX_CODEC_SIZE-quarter_sound_samples[sample_i]);
						IOWR_16DIRECT(RAM_SOUND_0_BASE, 4, MAX_CODEC_SIZE-quarter_sound_samples[sample_i]);
					}

					// FOURTH QUARTER
					for(sample_i = quarter_samples; sample_i > 0; sample_i--)
					{
						// SEND TO PORT
						//printf("%u,",MAX_CODEC_SIZE-quarter_sound_samples[sample_i-1]);
						IOWR_16DIRECT(RAM_SOUND_0_BASE, 4, MAX_CODEC_SIZE-quarter_sound_samples[sample_i-1]);
					}

					printf("Printed %u samples to MM\n",full_samples);
					IOWR_16DIRECT(RAM_SOUND_0_BASE, 2, 0);
					printf("Started playing...\n");
				}
			}
		}
	}
}
