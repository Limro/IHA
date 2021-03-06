/*
 * system.h - SOPC Builder system and BSP software package information
 *
 * Machine generated for CPU 'cpu_0' in SOPC Builder design 'CPU_System'
 * SOPC Builder design path: C:/Users/Anders/AlteraWorkspace/KeyboardSound/CPU_System.sopcinfo
 *
 * Generated: Thu Apr 04 14:15:30 CEST 2013
 */

/*
 * DO NOT MODIFY THIS FILE
 *
 * Changing this file will have subtle consequences
 * which will almost certainly lead to a nonfunctioning
 * system. If you do modify this file, be aware that your
 * changes will be overwritten and lost when this file
 * is generated again.
 *
 * DO NOT MODIFY THIS FILE
 */

/*
 * License Agreement
 *
 * Copyright (c) 2008
 * Altera Corporation, San Jose, California, USA.
 * All rights reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 *
 * This agreement shall be governed in all respects by the laws of the State
 * of California and by the laws of the United States of America.
 */

#ifndef __SYSTEM_H_
#define __SYSTEM_H_

/* Include definitions from linker script generator */
#include "linker.h"


/*
 * CPU configuration
 *
 */

#define ALT_CPU_ARCHITECTURE "altera_nios2"
#define ALT_CPU_BIG_ENDIAN 0
#define ALT_CPU_BREAK_ADDR 0x100820
#define ALT_CPU_CPU_FREQ 50000000u
#define ALT_CPU_CPU_ID_SIZE 1
#define ALT_CPU_CPU_ID_VALUE 0x0
#define ALT_CPU_CPU_IMPLEMENTATION "tiny"
#define ALT_CPU_DATA_ADDR_WIDTH 0x15
#define ALT_CPU_DCACHE_LINE_SIZE 0
#define ALT_CPU_DCACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_DCACHE_SIZE 0
#define ALT_CPU_EXCEPTION_ADDR 0x80020
#define ALT_CPU_FLUSHDA_SUPPORTED
#define ALT_CPU_FREQ 50000000
#define ALT_CPU_HARDWARE_DIVIDE_PRESENT 0
#define ALT_CPU_HARDWARE_MULTIPLY_PRESENT 0
#define ALT_CPU_HARDWARE_MULX_PRESENT 0
#define ALT_CPU_HAS_DEBUG_CORE 1
#define ALT_CPU_HAS_DEBUG_STUB
#define ALT_CPU_HAS_JMPI_INSTRUCTION
#define ALT_CPU_ICACHE_LINE_SIZE 0
#define ALT_CPU_ICACHE_LINE_SIZE_LOG2 0
#define ALT_CPU_ICACHE_SIZE 0
#define ALT_CPU_INST_ADDR_WIDTH 0x15
#define ALT_CPU_NAME "cpu_0"
#define ALT_CPU_RESET_ADDR 0x80000


/*
 * CPU configuration (with legacy prefix - don't use these anymore)
 *
 */

#define NIOS2_BIG_ENDIAN 0
#define NIOS2_BREAK_ADDR 0x100820
#define NIOS2_CPU_FREQ 50000000u
#define NIOS2_CPU_ID_SIZE 1
#define NIOS2_CPU_ID_VALUE 0x0
#define NIOS2_CPU_IMPLEMENTATION "tiny"
#define NIOS2_DATA_ADDR_WIDTH 0x15
#define NIOS2_DCACHE_LINE_SIZE 0
#define NIOS2_DCACHE_LINE_SIZE_LOG2 0
#define NIOS2_DCACHE_SIZE 0
#define NIOS2_EXCEPTION_ADDR 0x80020
#define NIOS2_FLUSHDA_SUPPORTED
#define NIOS2_HARDWARE_DIVIDE_PRESENT 0
#define NIOS2_HARDWARE_MULTIPLY_PRESENT 0
#define NIOS2_HARDWARE_MULX_PRESENT 0
#define NIOS2_HAS_DEBUG_CORE 1
#define NIOS2_HAS_DEBUG_STUB
#define NIOS2_HAS_JMPI_INSTRUCTION
#define NIOS2_ICACHE_LINE_SIZE 0
#define NIOS2_ICACHE_LINE_SIZE_LOG2 0
#define NIOS2_ICACHE_SIZE 0
#define NIOS2_INST_ADDR_WIDTH 0x15
#define NIOS2_RESET_ADDR 0x80000


