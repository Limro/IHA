/******************************************************
FreeRTOS demo program.
Implementing 2 tasks, each blinking a LED.

STK500 setup:
  * PORTC connected to LEDS.

Henning Hargaard 8.2.2012
*******************************************************/

#define F_CPU 3686400

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include "FreeRTOS.h"
#include "lcd162.h"
#include "led.h"
#include "LM75.h"
#include "queue.h"
#include "semphr.h"
#include "task.h"
#include "uart.h"

xSemaphoreHandle xSemaphore1 = NULL;
xQueueHandle xQueue1 = NULL;
xQueueHandle xQueueAlarm = NULL;

// Lige nu bruges den til at skrive text fra GSM modem til LCD display
void ModemOutput(void *pvParameters)
{
	char buffer = 0;
	char flag = 1;
	
	while(1)
	{
		while(!CharReady())
		{
			vTaskDelay(100);
			toggleLED(1);
		}
		LCDGotoXY(0,1);
	
		while(flag)
		{
			toggleLED(2);
			buffer = ReadChar();
			if(buffer == '\r')
			{
				flag = 0;
			}
			LCDDispChar(buffer);
		}
		
		flag = 1;	
		toggleLED(3);
		vTaskDelay(50);
	}	
}

/*
 * Retrieves data from LM75 and sends it into xQueue1
 */
void LM75SensorTask(void *pvParameters)
{	
	int rawTempeture = 0;

	while (1)
	{
		// Get temperature and store in local variable
		rawTempeture = LM75_temperature(0);
		//rawTempeture = 60; // 30 grader
		
		if(xQueue1 != NULL)
		{
			// Waits for xSemaphore1 to become available
			while(xSemaphoreTake(xSemaphore1, portMAX_DELAY) != pdTRUE)
			{
				vTaskDelay(100);
			}			
				
			// Adds rawTempeture to xQueue1
			xQueueSendToBack(xQueue1, &rawTempeture, portMAX_DELAY);
			
			// Release semaphore
			xSemaphoreGive(xSemaphore1);
		}
		
		// Avoid self heating
		vTaskDelay(500);
	}
}

/*
 * Retrieves temperature values from xQueue1 and show it on LCD 162 display
 */
void Lcd162Task(void *pvParameters)
{
	int currentValue = 0;
	char flag = 1;
	
	while(1)
	{
		if(xQueue1 != NULL)
		{
			// Receive temperature from queue when available
			if(xQueueReceive(xQueue1, &currentValue, portMAX_DELAY) == pdTRUE)
			{			
				// Clears display	
				LCDClear();
				LCDDispString("Temp: ");
				
				// Divide by two to bit shift one to the right 
				LCDDispInteger(currentValue / 2);
				
				//Half values
				if(currentValue % 2 != 0)
				{
					LCDDispChar(',');
					LCDDispInteger(5);
				}
				
				if(currentValue / 2 > 26)
				{
					if(flag)
					{
						buzzerAlarm();
						sendText(); // Evt send char* med								
						
						flag = 0;				
					}					
				}
			}				
		}
	}
}

void buzzerAlarm()
{
	OCR2 = 10;
	DDRD ^= (1<<PB7); // Tænder PIN
	
	// BEEP for 2000 ms
	vTaskDelay(2000);
	
	DDRD ^= (1<<PB7); // Slukker PIN
}

void sendText()
{
	vTaskDelay(2000);
	
	// Sends AT to modem
	SendString("AT");
	vTaskDelay(20);
	SendChar(13);
	
	//toggleLED(3);

	vTaskDelay(2000);
	//waitWhile('K');
	
	SendString("AT+CMGF=1");
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile('K');
	vTaskDelay(2000);
	
	SendString("AT+CPIN=7865"); // Asbjørn 0221 / Lars 7865
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile('K');
	vTaskDelay(5000);
	
	SendString("AT+CMGS=28917038");
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile('K');
	vTaskDelay(5000);
	
	SendString("hen");
	vTaskDelay(20);
	SendChar(26);	//Ctrl + Z
}

/*
 * This function peeks the value in xQueue1 containing temperature
 * If value is above 28 degrees, it toggles LED 7 every 100ms
 *
 * MISSING:
 * Add BUZZER(With semaphore or queue)
 * Add TEXT(with semaphore or queue)
 */
