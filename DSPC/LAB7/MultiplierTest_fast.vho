-- Copyright (C) 1991-2012 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 12.1 Build 177 11/07/2012 SJ Full Version"

-- DATE "02/20/2013 11:58:49"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	MultiplierTest IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	inA : IN std_logic_vector(7 DOWNTO 0);
	inB : IN std_logic_vector(7 DOWNTO 0);
	outAB : OUT std_logic_vector(15 DOWNTO 0)
	);
END MultiplierTest;

-- Design Ports Information
-- outAB[0]	=>  Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[1]	=>  Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[2]	=>  Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[3]	=>  Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[4]	=>  Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[5]	=>  Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[6]	=>  Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[7]	=>  Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[8]	=>  Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[9]	=>  Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[10]	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[11]	=>  Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[12]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[13]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[14]	=>  Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- outAB[15]	=>  Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[1]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[0]	=>  Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[0]	=>  Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[1]	=>  Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[3]	=>  Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[2]	=>  Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[2]	=>  Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[3]	=>  Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[4]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[5]	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[4]	=>  Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[5]	=>  Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[6]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[6]	=>  Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inA[7]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- inB[7]	=>  Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF MultiplierTest IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_inA : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_inB : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_outAB : std_logic_vector(15 DOWNTO 0);
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe77~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe91~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe99~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe106~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe111~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe122~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe130~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe138~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe146~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe154~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe159~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe167~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe177~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe77~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe91~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe99~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe106~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe111~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe122~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe121~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe130~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe129~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe138~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe137~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe146~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe145~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe154~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe153~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe164~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe159~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe170~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe167~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe177~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe11~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe113~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe31~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe121~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe121~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe129~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe129~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe42~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe137~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe137~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe145~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe145~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe50~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe153~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe153~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe164~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe66~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe83~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe65~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe78~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe82~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe92~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe89~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe98~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe108~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe104~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe116~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe112~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe124~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe132~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe140~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe148~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe156~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe161~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe171~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe169~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe3~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe6~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe10~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe13~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe17~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe21~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe20~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe22~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe24~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe23~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe27~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe29~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe36~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe37~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|op_5~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe34~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe32~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|op_5~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe40~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|op_5~2_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe46~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe44~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe53~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe54~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[0]~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[2]~2_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[1]~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|_~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[3]~2_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[6]~6_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[3]~2_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[5]~4_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[4]~3_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[8]~8_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[6]~5_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[7]~6_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[5]~4_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[8]~7_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[6]~5_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[7]~6_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[8]~7_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe37~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe46~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe89~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe156~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe11~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe66~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe65~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe78~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe82~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe98~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe108~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe104~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe116~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe112~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe124~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe171~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe36~feeder_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe4~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe4~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe67~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe67~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe68~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe68~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe63~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe63~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe64~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe64~regout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \outAB[0]~reg0_regout\ : std_logic;
SIGNAL \inB_reg[0]~feeder_combout\ : std_logic;
SIGNAL \inA_reg[1]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[1]~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe5~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe71~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe71~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe72~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe72~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe63~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe69~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe69~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe70~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe70~regout\ : std_logic;
SIGNAL \outAB[1]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[1]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|_~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe8~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe75~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe75~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe76~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe76~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe69~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe73~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe73~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe74~regout\ : std_logic;
SIGNAL \outAB[2]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[2]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[3]~3_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe9~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe85~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe85~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe7~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe7~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe79~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe79~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe77~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe84~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe84~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe73~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe80~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe80~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe81~regout\ : std_logic;
SIGNAL \outAB[3]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[2]~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe12~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe90~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe90~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe84~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe88~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe88~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe80~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe86~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe86~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe87~regout\ : std_logic;
SIGNAL \outAB[4]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\ : std_logic;
SIGNAL \inB_reg[4]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[1]~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe16~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe97~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe97~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe88~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe96~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe96~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe86~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe94~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe94~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe95~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe95~regout\ : std_logic;
SIGNAL \outAB[5]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[5]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w204w[2]~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe18~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe105~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe105~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe96~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe103~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe103~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe94~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe101~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe101~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe102~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe102~regout\ : std_logic;
SIGNAL \outAB[6]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|_~2_combout\ : std_logic;
SIGNAL \inB_reg[5]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe25~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe115~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe115~regout\ : std_logic;
SIGNAL \inA_reg[4]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w156w[4]~3_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe19~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe107~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe107~regout\ : std_logic;
SIGNAL \inA_reg[5]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[5]~5_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe15~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe100~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe100~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[4]~4_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe14~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe93~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe93~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe91~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe99~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe106~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe114~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe114~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe101~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe109~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe109~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe110~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe110~regout\ : std_logic;
SIGNAL \outAB[7]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[7]~reg0_regout\ : std_logic;
SIGNAL \inB_reg[7]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe28~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe120~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe120~regout\ : std_logic;
SIGNAL \inA_reg[7]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|w101w[7]~7_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe26~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe113~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe113~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe103~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe111~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe119~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe119~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe109~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe117~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe117~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe118~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe118~regout\ : std_logic;
SIGNAL \outAB[8]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe33~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe128~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe128~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe119~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe127~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe127~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe117~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe125~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe125~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe126~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe126~regout\ : std_logic;
SIGNAL \outAB[9]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[9]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe41~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe136~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe136~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe127~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe135~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe135~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe125~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe133~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe133~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe134~regout\ : std_logic;
SIGNAL \outAB[10]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[10]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe45~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe144~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe144~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe135~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe143~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe143~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe133~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe141~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe141~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe142~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe142~regout\ : std_logic;
SIGNAL \outAB[11]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[11]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe47~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe152~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe152~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe143~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe151~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe151~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe141~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe149~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe149~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe150~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe150~regout\ : std_logic;
SIGNAL \outAB[12]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe51~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe51~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe163~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe163~regout\ : std_logic;
SIGNAL \inA_reg[6]~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe48~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe155~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe155~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe43~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe147~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe38~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe139~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe35~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe131~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe131~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe30~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe123~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe123~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe114~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe122~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe130~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe138~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe146~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe154~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe162~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe162~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe149~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe157~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe157~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe158~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe158~regout\ : std_logic;
SIGNAL \outAB[13]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[13]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe162~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe170~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe170~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe157~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe165~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe165~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe166~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe166~regout\ : std_logic;
SIGNAL \outAB[14]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[14]~reg0_regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe56~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe168~feeder_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe168~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe52~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe160~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe151~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe159~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe167~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe174~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe174~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe165~2\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe172~1_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe172~regout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|dffe173~regout\ : std_logic;
SIGNAL \outAB[15]~reg0feeder_combout\ : std_logic;
SIGNAL \outAB[15]~reg0_regout\ : std_logic;
SIGNAL inB_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL inA_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL \GenPipelinedMult:mult1|auto_generated|w294w\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \GenPipelinedMult:mult1|auto_generated|w258w\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inB~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inA~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset~clkctrl_outclk\ : std_logic;
SIGNAL ALT_INV_inB_reg : std_logic_vector(1 DOWNTO 1);
SIGNAL \GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe11~0_combout\ : std_logic;
SIGNAL \GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe8~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_inA <= inA;
ww_inB <= inB;
outAB <= ww_outAB;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~combout\);
\ALT_INV_reset~clkctrl_outclk\ <= NOT \reset~clkctrl_outclk\;
ALT_INV_inB_reg(1) <= NOT inB_reg(1);
\GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe11~0_combout\ <= NOT \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\;
\GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe8~0_combout\ <= NOT \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\;

-- Location: LCFF_X48_Y33_N1
\GenPipelinedMult:mult1|auto_generated|dffe77\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe77~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe77~regout\);

-- Location: LCFF_X47_Y32_N1
\GenPipelinedMult:mult1|auto_generated|dffe91\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe91~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe91~regout\);

-- Location: LCFF_X47_Y32_N3
\GenPipelinedMult:mult1|auto_generated|dffe99\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe99~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe99~regout\);

-- Location: LCFF_X47_Y32_N5
\GenPipelinedMult:mult1|auto_generated|dffe106\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe106~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe106~regout\);

-- Location: LCFF_X48_Y33_N11
\GenPipelinedMult:mult1|auto_generated|dffe111\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe111~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe111~regout\);

-- Location: LCFF_X47_Y32_N9
\GenPipelinedMult:mult1|auto_generated|dffe122\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe122~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe122~regout\);

-- Location: LCFF_X47_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe130\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe130~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe130~regout\);

-- Location: LCFF_X47_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe138\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe138~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe138~regout\);

-- Location: LCFF_X47_Y32_N15
\GenPipelinedMult:mult1|auto_generated|dffe146\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe146~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe146~regout\);

-- Location: LCFF_X47_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe154\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe154~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe154~regout\);

-- Location: LCFF_X48_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe159\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe159~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe159~regout\);

-- Location: LCFF_X48_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe167\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe167~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe167~regout\);

-- Location: LCFF_X47_Y32_N23
\GenPipelinedMult:mult1|auto_generated|dffe177\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe177~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe177~regout\);

-- Location: LCCOMB_X48_Y33_N0
\GenPipelinedMult:mult1|auto_generated|dffe77~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe77~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe78~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe79~regout\ $ (VCC))) # (!\GenPipelinedMult:mult1|auto_generated|dffe78~regout\ & 
-- (\GenPipelinedMult:mult1|auto_generated|dffe79~regout\ & VCC))
-- \GenPipelinedMult:mult1|auto_generated|dffe77~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe78~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe79~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe78~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe79~regout\,
	datad => VCC,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe77~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe77~2\);

-- Location: LCCOMB_X47_Y32_N0
\GenPipelinedMult:mult1|auto_generated|dffe91~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe91~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe92~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe93~regout\ $ (VCC))) # (!\GenPipelinedMult:mult1|auto_generated|dffe92~regout\ & 
-- (\GenPipelinedMult:mult1|auto_generated|dffe93~regout\ & VCC))
-- \GenPipelinedMult:mult1|auto_generated|dffe91~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe92~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe93~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe92~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe93~regout\,
	datad => VCC,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe91~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe91~2\);

