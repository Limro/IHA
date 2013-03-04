LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_misc.all;

-- ******************************************************************************
-- * License Agreement                                                          *
-- *                                                                            *
-- * Copyright (c) 1991-2012 Altera Corporation, San Jose, California, USA.     *
-- * All rights reserved.                                                       *
-- *                                                                            *
-- * Any megafunction design, and related net list (encrypted or decrypted),    *
-- *  support information, device programming or simulation file, and any other *
-- *  associated documentation or information provided by Altera or a partner   *
-- *  under Altera's Megafunction Partnership Program may be used only to       *
-- *  program PLD devices (but not masked PLD devices) from Altera.  Any other  *
-- *  use of such megafunction design, net list, support information, device    *
-- *  programming or simulation file, or any other related documentation or     *
-- *  information is prohibited for any other purpose, including, but not       *
-- *  limited to modification, reverse engineering, de-compiling, or use with   *
-- *  any other silicon devices, unless such use is explicitly licensed under   *
-- *  a separate agreement with Altera or a megafunction partner.  Title to     *
-- *  the intellectual property, including patents, copyrights, trademarks,     *
-- *  trade secrets, or maskworks, embodied in any such megafunction design,    *
-- *  net list, support information, device programming or simulation file, or  *
-- *  any other related documentation or information provided by Altera or a    *
-- *  megafunction partner, remains with Altera, the megafunction partner, or   *
-- *  their respective licensors.  No other licenses, including any licenses    *
-- *  needed under any third party's intellectual property, are provided herein.*
-- *  Copying or modifying any file, or portion thereof, to which this notice   *
-- *  is attached violates this copyright.                                      *
-- *                                                                            *
-- * THIS FILE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR    *
-- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,   *
-- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL    *
-- * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER *
-- * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING    *
-- * FROM, OUT OF OR IN CONNECTION WITH THIS FILE OR THE USE OR OTHER DEALINGS  *
-- * IN THIS FILE.                                                              *
-- *                                                                            *
-- * This agreement shall be governed in all respects by the laws of the State  *
-- *  of California and by the laws of the United States of America.            *
-- *                                                                            *
-- ******************************************************************************

-- ******************************************************************************
-- *                                                                            *
-- * This module chipselects reads and writes to the sram, with 2-cycle         *
-- *  read latency and one cycle write latency.                                 *
-- *                                                                            *
-- ******************************************************************************


ENTITY sram_0 IS


-- *****************************************************************************
-- *                             Generic Declarations                          *
-- *****************************************************************************

-- *****************************************************************************
-- *                             Port Declarations                             *
-- *****************************************************************************
PORT (
	-- Inputs
	clk				:IN		STD_LOGIC;
	reset				:IN		STD_LOGIC;

	address			:IN		STD_LOGIC_VECTOR(17 DOWNTO  0);	
	byteenable		:IN		STD_LOGIC_VECTOR( 1 DOWNTO  0);	
	read				:IN		STD_LOGIC;
	write				:IN		STD_LOGIC;
	writedata		:IN		STD_LOGIC_VECTOR(15 DOWNTO  0);	

	-- Bi-Directional
	SRAM_DQ			:INOUT	STD_LOGIC_VECTOR(15 DOWNTO  0);	-- SRAM Data bus 16 Bits

	-- Outputs
	readdata			:BUFFER	STD_LOGIC_VECTOR(15 DOWNTO  0);	
	readdatavalid	:BUFFER	STD_LOGIC;

	SRAM_ADDR		:BUFFER	STD_LOGIC_VECTOR(17 DOWNTO  0);	-- SRAM Address bus 18 Bits
	SRAM_LB_N		:BUFFER	STD_LOGIC;								-- SRAM Low-byte Data Mask 
	SRAM_UB_N		:BUFFER	STD_LOGIC;								-- SRAM High-byte Data Mask 
	SRAM_CE_N		:BUFFER	STD_LOGIC;								-- SRAM Chip chipselect
	SRAM_OE_N		:BUFFER	STD_LOGIC;								-- SRAM Output chipselect
	SRAM_WE_N		:BUFFER	STD_LOGIC								-- SRAM Write chipselect

);

END sram_0;

ARCHITECTURE Behaviour OF sram_0 IS
-- *****************************************************************************
-- *                           Constant Declarations                           *
-- *****************************************************************************

-- *****************************************************************************
-- *                       Internal Signals Declarations                       *
-- *****************************************************************************
	
	-- Internal Wires
	
	-- Internal Registers
	SIGNAL	is_read			:STD_LOGIC;
	SIGNAL	is_write			:STD_LOGIC;
	SIGNAL	writedata_reg	:STD_LOGIC_VECTOR(15 DOWNTO  0);	
	
	-- State Machine Registers
	
-- *****************************************************************************
-- *                          Component Declarations                           *
-- *****************************************************************************
BEGIN
-- *****************************************************************************
-- *                         Finite State Machine(s)                           *
-- *****************************************************************************


-- *****************************************************************************
-- *                             Sequential Logic                              *
-- *****************************************************************************

	-- Output Registers
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			readdata			<= SRAM_DQ;
			readdatavalid	<= is_read;
			
			SRAM_ADDR		<= address;
			SRAM_LB_N		<= NOT (byteenable(0) AND (read OR write));
			SRAM_UB_N		<= NOT (byteenable(1) AND (read OR write));
			SRAM_CE_N		<= NOT (read OR write);
			SRAM_OE_N		<= NOT read;
			SRAM_WE_N		<= NOT write;
		END IF;
	END PROCESS;


	-- Internal Registers
	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF (reset = '1') THEN
				is_read		<= '0';
			ELSE
				is_read		<= read;
			END IF;
		END IF;
	END PROCESS;


	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			IF (reset = '1') THEN
				is_write		<= '0';
			ELSE
				is_write		<= write;
			END IF;
		END IF;
	END PROCESS;


	PROCESS (clk)
	BEGIN
		IF clk'EVENT AND clk = '1' THEN
			writedata_reg	<= writedata;
		END IF;
	END PROCESS;


-- *****************************************************************************
-- *                            Combinational Logic                            *
-- *****************************************************************************

	-- Output Assignments
	SRAM_DQ <= writedata_reg WHEN (is_write = '1') ELSE (OTHERS => 'Z');

	-- Internal Assignments

-- *****************************************************************************
-- *                          Component Instantiations                         *
-- *****************************************************************************



END Behaviour;