void checkTempTask(void *pvParameters)
{	
	int currentValue = 0;
	char flag = 1;
	int i = 0;
	char x = 'x';
	
	while(1)
	{
		if(xQueue1 != NULL)
		{
			// Peeks temperature in xQueue1
			if(xQueuePeek(xQueue1, &currentValue, portMAX_DELAY) == pdTRUE)
			{
				// Bit shift value 1 to right and checks if above 28
				if(currentValue / 2 > 28)
				{
					toggleLED(7);

					if(flag)
					{
						if(xQueueSendToBack(xQueueAlarm, &x, portMAX_DELAY) != pdPASS)
						{
							// IF FAILED
							LCDDispString("Failed to add Alarm to xQueueAlarm in checkTempTask");
						}
						
						flag = 0;
					}
					i++;

					// So Alarm is only sent every 1 second
					if(i == 10)
					{
						flag = 1;
						i = 0;
					}
				}
				else
				{
					flag = 1;
					i = 0;
				}
				
				vTaskDelay(100);
			}
		}
		else
		{
			vTaskDelay(100);
		}
	}
}

/*
 * A simple TASK which toggles LED 0 100ms.
 *
 * If LED 0 doesn't blink every 100 ms(often),
 * when testing on STK500, something is stalling/bugging
 * the program.
 */
void testTask(void *pvParameters)
{
	while(1)
	{
		toggleLED(0);
		vTaskDelay(100);
	}
}

// MAX 5 SENDSTRINGS!!!!!!! Ellers staller programmet
/*
 * GSM Task sets up the GSM
 * and sends a text to 28917038
 * when a warning has come.
 *
 * SendChar(13) = "Return"
 * SendChar(26) = "CTRL+Z"
 *
 * MISSING:
 * Adding queue or semaphore to check
 * when text should be sent
 */
void GSMTask(void *pvParameters)
{	
	char message;
	char buzzerFlag = 0;
	int intervalReading = 500;
	
	while(1)
	{
		if(xQueueAlarm != NULL)
		{
			// Peeks the xQueueAlarm queue for 500 ms
			xQueuePeek(xQueueAlarm, &message, intervalReading);
			
			if( message == 'x') //Alarm start
			{
				// Empty the queue
				xQueueReceive(xQueueAlarm, &message, portMAX_DELAY);
				
				sendText();
				message = 'a';
				buzzerFlag = 1;
			}
			else if( message == 'a') //Alarm stop
			{
				buzzerFlag = 0;
			}
			else //No reading at all
			{
				if(intervalReading < 64000)
					intervalReading += 1000;
			}
			
			if(buzzerFlag)
			{
				buzzerAlarm();
			}
			vTaskDelay(200);					
		}
	}	
}

// Slettes
void MyErrorTask(void *pvParameters)
{
	while(1)
	{
		//waitWhile('\r');
	}
}

/*
 * Buzzer Task which activates and shuts off buzzer
 *
 * MISSING:
 * Adds semaphore or queue
 */
void buzzerTask(void *pvParameters)
{	
	char message;
	
	while(1)
	{
		toggleLED(7);

		// Peeks the xQueueAlarm queue
		if(xQueuePeek(xQueueAlarm, &message, 200) == pdTRUE)
		{
			if(message == 'x')
			{
				OCR2 = 10;
				DDRD ^= (1<<PB7); // Tænder PIN
				
				// BEEP for 2000 ms
				vTaskDelay(2000);
				
				DDRD ^= (1<<PB7); // Slukker PIN
				
				//toggleLED(7); // Til debug
				
				message = 'a';
				
				// Waits 5 sec
				vTaskDelay(5000);
			}
			toggleLED(5);
		}

		toggleLED(3);
		vTaskDelay(200);
	}
}

/*
 * Setting up Timer2 for buzzer to work
 */
void initTimer2()
{
	TCCR2 = 0b10011111;
}

/*
 * Main function
 *
 * Init drivers
 * Start Tasks
 * Start Scheduler
 */
int main(void)
{	
 	xSemaphore1 = xSemaphoreCreateMutex(); //Mutex
 	xQueue1 = xQueueCreate(10, sizeof(int)); 
 	xQueueAlarm = xQueueCreate(10, sizeof(char));
// 	
 	InitUART(9600,8);
 	initLEDport();
 	initTimer2();
 	LCDInit();
 	i2c_init();
		
	xTaskCreate(LM75SensorTask, (signed char *) "LM75Sensor", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);

	xTaskCreate(Lcd162Task, (signed char *) "Lcd", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	
	xTaskCreate(ModemOutput, (signed char *) "ModemOutput", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);

	//xTaskCreate(checkTempTask, (signed char *) "CheckTemp", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL); // BRUG IKKE

	// xTaskCreate(buzzerTask, (signed char *) "buzzerTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);	// BRUG IKKE

	//xTaskCreate(testTask, (signed char *) "testTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL); // BRUG IKKE

	//xTaskCreate(GSMTask, (signed char *) "GSM", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL); // BRUG IKKE
	
	//xTaskCreate(MyErrorTask, (signed char *) "MyErrorTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL); // BRUG IKKE
		
	vTaskStartScheduler();
	while(1)
	{}		
}
