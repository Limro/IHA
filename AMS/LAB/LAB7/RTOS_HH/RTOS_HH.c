/******************************************************
FreeRTOS demo program.
Implementing 2 tasks, each blinking a LED.

STK500 setup:
  * PORTC connected to LEDS.

Henning Hargaard 8.2.2012
*******************************************************/
#include <avr/io.h>
#include <avr/delay.h>
#include "FreeRTOS.h"
#include "task.h"
#include "led.h"
#include "uart.h"
#include "semphr.h"
#include "queue.h"

xSemaphoreHandle xSemaphore1 = NULL;
unsigned char count = 0;
xSemaphoreHandle xSemaphore2 = NULL;
xQueueHandle xQueue1 = NULL;

void vLEDFlashTask1( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	while(1)
	{
		toggleLED(0);
		vTaskDelayUntil(&xLastWakeTime, 1000);
	}
}

void vLEDFlashTask2( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	while(1)
	{
		toggleLED(1);
		vTaskDelayUntil(&xLastWakeTime, 500);
	}
}

void vLEDFlashTask3( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	int ledNumber = 2;
	while(1)
	{
		if(ledNumber > 7)
			ledNumber = 2;
		toggleLED(ledNumber);
		ledNumber++;
		vTaskDelayUntil(&xLastWakeTime, 100);
	}
}

void v2FirstTask( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	while(!switchOn(0))
	{
		vTaskDelayUntil(&xLastWakeTime, 50);
	}
	xSemaphoreGive(xSemaphore1);
}

void v2SecondTask( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	while(1)
	{
		if(xSemaphore1 != NULL)
		{
			if(xSemaphoreTake(xSemaphore1, 0) == pdTRUE);
			{
				turnOnLED(7);
				vTaskDelayUntil(&xLastWakeTime, 50);			
			}
			turnOffLED(7);
		}	
	}	
}

void v3FirstTask( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	while(1)
	{
		while(switchStatus() != 0b00000001)
		{
			vTaskDelayUntil(&xLastWakeTime, 50);
		}
		if(xQueue1 != NULL)
		{
			while(xSemaphoreTake(xSemaphore2, portMAX_DELAY) != pdTRUE)
			{}
				
			if(count < 255)
				++count;
				
			xQueueSendToBack(xQueue1, &count, portMAX_DELAY);		
		
			xSemaphoreGive(xSemaphore2);
			vTaskDelayUntil(&xLastWakeTime, 250);			
		}		
	}	
}

void v3SecondTask( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	
	while(1)
	{
		while(switchStatus() != 0b00000010)
		{
			vTaskDelayUntil(&xLastWakeTime, 50);
		}
		if(xQueue1 != NULL)
		{
			while(xSemaphoreTake(xSemaphore2, portMAX_DELAY) != pdTRUE)
		{}
			
			if(count > 0)
				--count;
			
			xQueueSendToBack(xQueue1, &count, portMAX_DELAY);
			
			xSemaphoreGive(xSemaphore2);
			vTaskDelayUntil(&xLastWakeTime, 250);
		}
	}
}

void v3ThirdTask( void *pvParameters )
{
	portTickType xLastWakeTime;
	xLastWakeTime = xTaskGetTickCount();
	unsigned char currentChar = NULL;
	
	while(1)
	{
		if(xQueue1 != NULL)
		{
			if(xQueueReceive(xQueue1, &currentChar, portMAX_DELAY) == pdTRUE)
			{
				//Send to terminal
				SendString("New number: ");
				SendInteger(currentChar);
				SendChar('\n');
				SendChar('\r');
				
				//Write on board
				PORTC = ~currentChar;
			}
		}
	}
}


int main(void)
{
	initLEDport();
	initSwitchPort();
	InitUART(115200, 8);
	//vSemaphoreCreateBinary(xSemaphore1);
	xSemaphore2 = xSemaphoreCreateMutex(); //Mutex
	xQueue1 = xQueueCreate(10, sizeof(unsigned char)); //Queue 10 big containing 'unsigned char'
	
	//xTaskCreate(vLEDFlashTask1, (signed char *) "LED1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(vLEDFlashTask2, (signed char *) "LED2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(vLEDFlashTask3, (signed char *) "LED3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	
	//xTaskCreate(v2FirstTask, (signed char *) "Task1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	//xTaskCreate(v2SecondTask, (signed char *) "Task2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	
	xTaskCreate(v3FirstTask, (signed char *) "Task1", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	xTaskCreate(v3SecondTask, (signed char *) "Task2", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	xTaskCreate(v3ThirdTask, (signed char *) "Task3", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	
	vTaskStartScheduler();
	while(1)
	{}
}