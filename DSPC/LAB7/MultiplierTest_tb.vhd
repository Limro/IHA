-------------------------------------------------------------------------------
-- Title      : Testbench for design "MultiplierTest"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : MultiplierTest_tb.vhd
-- Author     :   <phm@E4300-004>
-- Company    : 
-- Created    : 2009-11-02
-- Last update: 2009-11-02
-- Platform   : 
-- Standard   : VHDL'87
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2009 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2009-11-02  1.0      phm     Created
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------------------------------------------------------

entity MultiplierTest_tb is

end MultiplierTest_tb;

-------------------------------------------------------------------------------

architecture test of MultiplierTest_tb is
  -- component generics
  constant inWidth : integer := 8;


  component MultiplierTest
--    generic (
--      inWidth : integer);
    port (
      clk   : in  std_logic;
      reset : in  std_logic;
      inA   : in  std_logic_vector(inWidth-1 downto 0);
      inB   : in  std_logic_vector(inWidth-1 downto 0);
      outAB : out std_logic_vector(2*inWidth-1 downto 0));
  end component;


  -- component ports
  signal reset : std_logic;
  signal inA   : std_logic_vector(inWidth-1 downto 0) := (others => '0');
  signal inB   : std_logic_vector(inWidth-1 downto 0) := (others => '0');
  signal outAB : std_logic_vector(2*inWidth-1 downto 0);

  signal SimEnd : boolean   := false;
  -- clock
  signal Clk    : std_logic := '1';

begin  -- test

  -- component instantiation
  DUT : MultiplierTest
--    generic map (
--      inWidth => inWidth)
    port map (
      clk   => clk,
      reset => reset,
      inA   => inA,
      inB   => inB,
      outAB => outAB);

  -- clock generation
  Clk   <= not Clk  after 10 ns when SimEnd = false;
  reset <= '0', '1' after 25 ns;

  -- waveform generation
  WaveGen_Proc : process
  begin
    -- insert signal assignments here
    wait until reset = '1';
    wait until Clk = '1';

    for i in 1 to 10 loop
      inA <= std_logic_vector(to_signed(i, 8));
      inB <= std_logic_vector(to_signed(i+1, 8));
      wait until Clk = '1';
    end loop;  -- i

    SimEnd <= true;
    wait;
  end process WaveGen_Proc;
end test;