-- Location: LCCOMB_X47_Y32_N2
\GenPipelinedMult:mult1|auto_generated|dffe99~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe99~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe100~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe91~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe100~regout\ & 
-- ((\GenPipelinedMult:mult1|auto_generated|dffe91~2\) # (GND)))
-- \GenPipelinedMult:mult1|auto_generated|dffe99~2\ = CARRY((!\GenPipelinedMult:mult1|auto_generated|dffe91~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe100~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \GenPipelinedMult:mult1|auto_generated|dffe100~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe91~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe99~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe99~2\);

-- Location: LCCOMB_X47_Y32_N4
\GenPipelinedMult:mult1|auto_generated|dffe106~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe106~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe108~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe107~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe99~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe106~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe108~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe107~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe99~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe108~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe107~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe99~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe108~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe107~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe99~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe106~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe106~2\);

-- Location: LCCOMB_X48_Y33_N10
\GenPipelinedMult:mult1|auto_generated|dffe111~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe111~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe112~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe113~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe103~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe113~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe103~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe112~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe113~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe103~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe113~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe103~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe111~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe112~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe113~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe103~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe112~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe103~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe113~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe112~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe113~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe103~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe111~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe111~2\);

-- Location: LCCOMB_X47_Y32_N8
\GenPipelinedMult:mult1|auto_generated|dffe122~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe122~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe124~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe123~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe114~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe122~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe124~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe123~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe114~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe124~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe123~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe114~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe124~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe123~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe114~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe122~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe122~2\);

-- Location: LCFF_X45_Y33_N7
\GenPipelinedMult:mult1|auto_generated|dffe121\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe121~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe121~regout\);

-- Location: LCCOMB_X47_Y32_N10
\GenPipelinedMult:mult1|auto_generated|dffe130~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe130~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe132~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe131~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe122~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe131~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe122~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe132~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe131~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe122~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe131~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe122~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe130~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe132~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe131~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe122~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe132~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe122~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe131~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe132~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe131~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe122~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe130~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe130~2\);

-- Location: LCFF_X45_Y33_N9
\GenPipelinedMult:mult1|auto_generated|dffe129\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe129~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe129~regout\);

-- Location: LCCOMB_X47_Y32_N12
\GenPipelinedMult:mult1|auto_generated|dffe138~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe138~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe140~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe139~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe130~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe138~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe140~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe139~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe130~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe140~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe139~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe130~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe140~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe139~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe130~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe138~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe138~2\);

-- Location: LCFF_X45_Y33_N11
\GenPipelinedMult:mult1|auto_generated|dffe137\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe137~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe137~regout\);

-- Location: LCCOMB_X47_Y32_N14
\GenPipelinedMult:mult1|auto_generated|dffe146~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe146~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe148~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe147~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe138~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe147~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe138~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe148~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe147~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe138~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe147~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe138~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe146~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe148~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe147~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe138~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe148~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe138~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe147~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe148~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe147~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe138~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe146~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe146~2\);

-- Location: LCFF_X45_Y33_N13
\GenPipelinedMult:mult1|auto_generated|dffe145\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe145~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe145~regout\);

-- Location: LCCOMB_X47_Y32_N16
\GenPipelinedMult:mult1|auto_generated|dffe154~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe154~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe156~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe155~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe146~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe154~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe156~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe155~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe146~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe156~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe155~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe146~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe156~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe155~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe146~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe154~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe154~2\);

-- Location: LCFF_X45_Y33_N15
\GenPipelinedMult:mult1|auto_generated|dffe153\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe153~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe153~regout\);

-- Location: LCFF_X45_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe164\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe164~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe164~regout\);

-- Location: LCCOMB_X48_Y33_N22
\GenPipelinedMult:mult1|auto_generated|dffe159~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe159~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe161~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe160~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe151~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe160~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe151~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe161~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe160~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe151~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe160~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe151~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe159~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe161~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe160~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe151~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe161~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe151~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe160~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe161~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe160~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe151~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe159~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe159~2\);

-- Location: LCCOMB_X47_Y32_N20
\GenPipelinedMult:mult1|auto_generated|dffe170~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe170~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe171~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe162~2\ $ (GND))) # (!\GenPipelinedMult:mult1|auto_generated|dffe171~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe162~2\ & VCC))
-- \GenPipelinedMult:mult1|auto_generated|dffe170~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe171~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe162~2\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe171~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe162~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe170~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe170~2\);

-- Location: LCCOMB_X48_Y33_N24
\GenPipelinedMult:mult1|auto_generated|dffe167~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe167~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe169~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe168~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe159~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe167~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe169~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe168~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe159~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe169~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe168~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe159~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe169~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe168~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe159~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe167~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe167~2\);

-- Location: LCCOMB_X47_Y32_N22
\GenPipelinedMult:mult1|auto_generated|dffe177~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe177~1_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe170~2\ $ (\GenPipelinedMult:mult1|auto_generated|dffe171~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe171~regout\,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe170~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe177~1_combout\);

-- Location: LCFF_X47_Y33_N9
\GenPipelinedMult:mult1|auto_generated|dffe11\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe11~feeder_combout\,
	sdata => \GenPipelinedMult:mult1|auto_generated|_~1_combout\,
	sload => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe11~regout\);

-- Location: LCCOMB_X45_Y33_N4
\GenPipelinedMult:mult1|auto_generated|dffe113~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe113~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe24~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe26~regout\ $ (VCC))) # (!\GenPipelinedMult:mult1|auto_generated|dffe24~regout\ & 
-- (\GenPipelinedMult:mult1|auto_generated|dffe26~regout\ & VCC))
-- \GenPipelinedMult:mult1|auto_generated|dffe113~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe24~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe26~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe24~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe26~regout\,
	datad => VCC,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe113~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe113~2\);

-- Location: LCFF_X46_Y33_N1
\GenPipelinedMult:mult1|auto_generated|dffe31\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[8]~8_combout\,
	sclr => ALT_INV_inB_reg(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe31~regout\);

-- Location: LCCOMB_X45_Y33_N6
\GenPipelinedMult:mult1|auto_generated|dffe121~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe121~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe29~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe31~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe113~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe31~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe113~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe29~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe31~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe113~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe31~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe113~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe121~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe29~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe31~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe113~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe29~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe113~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe31~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe29~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe31~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe113~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe121~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe121~2\);

-- Location: LCCOMB_X45_Y33_N8
\GenPipelinedMult:mult1|auto_generated|dffe129~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe129~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe32~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe34~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe121~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe129~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe32~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe34~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe121~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe32~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe34~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe121~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe32~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe34~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe121~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe129~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe129~2\);

-- Location: LCFF_X45_Y34_N17
\GenPipelinedMult:mult1|auto_generated|dffe42\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[8]~7_combout\,
	sclr => \GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe42~regout\);

-- Location: LCCOMB_X45_Y33_N10
\GenPipelinedMult:mult1|auto_generated|dffe137~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe137~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe42~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe40~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe129~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe40~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe129~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe42~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe40~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe129~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe40~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe129~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe137~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe42~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe40~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe129~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe42~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe129~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe40~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe42~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe40~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe129~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe137~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe137~2\);

-- Location: LCCOMB_X45_Y33_N12
\GenPipelinedMult:mult1|auto_generated|dffe145~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe145~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe46~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe44~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe137~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe145~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe46~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe44~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe137~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe46~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe44~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe137~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe46~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe44~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe137~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe145~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe145~2\);

-- Location: LCFF_X45_Y33_N1
\GenPipelinedMult:mult1|auto_generated|dffe50\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[8]~7_combout\,
	sclr => \GenPipelinedMult:mult1|auto_generated|ALT_INV_dffe11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe50~regout\);

-- Location: LCCOMB_X45_Y33_N14
\GenPipelinedMult:mult1|auto_generated|dffe153~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe153~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe36~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe145~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe36~regout\ & 
-- ((\GenPipelinedMult:mult1|auto_generated|dffe145~2\) # (GND)))
-- \GenPipelinedMult:mult1|auto_generated|dffe153~2\ = CARRY((!\GenPipelinedMult:mult1|auto_generated|dffe145~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe36~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe145~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe153~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe153~2\);

-- Location: LCCOMB_X45_Y33_N16
\GenPipelinedMult:mult1|auto_generated|dffe164~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe164~1_combout\ = !\GenPipelinedMult:mult1|auto_generated|dffe153~2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \GenPipelinedMult:mult1|auto_generated|dffe153~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe164~1_combout\);

-- Location: LCFF_X43_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe66\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe66~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe66~regout\);

-- Location: LCFF_X43_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe83\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe82~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe83~regout\);

-- Location: LCFF_X43_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe65\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe65~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe65~regout\);

-- Location: LCFF_X47_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe78\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe78~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe78~regout\);

-- Location: LCFF_X47_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe82\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe82~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe82~regout\);

-- Location: LCFF_X44_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe92\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe13~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe92~regout\);

-- Location: LCFF_X47_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe89\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe89~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe89~regout\);

-- Location: LCFF_X48_Y33_N31
\GenPipelinedMult:mult1|auto_generated|dffe98\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe98~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe98~regout\);

-- Location: LCFF_X46_Y33_N13
\GenPipelinedMult:mult1|auto_generated|dffe108\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe108~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe108~regout\);

-- Location: LCFF_X44_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe104\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe104~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe104~regout\);

-- Location: LCFF_X47_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe116\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe116~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe116~regout\);

-- Location: LCFF_X48_Y34_N17
\GenPipelinedMult:mult1|auto_generated|dffe112\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe112~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe112~regout\);

-- Location: LCFF_X45_Y33_N27
\GenPipelinedMult:mult1|auto_generated|dffe124\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe124~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe124~regout\);

-- Location: LCFF_X45_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe132\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|op_5~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe132~regout\);

-- Location: LCFF_X45_Y32_N29
\GenPipelinedMult:mult1|auto_generated|dffe140\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|op_5~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe140~regout\);

-- Location: LCFF_X45_Y32_N23
\GenPipelinedMult:mult1|auto_generated|dffe148\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|op_5~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe148~regout\);

-- Location: LCFF_X40_Y34_N1
\GenPipelinedMult:mult1|auto_generated|dffe156\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe156~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe156~regout\);

-- Location: LCFF_X46_Y32_N23
\GenPipelinedMult:mult1|auto_generated|dffe161\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe53~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe161~regout\);

-- Location: LCFF_X45_Y32_N9
\GenPipelinedMult:mult1|auto_generated|dffe171\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe171~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe171~regout\);