/*
 * Define for each module class mastered by the CPU
 *
 */

#define __ALTERA_AVALON_JTAG_UART
#define __ALTERA_AVALON_LCD_16207
#define __ALTERA_AVALON_PIO
#define __ALTERA_AVALON_SYSID
#define __ALTERA_AVALON_TIMER
#define __ALTERA_NIOS2
#define __ALTERA_UP_AVALON_AUDIO_AND_VIDEO_CONFIG
#define __ALTERA_UP_AVALON_PS2
#define __ALTERA_UP_AVALON_SRAM
#define __MM_BUS_SEVEN_SEG_FOUR_DIGIT
#define __RAM_SOUND


/*
 * RAM_Sound_0 configuration
 *
 */

#define ALT_MODULE_CLASS_RAM_Sound_0 RAM_Sound
#define RAM_SOUND_0_BASE 0x0
#define RAM_SOUND_0_IRQ -1
#define RAM_SOUND_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define RAM_SOUND_0_NAME "/dev/RAM_Sound_0"
#define RAM_SOUND_0_SPAN 1024
#define RAM_SOUND_0_TYPE "RAM_Sound"


/*
 * System configuration
 *
 */

#define ALT_DEVICE_FAMILY "CYCLONEII"
#define ALT_IRQ_BASE NULL
#define ALT_LEGACY_INTERRUPT_API_PRESENT
#define ALT_LOG_PORT "/dev/null"
#define ALT_LOG_PORT_BASE 0x0
#define ALT_LOG_PORT_DEV null
#define ALT_LOG_PORT_TYPE ""
#define ALT_NUM_EXTERNAL_INTERRUPT_CONTROLLERS 0
#define ALT_NUM_INTERNAL_INTERRUPT_CONTROLLERS 1
#define ALT_NUM_INTERRUPT_CONTROLLERS 1
#define ALT_STDERR "/dev/jtag_uart_0"
#define ALT_STDERR_BASE 0x1016b0
#define ALT_STDERR_DEV jtag_uart_0
#define ALT_STDERR_IS_JTAG_UART
#define ALT_STDERR_PRESENT
#define ALT_STDERR_TYPE "altera_avalon_jtag_uart"
#define ALT_STDIN "/dev/jtag_uart_0"
#define ALT_STDIN_BASE 0x1016b0
#define ALT_STDIN_DEV jtag_uart_0
#define ALT_STDIN_IS_JTAG_UART
#define ALT_STDIN_PRESENT
#define ALT_STDIN_TYPE "altera_avalon_jtag_uart"
#define ALT_STDOUT "/dev/jtag_uart_0"
#define ALT_STDOUT_BASE 0x1016b0
#define ALT_STDOUT_DEV jtag_uart_0
#define ALT_STDOUT_IS_JTAG_UART
#define ALT_STDOUT_PRESENT
#define ALT_STDOUT_TYPE "altera_avalon_jtag_uart"
#define ALT_SYSTEM_NAME "CPU_System"


/*
 * audio_and_video_config_0 configuration
 *
 */

#define ALT_MODULE_CLASS_audio_and_video_config_0 altera_up_avalon_audio_and_video_config
#define AUDIO_AND_VIDEO_CONFIG_0_BASE 0x101640
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ -1
#define AUDIO_AND_VIDEO_CONFIG_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define AUDIO_AND_VIDEO_CONFIG_0_NAME "/dev/audio_and_video_config_0"
#define AUDIO_AND_VIDEO_CONFIG_0_SPAN 16
#define AUDIO_AND_VIDEO_CONFIG_0_TYPE "altera_up_avalon_audio_and_video_config"


