-------------------------------------------------------------------------------
-- Title      : Testbench for design "mm_bus_counter"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : mm_bus_counter_tb.vhd
-- Author     : 
-- Company    : 
-- Created    : 2011-08-24
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
-- 2011-08-24  1.0      phm	Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use work.sim_avalon.all;
-------------------------------------------------------------------------------

entity mm_bus_counter_tb is

end mm_bus_counter_tb;

-------------------------------------------------------------------------------

architecture tb of mm_bus_counter_tb is

  component mm_bus_counter
    port (
      csi_clockreset_clk     : in  std_logic;
      csi_clockreset_reset_n : in  std_logic;
      avs_s1_write           : in  std_logic;
      avs_s1_read            : in  std_logic;
      avs_s1_chipselect      : in  std_logic;
      avs_s1_address         : in  std_logic_vector(7 downto 0);
      avs_s1_writedata       : in  std_logic_vector(15 downto 0);
      avs_s1_readdata        : out std_logic_vector(15 downto 0);
      ins_irq0_irq           : out std_logic;
      input_irq              : in std_logic;
      input_counter          : in std_logic);

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
  signal avs_s1_address         : std_logic_vector(7 downto 0):= (others => '0');
  signal avs_s1_writedata       : std_logic_vector(15 downto 0):= (others => 'Z');
  signal avs_s1_readdata        : std_logic_vector(15 downto 0):= (others => 'Z');
  signal ins_irq0_irq           : std_logic := '0';
  signal input_irq              : std_logic := '1';
  signal input_counter          : std_logic := '1';

  -- clock
  signal Clk : std_logic := '1';
  
begin  -- tb

  -- component instantiation
  DUT: mm_bus_counter
    port map (
      csi_clockreset_clk     => csi_clockreset_clk,
      csi_clockreset_reset_n => csi_clockreset_reset_n,
      avs_s1_write           => avs_s1_write,
      avs_s1_read            => avs_s1_read,
      avs_s1_chipselect      => avs_s1_chipselect,
      avs_s1_address         => avs_s1_address,
      avs_s1_writedata       => avs_s1_writedata,
      avs_s1_readdata        => avs_s1_readdata,
      ins_irq0_irq           => ins_irq0_irq,
      input_irq              => input_irq,
      input_counter          => input_counter);

  -- clock generation
  Clk <= not Clk after 10 ns;
  csi_clockreset_clk <= Clk;
  csi_clockreset_reset_n <= '0', '1' after 5 ns;

  input_counter <= not input_counter after 13 ns;
  
  -- waveform generation
  WaveGen_Proc: process
  begin

-- insert signal assignments here
-- avalon_mm_write(write_wait_time, <address>, <data>, Clk, avs_s1_chipselect,
--                 avs_s1_write, avs_s1_address, avs_s1_writedata);
 
    wait;
  end process WaveGen_Proc;

  

end tb;

-------------------------------------------------------------------------------

configuration mm_bus_counter_tb_tb_cfg of mm_bus_counter_tb is
  for tb
  end for;
end mm_bus_counter_tb_tb_cfg;

-------------------------------------------------------------------------------