-- Location: LCFF_X44_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe169\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe54~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe169~regout\);

-- Location: LCFF_X46_Y33_N31
\GenPipelinedMult:mult1|auto_generated|dffe3\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe3~regout\);

-- Location: LCFF_X46_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe6\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[2]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe6~regout\);

-- Location: LCFF_X47_Y33_N11
\GenPipelinedMult:mult1|auto_generated|dffe10\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe10~regout\);

-- Location: LCFF_X44_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe13\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe13~regout\);

-- Location: LCFF_X47_Y33_N15
\GenPipelinedMult:mult1|auto_generated|dffe17\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe17~regout\);

-- Location: LCFF_X46_Y33_N11
\GenPipelinedMult:mult1|auto_generated|dffe21\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[6]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe21~regout\);

-- Location: LCFF_X44_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe20\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe20~regout\);

-- Location: LCFF_X47_Y33_N31
\GenPipelinedMult:mult1|auto_generated|dffe22\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[3]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe22~regout\);

-- Location: LCFF_X45_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe24\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe24~regout\);

-- Location: LCFF_X48_Y34_N3
\GenPipelinedMult:mult1|auto_generated|dffe23\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe23~regout\);

-- Location: LCFF_X45_Y33_N29
\GenPipelinedMult:mult1|auto_generated|dffe27\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe27~regout\);

-- Location: LCFF_X45_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe29\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe29~regout\);

-- Location: LCFF_X45_Y32_N31
\GenPipelinedMult:mult1|auto_generated|dffe36\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe36~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\);

-- Location: LCFF_X45_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe37\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe37~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe37~regout\);

-- Location: LCCOMB_X45_Y32_N10
\GenPipelinedMult:mult1|auto_generated|op_5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|op_5~0_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe37~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe36~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe37~regout\,
	datad => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|op_5~0_combout\);

-- Location: LCFF_X45_Y33_N31
\GenPipelinedMult:mult1|auto_generated|dffe34\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[7]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe34~regout\);

-- Location: LCFF_X45_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe32\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[5]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe32~regout\);

-- Location: LCCOMB_X45_Y32_N28
\GenPipelinedMult:mult1|auto_generated|op_5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|op_5~1_combout\ = (!\GenPipelinedMult:mult1|auto_generated|dffe37~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe36~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe37~regout\,
	datad => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|op_5~1_combout\);

-- Location: LCFF_X45_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe40\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[6]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe40~regout\);

-- Location: LCCOMB_X45_Y32_N22
\GenPipelinedMult:mult1|auto_generated|op_5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|op_5~2_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe37~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe36~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe37~regout\,
	datad => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|op_5~2_combout\);

-- Location: LCFF_X45_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe46\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe46~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe46~regout\);

-- Location: LCFF_X45_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe44\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[7]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe44~regout\);

-- Location: LCFF_X46_Y32_N21
\GenPipelinedMult:mult1|auto_generated|dffe53\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe53~regout\);

-- Location: LCFF_X44_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe54\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(8),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe54~regout\);

-- Location: LCCOMB_X46_Y33_N30
\GenPipelinedMult:mult1|auto_generated|w101w[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[0]~0_combout\ = inB_reg(1) $ (((inA_reg(0) & inB_reg(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(0),
	datac => inB_reg(1),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[0]~0_combout\);

-- Location: LCCOMB_X46_Y33_N18
\GenPipelinedMult:mult1|auto_generated|w101w[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[2]~2_combout\ = (inB_reg(0) & (inB_reg(1) $ ((inA_reg(2))))) # (!inB_reg(0) & (inB_reg(1) & ((!inA_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(1),
	datab => inB_reg(0),
	datac => inA_reg(2),
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[2]~2_combout\);

-- Location: LCCOMB_X47_Y33_N10
\GenPipelinedMult:mult1|auto_generated|w156w[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[1]~0_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ $ (inA_reg(1))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (!inA_reg(0) & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(0),
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[1]~0_combout\);

-- Location: LCCOMB_X44_Y33_N0
\GenPipelinedMult:mult1|auto_generated|_~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|_~1_combout\ = inA_reg(0) $ (((inB_reg(4) & ((\GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\))) # (!inB_reg(4) & (inB_reg(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\,
	datac => inA_reg(0),
	datad => inB_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|_~1_combout\);

-- Location: LCCOMB_X44_Y33_N14
\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ = inB_reg(4) $ (((inB_reg(3)) # ((inB_reg(1) & inB_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(1),
	datab => inB_reg(2),
	datac => inB_reg(3),
	datad => inB_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\);

-- Location: LCCOMB_X47_Y33_N14
\GenPipelinedMult:mult1|auto_generated|w156w[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[3]~2_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (inA_reg(3) $ ((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ & !inA_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(3),
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datad => inA_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[3]~2_combout\);

-- Location: LCCOMB_X46_Y33_N10
\GenPipelinedMult:mult1|auto_generated|w101w[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[6]~6_combout\ = (inB_reg(0) & (inA_reg(6) $ (((inB_reg(1)))))) # (!inB_reg(0) & (((!inA_reg(5) & inB_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(6),
	datab => inA_reg(5),
	datac => inB_reg(1),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[6]~6_combout\);

-- Location: LCCOMB_X44_Y33_N2
\GenPipelinedMult:mult1|auto_generated|w258w[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(0) = (inA_reg(0) & (inB_reg(6) $ (((inB_reg(5)) # (\GenPipelinedMult:mult1|auto_generated|_~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => inB_reg(6),
	datac => \GenPipelinedMult:mult1|auto_generated|_~2_combout\,
	datad => inA_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(0));

-- Location: LCCOMB_X47_Y33_N30
\GenPipelinedMult:mult1|auto_generated|w204w[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[3]~2_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (inA_reg(3) $ ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ & !inA_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(3),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[3]~2_combout\);

-- Location: LCCOMB_X45_Y33_N18
\GenPipelinedMult:mult1|auto_generated|w156w[5]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[5]~4_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ $ (((inA_reg(5)))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ & (!inA_reg(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010011010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => inA_reg(4),
	datad => inA_reg(5),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[5]~4_combout\);

-- Location: LCCOMB_X48_Y34_N2
\GenPipelinedMult:mult1|auto_generated|w294w[0]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(0) = (inA_reg(0) & inB_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => inA_reg(0),
	datad => inB_reg(7),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(0));

-- Location: LCCOMB_X45_Y33_N28
\GenPipelinedMult:mult1|auto_generated|w204w[4]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[4]~3_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ $ (inA_reg(4))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (!inA_reg(3) & (\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(3),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[4]~3_combout\);

-- Location: LCCOMB_X46_Y33_N0
\GenPipelinedMult:mult1|auto_generated|w101w[8]~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[8]~8_combout\ = (inB_reg(0)) # (!inA_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inA_reg(7),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[8]~8_combout\);

-- Location: LCCOMB_X45_Y32_N12
\GenPipelinedMult:mult1|auto_generated|w156w[6]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[6]~5_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ $ (inA_reg(6))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (!inA_reg(5) & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datab => inA_reg(5),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[6]~5_combout\);

-- Location: LCCOMB_X45_Y33_N30
\GenPipelinedMult:mult1|auto_generated|w156w[7]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[7]~6_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ $ ((inA_reg(7))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ & ((!inA_reg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => inA_reg(7),
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[7]~6_combout\);

-- Location: LCCOMB_X45_Y33_N24
\GenPipelinedMult:mult1|auto_generated|w204w[5]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[5]~4_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (inA_reg(5) $ ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ & !inA_reg(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(5),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[5]~4_combout\);

-- Location: LCCOMB_X45_Y34_N16
\GenPipelinedMult:mult1|auto_generated|w156w[8]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[8]~7_combout\ = (inB_reg(1) $ (inB_reg(2))) # (!inA_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inA_reg(7),
	datac => inB_reg(1),
	datad => inB_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[8]~7_combout\);

-- Location: LCCOMB_X45_Y33_N2
\GenPipelinedMult:mult1|auto_generated|w204w[6]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[6]~5_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ $ (inA_reg(6))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (!inA_reg(5) & (\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(5),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[6]~5_combout\);

-- Location: LCCOMB_X45_Y33_N22
\GenPipelinedMult:mult1|auto_generated|w204w[7]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[7]~6_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (inA_reg(7) $ ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ & !inA_reg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(7),
	datab => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[7]~6_combout\);

-- Location: LCCOMB_X45_Y33_N0
\GenPipelinedMult:mult1|auto_generated|w204w[8]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[8]~7_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\) # (!inA_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => inA_reg(7),
	datad => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[8]~7_combout\);

-- Location: LCCOMB_X46_Y32_N20
\GenPipelinedMult:mult1|auto_generated|w258w[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(7) = (inA_reg(7) & ((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\) # ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & inA_reg(6))))) # (!inA_reg(7) & 
-- (\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & ((inA_reg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(7),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(7));

-- Location: LCCOMB_X44_Y33_N24
\GenPipelinedMult:mult1|auto_generated|w258w[8]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(8) = (inB_reg(6) & (inA_reg(7) & ((inB_reg(5)) # (\GenPipelinedMult:mult1|auto_generated|_~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => inB_reg(6),
	datac => \GenPipelinedMult:mult1|auto_generated|_~2_combout\,
	datad => inA_reg(7),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(8));

-- Location: LCCOMB_X45_Y32_N16
\GenPipelinedMult:mult1|auto_generated|dffe37~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe37~0_combout\ = !inB_reg(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => inB_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|dffe37~0_combout\);

-- Location: LCCOMB_X45_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe46~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe46~0_combout\ = !\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe46~0_combout\);

-- Location: LCCOMB_X47_Y33_N16
\GenPipelinedMult:mult1|auto_generated|dffe89~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe89~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe11~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe89~feeder_combout\);

-- Location: LCCOMB_X40_Y34_N0
\GenPipelinedMult:mult1|auto_generated|dffe156~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe156~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe50~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe50~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe156~feeder_combout\);

-- Location: LCCOMB_X47_Y33_N8
\GenPipelinedMult:mult1|auto_generated|dffe11~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe11~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe11~feeder_combout\);

-- Location: LCCOMB_X43_Y32_N16
\GenPipelinedMult:mult1|auto_generated|dffe66~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe66~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe65~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe65~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe66~feeder_combout\);

-- Location: LCCOMB_X43_Y32_N12
\GenPipelinedMult:mult1|auto_generated|dffe65~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe65~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe3~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe3~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe65~feeder_combout\);

-- Location: LCCOMB_X47_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe78~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe78~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe6~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe6~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe78~feeder_combout\);

-- Location: LCCOMB_X47_Y33_N22
\GenPipelinedMult:mult1|auto_generated|dffe82~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe82~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe10~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe10~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe82~feeder_combout\);

-- Location: LCCOMB_X48_Y33_N30
\GenPipelinedMult:mult1|auto_generated|dffe98~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe98~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe17~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe17~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe98~feeder_combout\);

-- Location: LCCOMB_X46_Y33_N12
\GenPipelinedMult:mult1|auto_generated|dffe108~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe108~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe21~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe21~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe108~feeder_combout\);

-- Location: LCCOMB_X44_Y33_N22
\GenPipelinedMult:mult1|auto_generated|dffe104~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe104~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe20~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe20~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe104~feeder_combout\);

-- Location: LCCOMB_X47_Y32_N24
\GenPipelinedMult:mult1|auto_generated|dffe116~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe116~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe22~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe22~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe116~feeder_combout\);

-- Location: LCCOMB_X48_Y34_N16
\GenPipelinedMult:mult1|auto_generated|dffe112~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe112~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe23~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe23~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe112~feeder_combout\);

-- Location: LCCOMB_X45_Y33_N26
\GenPipelinedMult:mult1|auto_generated|dffe124~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe124~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe27~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe27~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe124~feeder_combout\);

-- Location: LCCOMB_X45_Y32_N8
\GenPipelinedMult:mult1|auto_generated|dffe171~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe171~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe36~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe36~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe171~feeder_combout\);

-- Location: LCCOMB_X45_Y32_N30
\GenPipelinedMult:mult1|auto_generated|dffe36~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe36~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \GenPipelinedMult:mult1|auto_generated|dffe36~feeder_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(1),
	combout => \inB~combout\(1));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCFF_X44_Y33_N7
\inB_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inB~combout\(1),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(1));

-- Location: LCCOMB_X45_Y32_N26
\GenPipelinedMult:mult1|auto_generated|dffe4~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe4~feeder_combout\ = inB_reg(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => inB_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|dffe4~feeder_combout\);

-- Location: LCFF_X45_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe4\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe4~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe4~regout\);

-- Location: LCCOMB_X45_Y32_N6
\GenPipelinedMult:mult1|auto_generated|dffe67~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe67~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe4~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe4~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe67~feeder_combout\);

-- Location: LCFF_X45_Y32_N7
\GenPipelinedMult:mult1|auto_generated|dffe67\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe67~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe67~regout\);

-- Location: LCCOMB_X45_Y32_N2
\GenPipelinedMult:mult1|auto_generated|dffe68~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe68~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe67~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe67~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe68~feeder_combout\);

-- Location: LCFF_X45_Y32_N3
\GenPipelinedMult:mult1|auto_generated|dffe68\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe68~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe68~regout\);

-- Location: LCCOMB_X48_Y32_N0
\GenPipelinedMult:mult1|auto_generated|dffe63~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe63~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe66~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe68~regout\ $ (VCC))) # (!\GenPipelinedMult:mult1|auto_generated|dffe66~regout\ & 
-- (\GenPipelinedMult:mult1|auto_generated|dffe68~regout\ & VCC))
-- \GenPipelinedMult:mult1|auto_generated|dffe63~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe66~regout\ & \GenPipelinedMult:mult1|auto_generated|dffe68~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe66~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe68~regout\,
	datad => VCC,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe63~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe63~2\);

