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

void waitWhile(char character)
{
	char buffer = 0;
	char flag = 1;
	
	while(!CharReady())
	{
		vTaskDelay(100);
		toggleLED(1);
	}
	
	while(flag)
	{
		//toggleLED(2);
		buffer = ReadChar();
		if(buffer == character)
		{
			//toggleLED(3);
			flag = 0;
		}
		
		//toggleLED(4);
		LCDDispChar(buffer);
	}	
	vTaskDelay(50);
}

void LM75SensorTask(void *pvParameters)
{	
	int rawTempeture = 0;
	// Initialize the 2 wire interface
	i2c_init();

	while (1)
	{
		//Write to queue
		rawTempeture = LM75_temperature(0);
		
		if(xQueue1 != NULL)
		{
			while(xSemaphoreTake(xSemaphore1, portMAX_DELAY) != pdTRUE)
			{}			
				
			xQueueSendToBack(xQueue1, &rawTempeture, portMAX_DELAY);
			
			xSemaphoreGive(xSemaphore1);
		}
		
		// Avoid self heating
		vTaskDelay(500);
	}
}

void Lcd162Task(void *pvParameters)
{
	int currentValue = 0;
	
	LCDInit();
	LCDClear();
	
	while(1)
	{
		if(xQueue1 != NULL)
		{
			if(xQueueReceive(xQueue1, &currentValue, portMAX_DELAY) == pdTRUE)
			{				
				LCDClear();
				LCDDispString("Temperture: ");
				
				LCDDispInteger(currentValue / 2);
				
				//Half values
				if(currentValue % 2 != 0)
				{
					LCDDispChar(',');
					LCDDispInteger(5);
				}
			}				
		}
	}
}

void checkTempTask(void *pvParameters)
{	
	int currentValue = 0;
	
	while(1)
	{
		if(xQueue1 != NULL)
		{
			if(xQueuePeek(xQueue1, &currentValue, portMAX_DELAY) == pdTRUE)
			{
				if(currentValue / 2 > 28)
				{
					toggleLED(0);					
					vTaskDelay(100);
				}
			}
		}
	}
}

void testTask(void *pvParameters)
{
	while(1)
	{
		toggleLED(0);
		vTaskDelay(100);
	}
}

// MAX 5 SENDSTRINGS!!!!!!! Ellers staller programmet
void GSMTask(void *pvParameters)
{
	vTaskDelay(2000);	
	toggleLED(2);
	
	// Sender AT til modem
 	SendString("AT");
 	vTaskDelay(20);
 	SendChar(13);	
	 
	toggleLED(3); 

	vTaskDelay(2000);
	//waitWhile('K');
	
	SendString("AT+CMGF=1");
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile('K');
	vTaskDelay(2000);
	
	SendString("AT+CPIN=7865"); // 0221 / 7865
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
	
	toggleLED(6);
	
	while(1)
	{			
		vTaskDelay(500);
		toggleLED(7);		
	}	
}

void MyErrorTask(void *pvParameters)
{
	while(1)
	{
		waitWhile('\r');
	}
}

void buzzerTask(void *pvParameters)
{	
	while(1)
	{
		// BEEP i 250 ms
		OCR2 = 10; 		
		vTaskDelay(2000);
		// INGEN BEEP i 2000 ms
		DDRD ^= (1<<PB7); // Slukker PIN
		vTaskDelay(2000);	
		DDRD ^= (1<<PB7); // Tænder PIN
			
		toggleLED(7); // Til debug
	}
}

void initTimer2()
{
	// Ben OC1A (= PORTD bit 5) sættes til udgang	
	DDRD |= (1<<PB7);
	
	TCCR2 = 0b10011111;
}

int main(void)
{	
	xSemaphore1 = xSemaphoreCreateMutex(); //Mutex
	xQueue1 = xQueueCreate(16, sizeof(int)); 
	
	InitUART(9600,8);
	initLEDport();
	initTimer2();
	LCDInit();
	i2c_init();
		
	//xTaskCreate(LM75SensorTask, (signed char *) "LM75Sensor", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(Lcd162Task, (signed char *) "Lcd", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(checkTempTask, (signed char *) "CheckTemp", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(buzzerTask, (signed char *) "buzzerTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	
	xTaskCreate(testTask, (signed char *) "testTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	xTaskCreate(GSMTask, (signed char *) "GSM", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);	
	xTaskCreate(MyErrorTask, (signed char *) "MyErrorTask", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
		
	vTaskStartScheduler();
	while(1)
	{}		
}