-- megafunction wizard: %FIR Compiler II v12.1%
-- GENERATION: XML
-- fir_filter.vhd

-- Generated using ACDS version 12.1 177 at 2013.02.22.12:52:33

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fir_filter is
	port (
		clk              : in  std_logic                     := '0';             --                     clk.clk
		reset_n          : in  std_logic                     := '0';             --                     rst.reset_n
		coeff_in_clk     : in  std_logic                     := '0';             --             coeff_clock.clk
		coeff_in_areset  : in  std_logic                     := '0';             --             coeff_reset.reset_n
		ast_sink_data    : in  std_logic_vector(23 downto 0) := (others => '0'); --   avalon_streaming_sink.data
		ast_sink_valid   : in  std_logic                     := '0';             --                        .valid
		ast_sink_error   : in  std_logic_vector(1 downto 0)  := (others => '0'); --                        .error
		ast_source_data  : out std_logic_vector(23 downto 0);                    -- avalon_streaming_source.data
		ast_source_valid : out std_logic;                                        --                        .valid
		ast_source_error : out std_logic_vector(1 downto 0)                      --                        .error
	);
end entity fir_filter;

architecture rtl of fir_filter is
	component fir_filter_0002 is
		port (
			clk              : in  std_logic                     := 'X';             -- clk
			reset_n          : in  std_logic                     := 'X';             -- reset_n
			coeff_in_clk     : in  std_logic                     := 'X';             -- clk
			coeff_in_areset  : in  std_logic                     := 'X';             -- reset_n
			ast_sink_data    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			ast_sink_valid   : in  std_logic                     := 'X';             -- valid
			ast_sink_error   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- error
			ast_source_data  : out std_logic_vector(23 downto 0);                    -- data
			ast_source_valid : out std_logic;                                        -- valid
			ast_source_error : out std_logic_vector(1 downto 0)                      -- error
		);
	end component fir_filter_0002;

begin

	fir_filter_inst : component fir_filter_0002
		port map (
			clk              => clk,              --                     clk.clk
			reset_n          => reset_n,          --                     rst.reset_n
			coeff_in_clk     => coeff_in_clk,     --             coeff_clock.clk
			coeff_in_areset  => coeff_in_areset,  --             coeff_reset.reset_n
			ast_sink_data    => ast_sink_data,    --   avalon_streaming_sink.data
			ast_sink_valid   => ast_sink_valid,   --                        .valid
			ast_sink_error   => ast_sink_error,   --                        .error
			ast_source_data  => ast_source_data,  -- avalon_streaming_source.data
			ast_source_valid => ast_source_valid, --                        .valid
			ast_source_error => ast_source_error  --                        .error
		);

end architecture rtl; -- of fir_filter
-- Retrieval info: <?xml version="1.0"?>
--<!--
--	Generated by Altera MegaWizard Launcher Utility version 1.0
--	************************************************************
--	THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
--	************************************************************
--	Copyright (C) 1991-2013 Altera Corporation
--	Any megafunction design, and related net list (encrypted or decrypted),
--	support information, device programming or simulation file, and any other
--	associated documentation or information provided by Altera or a partner
--	under Altera's Megafunction Partnership Program may be used only to
--	program PLD devices (but not masked PLD devices) from Altera.  Any other
--	use of such megafunction design, net list, support information, device
--	programming or simulation file, or any other related documentation or
--	information is prohibited for any other purpose, including, but not
--	limited to modification, reverse engineering, de-compiling, or use with
--	any other silicon devices, unless such use is explicitly licensed under
--	a separate agreement with Altera or a megafunction partner.  Title to
--	the intellectual property, including patents, copyrights, trademarks,
--	trade secrets, or maskworks, embodied in any such megafunction design,
--	net list, support information, device programming or simulation file, or
--	any other related documentation or information provided by Altera or a
--	megafunction partner, remains with Altera, the megafunction partner, or
--	their respective licensors.  No other licenses, including any licenses
--	needed under any third party's intellectual property, are provided herein.
---->
-- Retrieval info: <instance entity-name="altera_fir_compiler_ii" version="12.1" >
-- Retrieval info: 	<generic name="deviceFamily" value="Cyclone II" />
-- Retrieval info: 	<generic name="filterType" value="Single Rate" />
-- Retrieval info: 	<generic name="interpFactor" value="1" />
-- Retrieval info: 	<generic name="decimFactor" value="1" />
-- Retrieval info: 	<generic name="L_bandsFilter" value="All taps" />
-- Retrieval info: 	<generic name="clockRate" value="50" />
-- Retrieval info: 	<generic name="clockSlack" value="0" />
-- Retrieval info: 	<generic name="speedGrade" value="Medium" />
-- Retrieval info: 	<generic name="coeffReload" value="false" />
-- Retrieval info: 	<generic name="baseAddress" value="0" />
-- Retrieval info: 	<generic name="readWriteMode" value="Read/Write" />
-- Retrieval info: 	<generic name="backPressure" value="false" />
-- Retrieval info: 	<generic name="symmetryMode" value="Non Symmetry" />
-- Retrieval info: 	<generic name="delayRAMBlockThreshold" value="20" />
-- Retrieval info: 	<generic name="dualMemDistRAMThreshold" value="1280" />
-- Retrieval info: 	<generic name="mRAMThreshold" value="1000000" />
-- Retrieval info: 	<generic name="hardMultiplierThreshold" value="-1" />
-- Retrieval info: 	<generic name="inputRate" value="50" />
-- Retrieval info: 	<generic name="inputChannelNum" value="1" />
-- Retrieval info: 	<generic name="inputType" value="Signed Binary" />
-- Retrieval info: 	<generic name="inputBitWidth" value="24" />
-- Retrieval info: 	<generic name="inputFracBitWidth" value="0" />
-- Retrieval info: 	<generic name="coeffSetRealValue" value="0.0176663,0.013227,0.0,-0.0149911,-0.0227152,-0.0172976,0.0,0.0204448,0.0318046,0.0249882,0.0,-0.0321283,-0.0530093,-0.04498,0.0,0.0749693,0.159034,0.224907,0.249809,0.224907,0.159034,0.0749693,0.0,-0.04498,-0.0530093,-0.0321283,0.0,0.0249882,0.0318046,0.0204448,0.0,-0.0172976,-0.0227152,-0.0149911,0.0,0.013227,0.0176663" />
-- Retrieval info: 	<generic name="coeffType" value="Signed Binary" />
-- Retrieval info: 	<generic name="coeffScaling" value="Auto" />
-- Retrieval info: 	<generic name="coeffBitWidth" value="8" />
-- Retrieval info: 	<generic name="coeffFracBitWidth" value="0" />
-- Retrieval info: 	<generic name="outType" value="Signed Binary" />
-- Retrieval info: 	<generic name="outMSBRound" value="Truncation" />
-- Retrieval info: 	<generic name="outMsbBitRem" value="0" />
-- Retrieval info: 	<generic name="outLSBRound" value="Truncation" />
-- Retrieval info: 	<generic name="outLsbBitRem" value="14" />
-- Retrieval info: 	<generic name="resoureEstimation" value="1000,1200,10" />
-- Retrieval info: 	<generic name="bankCount" value="1" />
-- Retrieval info: 	<generic name="bankDisplay" value="0" />
-- Retrieval info: </instance>
-- IPFS_FILES : NONE