-- Location: LCFF_X48_Y32_N1
\GenPipelinedMult:mult1|auto_generated|dffe63\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe63~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe63~regout\);

-- Location: LCCOMB_X44_Y32_N8
\GenPipelinedMult:mult1|auto_generated|dffe64~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe64~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe63~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe63~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe64~feeder_combout\);

-- Location: LCFF_X44_Y32_N9
\GenPipelinedMult:mult1|auto_generated|dffe64\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe64~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe64~regout\);

-- Location: CLKCTRL_G1
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCFF_X44_Y32_N17
\outAB[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe64~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[0]~reg0_regout\);

-- Location: PIN_D13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(0),
	combout => \inB~combout\(0));

-- Location: LCCOMB_X46_Y32_N6
\inB_reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inB_reg[0]~feeder_combout\ = \inB~combout\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inB~combout\(0),
	combout => \inB_reg[0]~feeder_combout\);

-- Location: LCFF_X46_Y32_N7
\inB_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inB_reg[0]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(0));

-- Location: PIN_D18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(1),
	combout => \inA~combout\(1));

-- Location: LCCOMB_X46_Y32_N0
\inA_reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inA_reg[1]~feeder_combout\ = \inA~combout\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inA~combout\(1),
	combout => \inA_reg[1]~feeder_combout\);

-- Location: LCFF_X46_Y32_N1
\inA_reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inA_reg[1]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(1));

-- Location: LCCOMB_X46_Y33_N24
\GenPipelinedMult:mult1|auto_generated|w101w[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[1]~1_combout\ = (inB_reg(0) & ((inB_reg(1) $ (inA_reg(1))))) # (!inB_reg(0) & (!inA_reg(0) & (inB_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001110011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(0),
	datab => inB_reg(0),
	datac => inB_reg(1),
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[1]~1_combout\);

-- Location: LCFF_X46_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe5\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[1]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe5~regout\);

-- Location: LCCOMB_X46_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe71~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe71~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe5~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe5~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe71~feeder_combout\);

-- Location: LCFF_X46_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe71\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe71~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe71~regout\);

-- Location: LCCOMB_X46_Y33_N26
\GenPipelinedMult:mult1|auto_generated|dffe72~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe72~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe71~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe71~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe72~feeder_combout\);

-- Location: LCFF_X46_Y33_N27
\GenPipelinedMult:mult1|auto_generated|dffe72\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe72~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe72~regout\);

-- Location: LCCOMB_X48_Y32_N2
\GenPipelinedMult:mult1|auto_generated|dffe69~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe69~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe72~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe63~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe72~regout\ & 
-- ((\GenPipelinedMult:mult1|auto_generated|dffe63~2\) # (GND)))
-- \GenPipelinedMult:mult1|auto_generated|dffe69~2\ = CARRY((!\GenPipelinedMult:mult1|auto_generated|dffe63~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe72~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \GenPipelinedMult:mult1|auto_generated|dffe72~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe63~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe69~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe69~2\);

-- Location: LCFF_X48_Y32_N3
\GenPipelinedMult:mult1|auto_generated|dffe69\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe69~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe69~regout\);

-- Location: LCCOMB_X44_Y32_N26
\GenPipelinedMult:mult1|auto_generated|dffe70~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe70~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe69~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe69~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe70~feeder_combout\);

-- Location: LCFF_X44_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe70\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe70~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe70~regout\);

-- Location: LCCOMB_X44_Y32_N18
\outAB[1]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[1]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe70~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe70~regout\,
	combout => \outAB[1]~reg0feeder_combout\);

-- Location: LCFF_X44_Y32_N19
\outAB[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[1]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[1]~reg0_regout\);

-- Location: PIN_F16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(3),
	combout => \inB~combout\(3));

-- Location: LCFF_X44_Y33_N15
\inB_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inB~combout\(3),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(3));

-- Location: LCCOMB_X45_Y32_N0
\GenPipelinedMult:mult1|auto_generated|dffe8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ = inB_reg(3) $ (((inB_reg(2) & inB_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(2),
	datab => inB_reg(1),
	datad => inB_reg(3),
	combout => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\);

-- Location: PIN_F17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(0),
	combout => \inA~combout\(0));

-- Location: LCFF_X44_Y33_N1
\inA_reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inA~combout\(0),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(0));

-- Location: LCCOMB_X45_Y32_N18
\GenPipelinedMult:mult1|auto_generated|_~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|_~0_combout\ = inA_reg(0) $ (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inA_reg(0),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|_~0_combout\);

-- Location: PIN_H17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(2),
	combout => \inB~combout\(2));

-- Location: LCFF_X44_Y33_N9
\inB_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inB~combout\(2),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(2));

-- Location: LCCOMB_X44_Y33_N8
\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ = inB_reg(2) $ (inB_reg(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => inB_reg(2),
	datad => inB_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\);

-- Location: LCFF_X45_Y32_N1
\GenPipelinedMult:mult1|auto_generated|dffe8\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	sdata => \GenPipelinedMult:mult1|auto_generated|_~0_combout\,
	sload => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe8~regout\);

-- Location: LCCOMB_X45_Y32_N24
\GenPipelinedMult:mult1|auto_generated|dffe75~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe75~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe8~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe8~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe75~feeder_combout\);

-- Location: LCFF_X45_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe75\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe75~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe75~regout\);

-- Location: LCCOMB_X45_Y32_N20
\GenPipelinedMult:mult1|auto_generated|dffe76~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe76~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe75~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe75~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe76~feeder_combout\);

-- Location: LCFF_X45_Y32_N21
\GenPipelinedMult:mult1|auto_generated|dffe76\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe76~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe76~regout\);

-- Location: LCCOMB_X48_Y32_N4
\GenPipelinedMult:mult1|auto_generated|dffe73~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe73~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe77~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe76~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe69~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe73~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe77~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe76~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe69~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe77~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe76~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe69~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe77~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe76~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe69~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe73~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe73~2\);

-- Location: LCFF_X48_Y32_N5
\GenPipelinedMult:mult1|auto_generated|dffe73\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe73~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe73~regout\);

-- Location: LCFF_X44_Y32_N29
\GenPipelinedMult:mult1|auto_generated|dffe74\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe73~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe74~regout\);

-- Location: LCCOMB_X44_Y32_N4
\outAB[2]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[2]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe74~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe74~regout\,
	combout => \outAB[2]~reg0feeder_combout\);

-- Location: LCFF_X44_Y32_N5
\outAB[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[2]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[2]~reg0_regout\);

-- Location: PIN_D17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(2),
	combout => \inA~combout\(2));

-- Location: LCFF_X46_Y32_N11
\inA_reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inA~combout\(2),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(2));