/*
 * hal configuration
 *
 */

#define ALT_MAX_FD 32
#define ALT_SYS_CLK TIMER_SYSTEM
#define ALT_TIMESTAMP_CLK TIMER_TIMESTAMP


/*
 * jtag_uart_0 configuration
 *
 */

#define ALT_MODULE_CLASS_jtag_uart_0 altera_avalon_jtag_uart
#define JTAG_UART_0_BASE 0x1016b0
#define JTAG_UART_0_IRQ 0
#define JTAG_UART_0_IRQ_INTERRUPT_CONTROLLER_ID 0
#define JTAG_UART_0_NAME "/dev/jtag_uart_0"
#define JTAG_UART_0_READ_DEPTH 64
#define JTAG_UART_0_READ_THRESHOLD 8
#define JTAG_UART_0_SPAN 8
#define JTAG_UART_0_TYPE "altera_avalon_jtag_uart"
#define JTAG_UART_0_WRITE_DEPTH 64
#define JTAG_UART_0_WRITE_THRESHOLD 8


/*
 * lcd_0 configuration
 *
 */

#define ALT_MODULE_CLASS_lcd_0 altera_avalon_lcd_16207
#define LCD_0_BASE 0x101660
#define LCD_0_IRQ -1
#define LCD_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define LCD_0_NAME "/dev/lcd_0"
#define LCD_0_SPAN 16
#define LCD_0_TYPE "altera_avalon_lcd_16207"


/*
 * mm_bus_seven_seg_four_digit_0 configuration
 *
 */

#define ALT_MODULE_CLASS_mm_bus_seven_seg_four_digit_0 mm_bus_seven_seg_four_digit
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_BASE 0x101400
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_IRQ -1
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_NAME "/dev/mm_bus_seven_seg_four_digit_0"
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_SPAN 512
#define MM_BUS_SEVEN_SEG_FOUR_DIGIT_0_TYPE "mm_bus_seven_seg_four_digit"


/*
 * pio_input_key configuration
 *
 */

#define ALT_MODULE_CLASS_pio_input_key altera_avalon_pio
#define PIO_INPUT_KEY_BASE 0x101650
#define PIO_INPUT_KEY_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_INPUT_KEY_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_INPUT_KEY_CAPTURE 0
#define PIO_INPUT_KEY_DATA_WIDTH 3
#define PIO_INPUT_KEY_DO_TEST_BENCH_WIRING 0
#define PIO_INPUT_KEY_DRIVEN_SIM_VALUE 0x0
#define PIO_INPUT_KEY_EDGE_TYPE "NONE"
#define PIO_INPUT_KEY_FREQ 50000000u
#define PIO_INPUT_KEY_HAS_IN 1
#define PIO_INPUT_KEY_HAS_OUT 0
#define PIO_INPUT_KEY_HAS_TRI 0
#define PIO_INPUT_KEY_IRQ -1
#define PIO_INPUT_KEY_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_INPUT_KEY_IRQ_TYPE "NONE"
#define PIO_INPUT_KEY_NAME "/dev/pio_input_key"
#define PIO_INPUT_KEY_RESET_VALUE 0x0
#define PIO_INPUT_KEY_SPAN 16
#define PIO_INPUT_KEY_TYPE "altera_avalon_pio"


/*
 * pio_input_sw configuration
 *
 */

