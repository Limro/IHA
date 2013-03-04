/******************************************************
FreeRTOS demo program.
Implementing 2 tasks, each blinking a LED.

STK500 setup:
  * PORTC connected to LEDS.

Henning Hargaard 8.2.2012
*******************************************************/

#define QueueType int

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "FreeRTOS.h"
#include "task.h"
#include "led.h"
#include "uart.h"
#include "semphr.h"
#include "queue.h"
#include "lcd162.h"

xSemaphoreHandle xSemaphore1 = NULL;
xQueueHandle xQueue1 = NULL;

void waitWhile()
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	char buffer = 0;
	char flag = 1;
	
	//LCDClear();
	while(!CharReady())
	{
		vTaskDelay(100);
		toggleLED(1);
	}
	
	while(flag)
	{
		toggleLED(2);
		buffer = ReadChar();
		if(buffer == '\r')
		{
			toggleLED(3);
			flag = 0;
		}
		
		toggleLED(4);
		LCDDispChar(buffer);
		toggleLED(5);
	}	
	
	flag = 1;
	vTaskDelay(200);
}

void LM75SensorTask(void *pvParameters)
{
	QueueType rawTempeture;
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
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
		vTaskDelayUntil(&xLastWakeTime, 500);
	}
}

void Lcd162Task(void *pvParameters)
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	QueueType currentValue = NULL;
	
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
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();	
	QueueType currentValue = NULL;
	
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
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	while(1)
	{
		toggleLED(0);
		vTaskDelay(100);
	}
}

// MAX 5 SENDSTRINGS!!!!!!! Ellers staller programmet
void GSMTask(void *pvParameters)
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	vTaskDelay(2000);
	
	toggleLED(2);
	
	// Sender AT til modem
 	SendString("AT");
 	vTaskDelay(20);
 	SendChar(13);	
	 
	toggleLED(3); 

	vTaskDelay(2000);
	//waitWhile();
	
	SendString("AT+CMGF=1");
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile();
	vTaskDelay(2000);
	
	SendString("AT+CPIN=7865"); // 0221 / 7865
	vTaskDelay(20);	
	SendChar(13);
	
	//waitWhile();	
	vTaskDelay(5000);
	
	SendString("AT+CMGS=28917038");
	vTaskDelay(20);
	SendChar(13);
	
	//waitWhile();
	vTaskDelay(5000);
	
	SendString("hen");
	vTaskDelay(20);
	SendChar(26);	
	
	toggleLED(6);
	
	while(1)
	{			
		vTaskDelay(500);
		toggleLED(7);		
	}	
}

/*
void ErrorMessageGMSTask(void *pvParameters)
{	
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	xQueueHandle errorQueue1 = NULL;
	errorQueue1 = xQueueCreate(10, sizeof(char));
	
	char buffer;
	char xxx;
	char flag = 1;	
	char navn[16];
	
	while(1)
	{
		while(CharReady())
		{			
			vTaskDelay(100);
		}
		
		while(flag)
		{
			buffer = ReadChar();
			if(buffer == '\0')
				flag = 0;
				
			xQueueSendToBack(errorQueue1, &buffer, portMAX_DELAY);
		}	
		
		flag = 1;
		
		while(xQueuePeek(errorQueue1, &xxx, portMAX_DELAY) == pdTRUE)
		{
			printf(navn, xxx);
		}	
		
		LCDDispString(navn);		
	}
}
*/

void MyErrorTask(void *pvParameters)
{		
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	char buffer = NULL;
	char flag = 1;
	
	while(1)
	{
		//LCDClear();
		while(!CharReady())
		{
			vTaskDelay(100);
			toggleLED(1);			
		}
		
		while(flag)
		{			
			toggleLED(2);
			buffer = ReadChar();
			
			if(buffer == '\r')
			{
				toggleLED(3);
				flag = 0;
			}			
			
			toggleLED(4);
			LCDDispChar(buffer);
			toggleLED(5);
		}
		
		flag = 1;
		vTaskDelay(200);
	}
}

void buzzerTask(void *pvParameters)
{	
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
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
	xQueue1 = xQueueCreate(10, sizeof(QueueType)); //Queue 10 big containing 'unsigned char'
	
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