-- Location: PIN_C17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(3),
	combout => \inA~combout\(3));

-- Location: LCFF_X46_Y32_N29
\inA_reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inA~combout\(3),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(3));

-- Location: LCCOMB_X46_Y33_N4
\GenPipelinedMult:mult1|auto_generated|w101w[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[3]~3_combout\ = (inB_reg(0) & (inB_reg(1) $ (((inA_reg(3)))))) # (!inB_reg(0) & (inB_reg(1) & (!inA_reg(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(1),
	datab => inA_reg(2),
	datac => inA_reg(3),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[3]~3_combout\);

-- Location: LCFF_X46_Y33_N5
\GenPipelinedMult:mult1|auto_generated|dffe9\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[3]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe9~regout\);

-- Location: LCCOMB_X46_Y33_N6
\GenPipelinedMult:mult1|auto_generated|dffe85~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe85~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe9~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe9~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe85~feeder_combout\);

-- Location: LCFF_X46_Y33_N7
\GenPipelinedMult:mult1|auto_generated|dffe85\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe85~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe85~regout\);

-- Location: LCCOMB_X47_Y33_N0
\GenPipelinedMult:mult1|auto_generated|dffe7~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe7~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe7~feeder_combout\);

-- Location: LCFF_X47_Y33_N1
\GenPipelinedMult:mult1|auto_generated|dffe7\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe7~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe7~regout\);

-- Location: LCCOMB_X47_Y33_N18
\GenPipelinedMult:mult1|auto_generated|dffe79~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe79~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe7~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe7~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe79~feeder_combout\);

-- Location: LCFF_X47_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe79\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe79~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe79~regout\);

-- Location: LCCOMB_X48_Y33_N2
\GenPipelinedMult:mult1|auto_generated|dffe84~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe84~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe85~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe77~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe85~regout\ & 
-- ((\GenPipelinedMult:mult1|auto_generated|dffe77~2\) # (GND)))
-- \GenPipelinedMult:mult1|auto_generated|dffe84~2\ = CARRY((!\GenPipelinedMult:mult1|auto_generated|dffe77~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe85~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \GenPipelinedMult:mult1|auto_generated|dffe85~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe77~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe84~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe84~2\);

-- Location: LCFF_X48_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe84\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe84~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe84~regout\);

-- Location: LCCOMB_X48_Y32_N6
\GenPipelinedMult:mult1|auto_generated|dffe80~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe80~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe83~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe84~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe73~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe84~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe73~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe83~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe84~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe73~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe84~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe73~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe80~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe83~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe84~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe73~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe83~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe73~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe84~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe83~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe84~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe73~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe80~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe80~2\);

-- Location: LCFF_X48_Y32_N7
\GenPipelinedMult:mult1|auto_generated|dffe80\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe80~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe80~regout\);

-- Location: LCFF_X44_Y32_N15
\GenPipelinedMult:mult1|auto_generated|dffe81\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe80~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe81~regout\);

-- Location: LCFF_X44_Y32_N7
\outAB[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe81~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[3]~reg0_regout\);

-- Location: LCCOMB_X47_Y33_N12
\GenPipelinedMult:mult1|auto_generated|w156w[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[2]~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (inA_reg(2) $ ((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ & !inA_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000001101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(2),
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[2]~1_combout\);

-- Location: LCFF_X47_Y33_N13
\GenPipelinedMult:mult1|auto_generated|dffe12\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe12~regout\);

-- Location: LCCOMB_X48_Y33_N28
\GenPipelinedMult:mult1|auto_generated|dffe90~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe90~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe12~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe12~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe90~feeder_combout\);

-- Location: LCFF_X48_Y33_N29
\GenPipelinedMult:mult1|auto_generated|dffe90\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe90~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe90~regout\);

-- Location: LCCOMB_X48_Y33_N4
\GenPipelinedMult:mult1|auto_generated|dffe88~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe88~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe89~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe90~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe84~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe88~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe89~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe90~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe84~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe89~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe90~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe84~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe89~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe90~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe84~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe88~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe88~2\);

-- Location: LCFF_X48_Y33_N5
\GenPipelinedMult:mult1|auto_generated|dffe88\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe88~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe88~regout\);

-- Location: LCCOMB_X48_Y32_N8
\GenPipelinedMult:mult1|auto_generated|dffe86~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe86~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe91~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe88~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe80~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe86~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe91~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe88~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe80~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe91~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe88~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe80~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe91~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe88~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe80~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe86~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe86~2\);

-- Location: LCFF_X48_Y32_N9
\GenPipelinedMult:mult1|auto_generated|dffe86\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe86~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe86~regout\);

-- Location: LCFF_X44_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe87\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe86~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe87~regout\);

-- Location: LCFF_X44_Y32_N1
\outAB[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe87~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[4]~reg0_regout\);

-- Location: LCCOMB_X44_Y33_N6
\GenPipelinedMult:mult1|auto_generated|cs1a[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\ = inB_reg(5) $ (((inB_reg(3)) # ((inB_reg(1) & inB_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => inB_reg(3),
	datac => inB_reg(1),
	datad => inB_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\);

-- Location: PIN_G16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(4),
	combout => \inB~combout\(4));

-- Location: LCCOMB_X44_Y33_N12
\inB_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inB_reg[4]~feeder_combout\ = \inB~combout\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inB~combout\(4),
	combout => \inB_reg[4]~feeder_combout\);

-- Location: LCFF_X44_Y33_N13
\inB_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inB_reg[4]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(4));

-- Location: LCCOMB_X44_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe11~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ = (inB_reg(4) & ((\GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\))) # (!inB_reg(4) & (inB_reg(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[2]~0_combout\,
	datad => inB_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\);

-- Location: LCCOMB_X47_Y33_N24
\GenPipelinedMult:mult1|auto_generated|w204w[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[1]~0_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ $ (inA_reg(1))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (!inA_reg(0) & (\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(0),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[1]~0_combout\);

-- Location: LCFF_X47_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe16\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe16~regout\);

-- Location: LCCOMB_X47_Y33_N26
\GenPipelinedMult:mult1|auto_generated|dffe97~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe97~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe16~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe16~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe97~feeder_combout\);

-- Location: LCFF_X47_Y33_N27
\GenPipelinedMult:mult1|auto_generated|dffe97\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe97~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe97~regout\);

-- Location: LCCOMB_X48_Y33_N6
\GenPipelinedMult:mult1|auto_generated|dffe96~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe96~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe98~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe97~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe88~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe97~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe88~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe98~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe97~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe88~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe97~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe88~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe96~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe98~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe97~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe88~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe98~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe88~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe97~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe98~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe97~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe88~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe96~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe96~2\);

-- Location: LCFF_X48_Y33_N7
\GenPipelinedMult:mult1|auto_generated|dffe96\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe96~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe96~regout\);

-- Location: LCCOMB_X48_Y32_N10
\GenPipelinedMult:mult1|auto_generated|dffe94~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe94~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe99~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe96~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe86~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe96~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe86~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe99~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe96~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe86~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe96~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe86~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe94~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe99~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe96~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe86~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe99~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe86~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe96~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe99~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe96~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe86~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe94~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe94~2\);

-- Location: LCFF_X48_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe94\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe94~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe94~regout\);

-- Location: LCCOMB_X44_Y32_N10
\GenPipelinedMult:mult1|auto_generated|dffe95~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe95~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe94~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe94~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe95~feeder_combout\);

-- Location: LCFF_X44_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe95\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe95~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe95~regout\);

-- Location: LCCOMB_X44_Y32_N2
\outAB[5]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[5]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe95~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe95~regout\,
	combout => \outAB[5]~reg0feeder_combout\);

-- Location: LCFF_X44_Y32_N3
\outAB[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[5]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[5]~reg0_regout\);

-- Location: LCCOMB_X47_Y33_N4
\GenPipelinedMult:mult1|auto_generated|w204w[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w204w[2]~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\ $ (inA_reg(2))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\ & (!inA_reg(1) & (\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001101010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[2]~1_combout\,
	datab => inA_reg(1),
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	datad => inA_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w204w[2]~1_combout\);

-- Location: LCFF_X47_Y33_N5
\GenPipelinedMult:mult1|auto_generated|dffe18\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w204w[2]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe18~regout\);

-- Location: LCCOMB_X47_Y33_N6
\GenPipelinedMult:mult1|auto_generated|dffe105~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe105~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe18~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe18~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe105~feeder_combout\);

-- Location: LCFF_X47_Y33_N7
\GenPipelinedMult:mult1|auto_generated|dffe105\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe105~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe105~regout\);

-- Location: LCCOMB_X48_Y33_N8
\GenPipelinedMult:mult1|auto_generated|dffe103~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe103~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe104~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe105~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe96~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe103~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe104~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe105~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe96~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe104~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe105~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe96~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe104~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe105~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe96~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe103~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe103~2\);

-- Location: LCFF_X48_Y33_N9
\GenPipelinedMult:mult1|auto_generated|dffe103\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe103~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe103~regout\);

-- Location: LCCOMB_X48_Y32_N12
\GenPipelinedMult:mult1|auto_generated|dffe101~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe101~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe106~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe103~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe94~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe101~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe106~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe103~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe94~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe106~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe103~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe94~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe106~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe103~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe94~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe101~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe101~2\);

-- Location: LCFF_X48_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe101\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe101~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe101~regout\);

-- Location: LCCOMB_X44_Y32_N20
\GenPipelinedMult:mult1|auto_generated|dffe102~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe102~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe101~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe101~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe102~feeder_combout\);

-- Location: LCFF_X44_Y32_N21
\GenPipelinedMult:mult1|auto_generated|dffe102\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe102~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe102~regout\);

-- Location: LCFF_X44_Y32_N13
\outAB[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe102~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[6]~reg0_regout\);

-- Location: LCCOMB_X44_Y33_N4
\GenPipelinedMult:mult1|auto_generated|_~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|_~2_combout\ = (inB_reg(4) & ((inB_reg(3)) # ((inB_reg(1) & inB_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(1),
	datab => inB_reg(2),
	datac => inB_reg(3),
	datad => inB_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|_~2_combout\);

-- Location: PIN_F15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(6),
	combout => \inB~combout\(6));

-- Location: LCFF_X44_Y33_N27
\inB_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \inB~combout\(6),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(6));

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(5),
	combout => \inB~combout\(5));

