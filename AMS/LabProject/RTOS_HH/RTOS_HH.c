/******************************************************
FreeRTOS demo program.
Implementing 2 tasks, each blinking a LED.

STK500 setup:
  * PORTC connected to LEDS.

Henning Hargaard 8.2.2012
*******************************************************/

#define QueueType int

#include <avr/io.h>
#include <avr/delay.h>
#include "FreeRTOS.h"
#include "task.h"
#include "led.h"
#include "uart.h"
#include "semphr.h"
#include "queue.h"

xSemaphoreHandle xSemaphore1 = NULL;
xQueueHandle xQueue1 = NULL;

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
				//funktion(currentValue);
				
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


int main(void)
{	
	xSemaphore1 = xSemaphoreCreateMutex(); //Mutex
	xQueue1 = xQueueCreate(10, sizeof(QueueType)); //Queue 10 big containing 'unsigned char'
		
	xTaskCreate(LM75SensorTask, (signed char *) "LM75Sensor", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	xTaskCreate(Lcd162Task, (signed char *) "Lcd", configMINIMAL_STACK_SIZE, NULL, tskIDLE_PRIORITY, NULL);
	vTaskStartScheduler();
	while(1)
	{}
		
}