#define ALT_MODULE_CLASS_pio_input_sw altera_avalon_pio
#define PIO_INPUT_SW_BASE 0x101670
#define PIO_INPUT_SW_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_INPUT_SW_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_INPUT_SW_CAPTURE 0
#define PIO_INPUT_SW_DATA_WIDTH 8
#define PIO_INPUT_SW_DO_TEST_BENCH_WIRING 0
#define PIO_INPUT_SW_DRIVEN_SIM_VALUE 0x0
#define PIO_INPUT_SW_EDGE_TYPE "NONE"
#define PIO_INPUT_SW_FREQ 50000000u
#define PIO_INPUT_SW_HAS_IN 1
#define PIO_INPUT_SW_HAS_OUT 0
#define PIO_INPUT_SW_HAS_TRI 0
#define PIO_INPUT_SW_IRQ -1
#define PIO_INPUT_SW_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_INPUT_SW_IRQ_TYPE "NONE"
#define PIO_INPUT_SW_NAME "/dev/pio_input_sw"
#define PIO_INPUT_SW_RESET_VALUE 0x0
#define PIO_INPUT_SW_SPAN 16
#define PIO_INPUT_SW_TYPE "altera_avalon_pio"


/*
 * pio_output_0 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_output_0 altera_avalon_pio
#define PIO_OUTPUT_0_BASE 0x101690
#define PIO_OUTPUT_0_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_OUTPUT_0_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_OUTPUT_0_CAPTURE 0
#define PIO_OUTPUT_0_DATA_WIDTH 8
#define PIO_OUTPUT_0_DO_TEST_BENCH_WIRING 0
#define PIO_OUTPUT_0_DRIVEN_SIM_VALUE 0x0
#define PIO_OUTPUT_0_EDGE_TYPE "NONE"
#define PIO_OUTPUT_0_FREQ 50000000u
#define PIO_OUTPUT_0_HAS_IN 0
#define PIO_OUTPUT_0_HAS_OUT 1
#define PIO_OUTPUT_0_HAS_TRI 0
#define PIO_OUTPUT_0_IRQ -1
#define PIO_OUTPUT_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_OUTPUT_0_IRQ_TYPE "NONE"
#define PIO_OUTPUT_0_NAME "/dev/pio_output_0"
#define PIO_OUTPUT_0_RESET_VALUE 0x0
#define PIO_OUTPUT_0_SPAN 16
#define PIO_OUTPUT_0_TYPE "altera_avalon_pio"


/*
 * pio_output_1 configuration
 *
 */

#define ALT_MODULE_CLASS_pio_output_1 altera_avalon_pio
#define PIO_OUTPUT_1_BASE 0x101680
#define PIO_OUTPUT_1_BIT_CLEARING_EDGE_REGISTER 0
#define PIO_OUTPUT_1_BIT_MODIFYING_OUTPUT_REGISTER 0
#define PIO_OUTPUT_1_CAPTURE 0
#define PIO_OUTPUT_1_DATA_WIDTH 8
#define PIO_OUTPUT_1_DO_TEST_BENCH_WIRING 0
#define PIO_OUTPUT_1_DRIVEN_SIM_VALUE 0x0
#define PIO_OUTPUT_1_EDGE_TYPE "NONE"
#define PIO_OUTPUT_1_FREQ 50000000u
#define PIO_OUTPUT_1_HAS_IN 0
#define PIO_OUTPUT_1_HAS_OUT 1
#define PIO_OUTPUT_1_HAS_TRI 0
#define PIO_OUTPUT_1_IRQ -1
#define PIO_OUTPUT_1_IRQ_INTERRUPT_CONTROLLER_ID -1
#define PIO_OUTPUT_1_IRQ_TYPE "NONE"
#define PIO_OUTPUT_1_NAME "/dev/pio_output_1"
#define PIO_OUTPUT_1_RESET_VALUE 0x0
#define PIO_OUTPUT_1_SPAN 16
#define PIO_OUTPUT_1_TYPE "altera_avalon_pio"


/*
 * ps2_port configuration
 *
 */