-- Location: LCCOMB_X44_Y33_N10
\inB_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inB_reg[5]~feeder_combout\ = \inB~combout\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inB~combout\(5),
	combout => \inB_reg[5]~feeder_combout\);

-- Location: LCFF_X44_Y33_N11
\inB_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inB_reg[5]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(5));

-- Location: LCCOMB_X44_Y33_N26
\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ = (inB_reg(6) & ((\GenPipelinedMult:mult1|auto_generated|_~2_combout\) # (inB_reg(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \GenPipelinedMult:mult1|auto_generated|_~2_combout\,
	datac => inB_reg(6),
	datad => inB_reg(5),
	combout => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\);

-- Location: LCCOMB_X44_Y33_N18
\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ = inB_reg(6) $ (((inB_reg(5)) # (\GenPipelinedMult:mult1|auto_generated|_~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inB_reg(5),
	datab => \GenPipelinedMult:mult1|auto_generated|_~2_combout\,
	datad => inB_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\);

-- Location: LCCOMB_X46_Y32_N16
\GenPipelinedMult:mult1|auto_generated|w258w[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(1) = (inA_reg(0) & ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\) # ((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & inA_reg(1))))) # (!inA_reg(0) & 
-- (((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & inA_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(0),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(1));

-- Location: LCFF_X46_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe25\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe25~regout\);

-- Location: LCCOMB_X47_Y32_N26
\GenPipelinedMult:mult1|auto_generated|dffe115~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe115~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe25~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe25~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe115~feeder_combout\);

-- Location: LCFF_X47_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe115\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe115~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe115~regout\);

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(4),
	combout => \inA~combout\(4));

-- Location: LCCOMB_X48_Y34_N20
\inA_reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inA_reg[4]~feeder_combout\ = \inA~combout\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inA~combout\(4),
	combout => \inA_reg[4]~feeder_combout\);

-- Location: LCFF_X48_Y34_N21
\inA_reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inA_reg[4]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(4));

-- Location: LCCOMB_X47_Y33_N2
\GenPipelinedMult:mult1|auto_generated|w156w[4]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w156w[4]~3_combout\ = (\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\ $ (inA_reg(4))))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\ & (!inA_reg(3) & (\GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(3),
	datab => \GenPipelinedMult:mult1|auto_generated|dffe8~0_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[1]~0_combout\,
	datad => inA_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|w156w[4]~3_combout\);

-- Location: LCFF_X47_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe19\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w156w[4]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe19~regout\);

-- Location: LCCOMB_X47_Y33_N28
\GenPipelinedMult:mult1|auto_generated|dffe107~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe107~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe19~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe19~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe107~feeder_combout\);

-- Location: LCFF_X47_Y33_N29
\GenPipelinedMult:mult1|auto_generated|dffe107\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe107~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe107~regout\);

-- Location: PIN_G17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(5),
	combout => \inA~combout\(5));

-- Location: LCCOMB_X44_Y33_N28
\inA_reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inA_reg[5]~feeder_combout\ = \inA~combout\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inA~combout\(5),
	combout => \inA_reg[5]~feeder_combout\);

-- Location: LCFF_X44_Y33_N29
\inA_reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inA_reg[5]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(5));

-- Location: LCCOMB_X46_Y33_N8
\GenPipelinedMult:mult1|auto_generated|w101w[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[5]~5_combout\ = (inB_reg(0) & ((inA_reg(5) $ (inB_reg(1))))) # (!inB_reg(0) & (!inA_reg(4) & ((inB_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(4),
	datab => inA_reg(5),
	datac => inB_reg(1),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[5]~5_combout\);

-- Location: LCFF_X46_Y33_N9
\GenPipelinedMult:mult1|auto_generated|dffe15\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe15~regout\);

-- Location: LCCOMB_X46_Y33_N2
\GenPipelinedMult:mult1|auto_generated|dffe100~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe100~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe15~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe15~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe100~feeder_combout\);

-- Location: LCFF_X46_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe100\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe100~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe100~regout\);

-- Location: LCCOMB_X46_Y33_N22
\GenPipelinedMult:mult1|auto_generated|w101w[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[4]~4_combout\ = (inB_reg(0) & (inA_reg(4) $ (((inB_reg(1)))))) # (!inB_reg(0) & (((!inA_reg(3) & inB_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(4),
	datab => inB_reg(0),
	datac => inA_reg(3),
	datad => inB_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[4]~4_combout\);

-- Location: LCFF_X46_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe14\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[4]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe14~regout\);

-- Location: LCCOMB_X46_Y33_N16
\GenPipelinedMult:mult1|auto_generated|dffe93~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe93~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe14~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe14~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe93~feeder_combout\);

-- Location: LCFF_X46_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe93\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe93~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe93~regout\);

-- Location: LCCOMB_X47_Y32_N6
\GenPipelinedMult:mult1|auto_generated|dffe114~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe114~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe116~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe115~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe106~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe115~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe106~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe116~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe115~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe106~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe115~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe106~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe114~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe116~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe115~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe106~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe116~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe106~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe115~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe116~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe115~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe106~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe114~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe114~2\);

-- Location: LCFF_X47_Y32_N7
\GenPipelinedMult:mult1|auto_generated|dffe114\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe114~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe114~regout\);

-- Location: LCCOMB_X48_Y32_N14
\GenPipelinedMult:mult1|auto_generated|dffe109~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe109~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe111~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe114~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe101~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe114~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe101~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe111~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe114~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe101~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe114~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe101~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe109~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe111~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe114~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe101~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe111~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe101~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe114~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe111~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe114~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe101~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe109~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe109~2\);

-- Location: LCFF_X48_Y32_N15
\GenPipelinedMult:mult1|auto_generated|dffe109\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe109~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe109~regout\);

-- Location: LCCOMB_X44_Y32_N30
\GenPipelinedMult:mult1|auto_generated|dffe110~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe110~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe109~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe109~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe110~feeder_combout\);

-- Location: LCFF_X44_Y32_N31
\GenPipelinedMult:mult1|auto_generated|dffe110\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe110~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe110~regout\);

-- Location: LCCOMB_X44_Y32_N22
\outAB[7]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[7]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe110~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe110~regout\,
	combout => \outAB[7]~reg0feeder_combout\);

-- Location: LCFF_X44_Y32_N23
\outAB[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[7]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[7]~reg0_regout\);

-- Location: PIN_E18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inB[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inB(7),
	combout => \inB~combout\(7));

-- Location: LCCOMB_X49_Y33_N4
\inB_reg[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inB_reg[7]~feeder_combout\ = \inB~combout\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inB~combout\(7),
	combout => \inB_reg[7]~feeder_combout\);

-- Location: LCFF_X49_Y33_N5
\inB_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inB_reg[7]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inB_reg(7));

-- Location: LCCOMB_X49_Y33_N22
\GenPipelinedMult:mult1|auto_generated|w294w[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(1) = (inA_reg(1) & inB_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inA_reg(1),
	datac => inB_reg(7),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(1));

-- Location: LCFF_X49_Y33_N23
\GenPipelinedMult:mult1|auto_generated|dffe28\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe28~regout\);

-- Location: LCCOMB_X49_Y33_N8
\GenPipelinedMult:mult1|auto_generated|dffe120~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe120~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe28~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe28~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe120~feeder_combout\);

-- Location: LCFF_X49_Y33_N9
\GenPipelinedMult:mult1|auto_generated|dffe120\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe120~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe120~regout\);

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(7),
	combout => \inA~combout\(7));

-- Location: LCCOMB_X44_Y33_N30
\inA_reg[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inA_reg[7]~feeder_combout\ = \inA~combout\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inA~combout\(7),
	combout => \inA_reg[7]~feeder_combout\);

-- Location: LCFF_X44_Y33_N31
\inA_reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inA_reg[7]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(7));

-- Location: LCCOMB_X46_Y33_N28
\GenPipelinedMult:mult1|auto_generated|w101w[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w101w[7]~7_combout\ = (inB_reg(0) & ((inA_reg(7) $ (inB_reg(1))))) # (!inB_reg(0) & (!inA_reg(6) & ((inB_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(6),
	datab => inA_reg(7),
	datac => inB_reg(1),
	datad => inB_reg(0),
	combout => \GenPipelinedMult:mult1|auto_generated|w101w[7]~7_combout\);

-- Location: LCFF_X46_Y33_N29
\GenPipelinedMult:mult1|auto_generated|dffe26\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w101w[7]~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe26~regout\);

-- Location: LCFF_X45_Y33_N5
\GenPipelinedMult:mult1|auto_generated|dffe113\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe113~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe113~regout\);

-- Location: LCCOMB_X48_Y33_N12
\GenPipelinedMult:mult1|auto_generated|dffe119~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe119~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe121~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe120~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe111~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe119~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe121~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe120~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe111~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe121~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe120~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe111~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe121~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe120~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe111~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe119~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe119~2\);

-- Location: LCFF_X48_Y33_N13
\GenPipelinedMult:mult1|auto_generated|dffe119\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe119~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe119~regout\);

-- Location: LCCOMB_X48_Y32_N16
\GenPipelinedMult:mult1|auto_generated|dffe117~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe117~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe122~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe119~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe109~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe117~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe122~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe119~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe109~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe122~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe119~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe109~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe122~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe119~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe109~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe117~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe117~2\);

-- Location: LCFF_X48_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe117\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe117~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe117~regout\);

-- Location: LCCOMB_X49_Y32_N16
\GenPipelinedMult:mult1|auto_generated|dffe118~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe118~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe117~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe117~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe118~feeder_combout\);

-- Location: LCFF_X49_Y32_N17
\GenPipelinedMult:mult1|auto_generated|dffe118\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe118~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe118~regout\);

-- Location: LCFF_X49_Y32_N9
\outAB[8]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe118~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[8]~reg0_regout\);

-- Location: LCCOMB_X49_Y33_N0
\GenPipelinedMult:mult1|auto_generated|w294w[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(2) = (inB_reg(7) & inA_reg(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inB_reg(7),
	datac => inA_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(2));

-- Location: LCFF_X49_Y33_N1
\GenPipelinedMult:mult1|auto_generated|dffe33\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe33~regout\);

-- Location: LCCOMB_X49_Y33_N18
\GenPipelinedMult:mult1|auto_generated|dffe128~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe128~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe33~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe33~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe128~feeder_combout\);

