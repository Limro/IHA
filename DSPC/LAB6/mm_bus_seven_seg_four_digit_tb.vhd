-------------------------------------------------------------------------------
-- Title      : Testbench for design "mm_bus_seven_seg_four_digit"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mm_bus_seven_seg_four_digit_tb.vhd
-- Author     : 
-- Company    : 
-- Created    : 2011-08-25
-- Last update: 2011-08-30
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2011 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2011-08-25  1.0      phm	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.sim_avalon.all;

-------------------------------------------------------------------------------

entity mm_bus_seven_seg_four_digit_tb is

end mm_bus_seven_seg_four_digit_tb;

-------------------------------------------------------------------------------

architecture tb of mm_bus_seven_seg_four_digit_tb is

  component mm_bus_seven_seg_four_digit
    port (
      csi_clockreset_clk     : in  std_logic;
      csi_clockreset_reset_n : in  std_logic;
      avs_s1_write           : in  std_logic;
      avs_s1_read            : in  std_logic;
      avs_s1_chipselect      : in  std_logic;
      avs_s1_address         : in  std_logic_vector(7 downto 0);
      avs_s1_writedata       : in  std_logic_vector(15 downto 0);
      avs_s1_readdata        : out std_logic_vector(15 downto 0);
      hex0                   : out std_logic_vector(6 downto 0);
      hex1                   : out std_logic_vector(6 downto 0);
      hex2                   : out std_logic_vector(6 downto 0);
      hex3                   : out std_logic_vector(6 downto 0));
  end component;

  -- constants
  constant read_wait_time  : integer := 1;
  constant write_wait_time : integer := 2;

  -- component ports
  signal csi_clockreset_clk     : std_logic := '0';
  signal csi_clockreset_reset_n : std_logic := '1';
  signal avs_s1_write           : std_logic := '0';
  signal avs_s1_read            : std_logic := '0';
  signal avs_s1_chipselect      : std_logic := '0';
  signal avs_s1_address         : std_logic_vector(7 downto 0) := (others => '0');
  signal avs_s1_writedata       : std_logic_vector(15 downto 0) := (others => '0');
  signal avs_s1_readdata        : std_logic_vector(15 downto 0) := (others => 'Z');
  signal hex0                   : std_logic_vector(6 downto 0) := (others => '1');
  signal hex1                   : std_logic_vector(6 downto 0) := (others => '1');
  signal hex2                   : std_logic_vector(6 downto 0) := (others => '1');
  signal hex3                   : std_logic_vector(6 downto 0) := (others => '1');

  -- clock
  signal Clk : std_logic := '1';

  
    signal writeValue : std_logic_vector(15 downto 0) := X"FF00";

begin  -- tb

  -- component instantiation
  DUT: mm_bus_seven_seg_four_digit
    port map (
      csi_clockreset_clk     => csi_clockreset_clk,
      csi_clockreset_reset_n => csi_clockreset_reset_n,
      avs_s1_write           => avs_s1_write,
      avs_s1_read            => avs_s1_read,
      avs_s1_chipselect      => avs_s1_chipselect,
      avs_s1_address         => avs_s1_address,
      avs_s1_writedata       => avs_s1_writedata,
      avs_s1_readdata        => avs_s1_readdata,
      hex0                   => hex0,
      hex1                   => hex1,
      hex2                   => hex2,
      hex3                   => hex3);

  -- clock generation
  Clk <= not Clk after 10 ns;
  csi_clockreset_clk <= Clk;
  csi_clockreset_reset_n <= '0', '1' after 5 ns;

  -- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here

    avalon_mm_write(
		1,
		X"00",
		writeValue,
		Clk,
		avs_s1_chipselect,
		avs_s1_write,
		avs_s1_address,
		avs_s1_writedata);
		
	wait;
	assert(hex0, "0001110") report 
	
    wait until Clk = '1';
    wait;
  end process WaveGen_Proc;

end tb;

-------------------------------------------------------------------------------

configuration mm_bus_seven_seg_four_digit_tb_tb_cfg of mm_bus_seven_seg_four_digit_tb is
  for tb
  end for;
end mm_bus_seven_seg_four_digit_tb_tb_cfg;

-------------------------------------------------------------------------------