#define ALT_MODULE_CLASS_ps2_port altera_up_avalon_ps2
#define PS2_PORT_BASE 0x1016a0
#define PS2_PORT_IRQ 3
#define PS2_PORT_IRQ_INTERRUPT_CONTROLLER_ID 0
#define PS2_PORT_NAME "/dev/ps2_port"
#define PS2_PORT_SPAN 8
#define PS2_PORT_TYPE "altera_up_avalon_ps2"


/*
 * sram_0 configuration
 *
 */

#define ALT_MODULE_CLASS_sram_0 altera_up_avalon_sram
#define SRAM_0_BASE 0x80000
#define SRAM_0_IRQ -1
#define SRAM_0_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SRAM_0_NAME "/dev/sram_0"
#define SRAM_0_SPAN 524288
#define SRAM_0_TYPE "altera_up_avalon_sram"


/*
 * sysid configuration
 *
 */

#define ALT_MODULE_CLASS_sysid altera_avalon_sysid
#define SYSID_BASE 0x1016a8
#define SYSID_ID 0u
#define SYSID_IRQ -1
#define SYSID_IRQ_INTERRUPT_CONTROLLER_ID -1
#define SYSID_NAME "/dev/sysid"
#define SYSID_SPAN 8
#define SYSID_TIMESTAMP 1365077152u
#define SYSID_TYPE "altera_avalon_sysid"


/*
 * timer_system configuration
 *
 */

#define ALT_MODULE_CLASS_timer_system altera_avalon_timer
#define TIMER_SYSTEM_ALWAYS_RUN 0
#define TIMER_SYSTEM_BASE 0x101600
#define TIMER_SYSTEM_COUNTER_SIZE 32
#define TIMER_SYSTEM_FIXED_PERIOD 0
#define TIMER_SYSTEM_FREQ 50000000u
#define TIMER_SYSTEM_IRQ 2
#define TIMER_SYSTEM_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_SYSTEM_LOAD_VALUE 49999ull
#define TIMER_SYSTEM_MULT 0.0010
#define TIMER_SYSTEM_NAME "/dev/timer_system"
#define TIMER_SYSTEM_PERIOD 1
#define TIMER_SYSTEM_PERIOD_UNITS "ms"
#define TIMER_SYSTEM_RESET_OUTPUT 0
#define TIMER_SYSTEM_SNAPSHOT 1
#define TIMER_SYSTEM_SPAN 32
#define TIMER_SYSTEM_TICKS_PER_SEC 1000u
#define TIMER_SYSTEM_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_SYSTEM_TYPE "altera_avalon_timer"


/*
 * timer_timestamp configuration
 *
 */

#define ALT_MODULE_CLASS_timer_timestamp altera_avalon_timer
#define TIMER_TIMESTAMP_ALWAYS_RUN 0
#define TIMER_TIMESTAMP_BASE 0x101620
#define TIMER_TIMESTAMP_COUNTER_SIZE 32
#define TIMER_TIMESTAMP_FIXED_PERIOD 0
#define TIMER_TIMESTAMP_FREQ 50000000u
#define TIMER_TIMESTAMP_IRQ 1
#define TIMER_TIMESTAMP_IRQ_INTERRUPT_CONTROLLER_ID 0
#define TIMER_TIMESTAMP_LOAD_VALUE 49999ull
#define TIMER_TIMESTAMP_MULT 0.0010
#define TIMER_TIMESTAMP_NAME "/dev/timer_timestamp"
#define TIMER_TIMESTAMP_PERIOD 1
#define TIMER_TIMESTAMP_PERIOD_UNITS "ms"
#define TIMER_TIMESTAMP_RESET_OUTPUT 0
#define TIMER_TIMESTAMP_SNAPSHOT 1
#define TIMER_TIMESTAMP_SPAN 32
#define TIMER_TIMESTAMP_TICKS_PER_SEC 1000u
#define TIMER_TIMESTAMP_TIMEOUT_PULSE_OUTPUT 0
#define TIMER_TIMESTAMP_TYPE "altera_avalon_timer"

#endif /* __SYSTEM_H_ */