-- Location: LCFF_X49_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe128\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe128~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe128~regout\);

-- Location: LCCOMB_X48_Y33_N14
\GenPipelinedMult:mult1|auto_generated|dffe127~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe127~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe129~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe128~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe119~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe128~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe119~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe129~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe128~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe119~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe128~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe119~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe127~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe129~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe128~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe119~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe129~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe119~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe128~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe129~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe128~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe119~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe127~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe127~2\);

-- Location: LCFF_X48_Y33_N15
\GenPipelinedMult:mult1|auto_generated|dffe127\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe127~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe127~regout\);

-- Location: LCCOMB_X48_Y32_N18
\GenPipelinedMult:mult1|auto_generated|dffe125~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe125~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe130~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe127~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe117~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe127~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe117~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe130~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe127~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe117~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe127~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe117~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe125~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe130~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe127~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe117~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe130~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe117~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe127~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe130~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe127~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe117~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe125~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe125~2\);

-- Location: LCFF_X48_Y32_N19
\GenPipelinedMult:mult1|auto_generated|dffe125\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe125~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe125~regout\);

-- Location: LCCOMB_X49_Y32_N26
\GenPipelinedMult:mult1|auto_generated|dffe126~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe126~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe125~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe125~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe126~feeder_combout\);

-- Location: LCFF_X49_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe126\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe126~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe126~regout\);

-- Location: LCCOMB_X49_Y32_N2
\outAB[9]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[9]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe126~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe126~regout\,
	combout => \outAB[9]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N3
\outAB[9]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[9]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[9]~reg0_regout\);

-- Location: LCCOMB_X49_Y33_N26
\GenPipelinedMult:mult1|auto_generated|w294w[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(3) = (inA_reg(3) & inB_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(3),
	datac => inB_reg(7),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(3));

-- Location: LCFF_X49_Y33_N27
\GenPipelinedMult:mult1|auto_generated|dffe41\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe41~regout\);

-- Location: LCCOMB_X49_Y33_N28
\GenPipelinedMult:mult1|auto_generated|dffe136~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe136~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe41~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe41~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe136~feeder_combout\);

-- Location: LCFF_X49_Y33_N29
\GenPipelinedMult:mult1|auto_generated|dffe136\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe136~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe136~regout\);

-- Location: LCCOMB_X48_Y33_N16
\GenPipelinedMult:mult1|auto_generated|dffe135~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe135~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe137~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe136~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe127~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe135~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe137~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe136~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe127~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe137~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe136~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe127~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe137~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe136~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe127~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe135~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe135~2\);

-- Location: LCFF_X48_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe135\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe135~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe135~regout\);

-- Location: LCCOMB_X48_Y32_N20
\GenPipelinedMult:mult1|auto_generated|dffe133~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe133~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe138~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe135~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe125~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe133~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe138~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe135~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe125~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe138~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe135~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe125~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe138~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe135~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe125~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe133~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe133~2\);

-- Location: LCFF_X48_Y32_N21
\GenPipelinedMult:mult1|auto_generated|dffe133\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe133~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe133~regout\);

-- Location: LCFF_X49_Y32_N29
\GenPipelinedMult:mult1|auto_generated|dffe134\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe133~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe134~regout\);

-- Location: LCCOMB_X49_Y32_N20
\outAB[10]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[10]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe134~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe134~regout\,
	combout => \outAB[10]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N21
\outAB[10]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[10]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[10]~reg0_regout\);

-- Location: LCCOMB_X49_Y33_N12
\GenPipelinedMult:mult1|auto_generated|w294w[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(4) = (inB_reg(7) & inA_reg(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inB_reg(7),
	datac => inA_reg(4),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(4));

-- Location: LCFF_X49_Y33_N13
\GenPipelinedMult:mult1|auto_generated|dffe45\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe45~regout\);

-- Location: LCCOMB_X49_Y33_N14
\GenPipelinedMult:mult1|auto_generated|dffe144~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe144~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe45~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe45~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe144~feeder_combout\);

-- Location: LCFF_X49_Y33_N15
\GenPipelinedMult:mult1|auto_generated|dffe144\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe144~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe144~regout\);

-- Location: LCCOMB_X48_Y33_N18
\GenPipelinedMult:mult1|auto_generated|dffe143~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe143~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe145~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe144~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe135~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe144~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe135~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe145~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe144~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe135~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe144~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe135~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe143~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe145~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe144~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe135~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe145~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe135~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe144~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe145~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe144~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe135~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe143~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe143~2\);

-- Location: LCFF_X48_Y33_N19
\GenPipelinedMult:mult1|auto_generated|dffe143\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe143~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe143~regout\);

-- Location: LCCOMB_X48_Y32_N22
\GenPipelinedMult:mult1|auto_generated|dffe141~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe141~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe146~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe143~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe133~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe143~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe133~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe146~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe143~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe133~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe143~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe133~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe141~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe146~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe143~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe133~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe146~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe133~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe143~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe146~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe143~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe133~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe141~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe141~2\);

-- Location: LCFF_X48_Y32_N23
\GenPipelinedMult:mult1|auto_generated|dffe141\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe141~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe141~regout\);

-- Location: LCCOMB_X49_Y32_N6
\GenPipelinedMult:mult1|auto_generated|dffe142~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe142~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe141~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe141~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe142~feeder_combout\);

-- Location: LCFF_X49_Y32_N7
\GenPipelinedMult:mult1|auto_generated|dffe142\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe142~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe142~regout\);

-- Location: LCCOMB_X49_Y32_N14
\outAB[11]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[11]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe142~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe142~regout\,
	combout => \outAB[11]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N15
\outAB[11]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[11]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[11]~reg0_regout\);

-- Location: LCCOMB_X49_Y33_N30
\GenPipelinedMult:mult1|auto_generated|w294w[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(5) = (inB_reg(7) & inA_reg(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inB_reg(7),
	datac => inA_reg(5),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(5));

-- Location: LCFF_X49_Y33_N31
\GenPipelinedMult:mult1|auto_generated|dffe47\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe47~regout\);

-- Location: LCCOMB_X49_Y33_N24
\GenPipelinedMult:mult1|auto_generated|dffe152~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe152~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe47~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe47~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe152~feeder_combout\);

-- Location: LCFF_X49_Y33_N25
\GenPipelinedMult:mult1|auto_generated|dffe152\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe152~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe152~regout\);

-- Location: LCCOMB_X48_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe151~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe151~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe153~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe152~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe143~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe151~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe153~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe152~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe143~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe153~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe152~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe143~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe153~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe152~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe143~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe151~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe151~2\);

-- Location: LCFF_X48_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe151\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe151~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe151~regout\);

-- Location: LCCOMB_X48_Y32_N24
\GenPipelinedMult:mult1|auto_generated|dffe149~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe149~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe154~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe151~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe141~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe149~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe154~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe151~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe141~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe154~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe151~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe141~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe154~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe151~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe141~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe149~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe149~2\);

-- Location: LCFF_X48_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe149\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe149~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe149~regout\);

-- Location: LCCOMB_X49_Y32_N24
\GenPipelinedMult:mult1|auto_generated|dffe150~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe150~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe149~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe149~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe150~feeder_combout\);

-- Location: LCFF_X49_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe150\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe150~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe150~regout\);

-- Location: LCFF_X49_Y32_N1
\outAB[12]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe150~regout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[12]~reg0_regout\);

-- Location: LCCOMB_X43_Y32_N0
\GenPipelinedMult:mult1|auto_generated|dffe51~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe51~0_combout\ = !\GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GenPipelinedMult:mult1|auto_generated|dffe11~0_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe51~0_combout\);

-- Location: LCFF_X43_Y32_N1
\GenPipelinedMult:mult1|auto_generated|dffe51\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe51~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe51~regout\);

-- Location: LCCOMB_X43_Y32_N14
\GenPipelinedMult:mult1|auto_generated|dffe163~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe163~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe51~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe51~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe163~feeder_combout\);

-- Location: LCFF_X43_Y32_N15
\GenPipelinedMult:mult1|auto_generated|dffe163\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe163~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe163~regout\);

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\inA[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_inA(6),
	combout => \inA~combout\(6));

-- Location: LCCOMB_X46_Y32_N30
\inA_reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \inA_reg[6]~feeder_combout\ = \inA~combout\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inA~combout\(6),
	combout => \inA_reg[6]~feeder_combout\);

-- Location: LCFF_X46_Y32_N31
\inA_reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \inA_reg[6]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => inA_reg(6));

-- Location: LCCOMB_X46_Y32_N2
\GenPipelinedMult:mult1|auto_generated|w258w[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(6) = (inA_reg(5) & ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\) # ((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & inA_reg(6))))) # (!inA_reg(5) & 
-- (((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & inA_reg(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(5),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datad => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(6));

-- Location: LCFF_X46_Y32_N3
\GenPipelinedMult:mult1|auto_generated|dffe48\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe48~regout\);

-- Location: LCCOMB_X46_Y32_N4
\GenPipelinedMult:mult1|auto_generated|dffe155~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe155~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe48~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe48~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe155~feeder_combout\);

-- Location: LCFF_X46_Y32_N5
\GenPipelinedMult:mult1|auto_generated|dffe155\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe155~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe155~regout\);

-- Location: LCCOMB_X46_Y32_N8
\GenPipelinedMult:mult1|auto_generated|w258w[5]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(5) = (\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & ((inA_reg(5)) # ((inA_reg(4) & \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & (((inA_reg(4) & \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datab => inA_reg(5),
	datac => inA_reg(4),
	datad => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(5));

-- Location: LCFF_X46_Y32_N9
\GenPipelinedMult:mult1|auto_generated|dffe43\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe43~regout\);

-- Location: LCFF_X46_Y32_N19
\GenPipelinedMult:mult1|auto_generated|dffe147\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe43~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe147~regout\);

-- Location: LCCOMB_X46_Y32_N14
\GenPipelinedMult:mult1|auto_generated|w258w[4]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(4) = (\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & ((inA_reg(4)) # ((inA_reg(3) & \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\)))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\ & (inA_reg(3) & ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datab => inA_reg(3),
	datac => inA_reg(4),
	datad => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(4));

-- Location: LCFF_X46_Y32_N15
\GenPipelinedMult:mult1|auto_generated|dffe38\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe38~regout\);

-- Location: LCFF_X46_Y32_N25
\GenPipelinedMult:mult1|auto_generated|dffe139\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe38~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe139~regout\);

-- Location: LCCOMB_X46_Y32_N12
\GenPipelinedMult:mult1|auto_generated|w258w[3]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(3) = (inA_reg(3) & ((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\) # ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & inA_reg(2))))) # (!inA_reg(3) & 
-- (\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & ((inA_reg(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(3),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datad => inA_reg(2),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(3));

-- Location: LCFF_X46_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe35\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe35~regout\);

-- Location: LCCOMB_X47_Y32_N30
\GenPipelinedMult:mult1|auto_generated|dffe131~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe131~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe35~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe35~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe131~feeder_combout\);

-- Location: LCFF_X47_Y32_N31
\GenPipelinedMult:mult1|auto_generated|dffe131\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe131~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe131~regout\);

-- Location: LCCOMB_X46_Y32_N26
\GenPipelinedMult:mult1|auto_generated|w258w[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w258w\(2) = (inA_reg(2) & ((\GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\) # ((\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & inA_reg(1))))) # (!inA_reg(2) & 
-- (\GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\ & ((inA_reg(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => inA_reg(2),
	datab => \GenPipelinedMult:mult1|auto_generated|cs1a[3]~1_combout\,
	datac => \GenPipelinedMult:mult1|auto_generated|cs2a[3]~2_combout\,
	datad => inA_reg(1),
	combout => \GenPipelinedMult:mult1|auto_generated|w258w\(2));

-- Location: LCFF_X46_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe30\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w258w\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe30~regout\);

-- Location: LCCOMB_X47_Y32_N28
\GenPipelinedMult:mult1|auto_generated|dffe123~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe123~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe30~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe30~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe123~feeder_combout\);

-- Location: LCFF_X47_Y32_N29
\GenPipelinedMult:mult1|auto_generated|dffe123\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe123~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe123~regout\);

-- Location: LCCOMB_X47_Y32_N18
\GenPipelinedMult:mult1|auto_generated|dffe162~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe162~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe164~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe163~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe154~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe163~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe154~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe164~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe163~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe154~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe163~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe154~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe162~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe164~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe163~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe154~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe164~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe154~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe163~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe164~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe163~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe154~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe162~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe162~2\);

-- Location: LCFF_X47_Y32_N19
\GenPipelinedMult:mult1|auto_generated|dffe162\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe162~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe162~regout\);

-- Location: LCCOMB_X48_Y32_N26
\GenPipelinedMult:mult1|auto_generated|dffe157~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe157~1_combout\ = (\GenPipelinedMult:mult1|auto_generated|dffe159~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe162~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe149~2\ & VCC)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe162~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe149~2\)))) # (!\GenPipelinedMult:mult1|auto_generated|dffe159~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe162~regout\ & 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe149~2\)) # (!\GenPipelinedMult:mult1|auto_generated|dffe162~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe149~2\) # (GND)))))
-- \GenPipelinedMult:mult1|auto_generated|dffe157~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe159~regout\ & (!\GenPipelinedMult:mult1|auto_generated|dffe162~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe149~2\)) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe159~regout\ & ((!\GenPipelinedMult:mult1|auto_generated|dffe149~2\) # (!\GenPipelinedMult:mult1|auto_generated|dffe162~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe159~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe162~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe149~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe157~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe157~2\);

-- Location: LCFF_X48_Y32_N27
\GenPipelinedMult:mult1|auto_generated|dffe157\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe157~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe157~regout\);

-- Location: LCCOMB_X49_Y32_N10
\GenPipelinedMult:mult1|auto_generated|dffe158~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe158~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe157~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe157~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe158~feeder_combout\);

-- Location: LCFF_X49_Y32_N11
\GenPipelinedMult:mult1|auto_generated|dffe158\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe158~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe158~regout\);

-- Location: LCCOMB_X49_Y32_N18
\outAB[13]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[13]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe158~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe158~regout\,
	combout => \outAB[13]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N19
\outAB[13]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[13]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[13]~reg0_regout\);

-- Location: LCFF_X47_Y32_N21
\GenPipelinedMult:mult1|auto_generated|dffe170\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe170~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe170~regout\);

-- Location: LCCOMB_X48_Y32_N28
\GenPipelinedMult:mult1|auto_generated|dffe165~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe165~1_combout\ = ((\GenPipelinedMult:mult1|auto_generated|dffe167~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe170~regout\ $ (!\GenPipelinedMult:mult1|auto_generated|dffe157~2\)))) # (GND)
-- \GenPipelinedMult:mult1|auto_generated|dffe165~2\ = CARRY((\GenPipelinedMult:mult1|auto_generated|dffe167~regout\ & ((\GenPipelinedMult:mult1|auto_generated|dffe170~regout\) # (!\GenPipelinedMult:mult1|auto_generated|dffe157~2\))) # 
-- (!\GenPipelinedMult:mult1|auto_generated|dffe167~regout\ & (\GenPipelinedMult:mult1|auto_generated|dffe170~regout\ & !\GenPipelinedMult:mult1|auto_generated|dffe157~2\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe167~regout\,
	datab => \GenPipelinedMult:mult1|auto_generated|dffe170~regout\,
	datad => VCC,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe157~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe165~1_combout\,
	cout => \GenPipelinedMult:mult1|auto_generated|dffe165~2\);

-- Location: LCFF_X48_Y32_N29
\GenPipelinedMult:mult1|auto_generated|dffe165\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe165~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe165~regout\);

-- Location: LCCOMB_X49_Y32_N12
\GenPipelinedMult:mult1|auto_generated|dffe166~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe166~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe165~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe165~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe166~feeder_combout\);

-- Location: LCFF_X49_Y32_N13
\GenPipelinedMult:mult1|auto_generated|dffe166\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe166~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe166~regout\);

-- Location: LCCOMB_X49_Y32_N4
\outAB[14]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[14]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe166~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe166~regout\,
	combout => \outAB[14]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N5
\outAB[14]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[14]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[14]~reg0_regout\);

-- Location: LCCOMB_X49_Y33_N2
\GenPipelinedMult:mult1|auto_generated|w294w[7]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(7) = (inB_reg(7) & inA_reg(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inB_reg(7),
	datad => inA_reg(7),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(7));

-- Location: LCFF_X49_Y33_N3
\GenPipelinedMult:mult1|auto_generated|dffe56\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe56~regout\);

-- Location: LCCOMB_X49_Y33_N20
\GenPipelinedMult:mult1|auto_generated|dffe168~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe168~feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe56~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe56~regout\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe168~feeder_combout\);

-- Location: LCFF_X49_Y33_N21
\GenPipelinedMult:mult1|auto_generated|dffe168\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe168~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe168~regout\);

-- Location: LCCOMB_X49_Y33_N16
\GenPipelinedMult:mult1|auto_generated|w294w[6]\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|w294w\(6) = (inB_reg(7) & inA_reg(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => inB_reg(7),
	datac => inA_reg(6),
	combout => \GenPipelinedMult:mult1|auto_generated|w294w\(6));

-- Location: LCFF_X49_Y33_N17
\GenPipelinedMult:mult1|auto_generated|dffe52\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|w294w\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe52~regout\);

-- Location: LCFF_X49_Y33_N11
\GenPipelinedMult:mult1|auto_generated|dffe160\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe52~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe160~regout\);

-- Location: LCCOMB_X48_Y33_N26
\GenPipelinedMult:mult1|auto_generated|dffe174~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe174~1_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe167~2\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \GenPipelinedMult:mult1|auto_generated|dffe167~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe174~1_combout\);

-- Location: LCFF_X48_Y33_N27
\GenPipelinedMult:mult1|auto_generated|dffe174\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe174~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe174~regout\);

-- Location: LCCOMB_X48_Y32_N30
\GenPipelinedMult:mult1|auto_generated|dffe172~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GenPipelinedMult:mult1|auto_generated|dffe172~1_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe177~regout\ $ (\GenPipelinedMult:mult1|auto_generated|dffe165~2\ $ (\GenPipelinedMult:mult1|auto_generated|dffe174~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \GenPipelinedMult:mult1|auto_generated|dffe177~regout\,
	datad => \GenPipelinedMult:mult1|auto_generated|dffe174~regout\,
	cin => \GenPipelinedMult:mult1|auto_generated|dffe165~2\,
	combout => \GenPipelinedMult:mult1|auto_generated|dffe172~1_combout\);

-- Location: LCFF_X48_Y32_N31
\GenPipelinedMult:mult1|auto_generated|dffe172\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GenPipelinedMult:mult1|auto_generated|dffe172~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe172~regout\);

-- Location: LCFF_X49_Y32_N31
\GenPipelinedMult:mult1|auto_generated|dffe173\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \GenPipelinedMult:mult1|auto_generated|dffe172~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GenPipelinedMult:mult1|auto_generated|dffe173~regout\);

-- Location: LCCOMB_X49_Y32_N22
\outAB[15]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \outAB[15]~reg0feeder_combout\ = \GenPipelinedMult:mult1|auto_generated|dffe173~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GenPipelinedMult:mult1|auto_generated|dffe173~regout\,
	combout => \outAB[15]~reg0feeder_combout\);

-- Location: LCFF_X49_Y32_N23
\outAB[15]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \outAB[15]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \outAB[15]~reg0_regout\);

-- Location: PIN_D16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(0));

-- Location: PIN_G15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(1));

-- Location: PIN_H16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(2));

-- Location: PIN_E15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(3));

-- Location: PIN_H15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(4));

-- Location: PIN_D15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[5]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(5));

-- Location: PIN_B17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[6]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(6));

-- Location: PIN_A17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[7]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(7));

-- Location: PIN_J17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[8]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[8]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(8));

-- Location: PIN_D19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[9]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[9]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(9));

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[10]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[10]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(10));

-- Location: PIN_G18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[11]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[11]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(11));

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[12]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[12]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(12));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[13]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[13]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(13));

-- Location: PIN_E20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[14]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[14]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(14));

-- Location: PIN_F18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\outAB[15]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \outAB[15]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_outAB(15));
END structure;


