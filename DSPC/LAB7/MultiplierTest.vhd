library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lpm;
use lpm.all;

entity MultiplierTest is
  generic (
    inWidth : integer := 8);            -- Input Bit width
  port (
    clk   : in  std_logic;
    reset : in  std_logic;
    inA   : in  std_logic_vector(inWidth-1 downto 0);
    inB   : in  std_logic_vector(inWidth-1 downto 0);
    outAB : out std_logic_vector(2*inWidth-1 downto 0));

end MultiplierTest;

architecture behaviour of MultiplierTest is

  -- Constant to determine pipeline depth:
  constant MULT_PIPELINE_DEPTH : integer := 5;  -- Set -1 to disable lpm_mult
                                                -- instantiation
  -- Set true to use MyMult
  constant USE_MY_OWN_MULTIPLIER : boolean := false;

  -- use Logic Elements
  constant lpm_hint : string := "DEDICATED_MULTIPLIER_CIRCUITRY=NO,MAXIMIZE_SPEED=5";
  -- use EMBEDDED MULTIPLIER 
  -- Also requires Analysis & Synth Settting: DSP Balancing = Auto
--  constant lpm_hint : string := "DEDICATED_MULTIPLIER_CIRCUITRY=YES,MAXIMIZE_SPEED=5";

  signal inA_reg : std_logic_vector(inWidth-1 downto 0);
  signal inB_reg : std_logic_vector(inWidth-1 downto 0);
  signal multAB  : std_logic_vector(2*inWidth-1 downto 0);

  component lpm_mult
    generic (
      lpm_hint           : string;
      lpm_representation : string;
      lpm_type           : string;
      lpm_widtha         : natural;
      lpm_widthb         : natural;
      lpm_widthp         : natural;
      lpm_pipeline       : natural
      );
    port (
      dataa  : in  std_logic_vector (7 downto 0);
      datab  : in  std_logic_vector (7 downto 0);
      result : out std_logic_vector (15 downto 0);
      clock  : in  std_logic
      );
  end component;

  
begin  -- behaviour

-------------------------------------------------------------------------------
-- Multiplier Instantiation
-- Clock input must be "open" in case of no pipelining
-- This us done using if-generate sentences
------------------------------------------------------------------------------- 
  GenPipelinedMult : if (USE_MY_OWN_MULTIPLIER = false) and (MULT_PIPELINE_DEPTH > 0) generate
    
    mult1 : lpm_mult
      generic map (
        lpm_hint           => lpm_hint,
        lpm_representation => "UNSIGNED",
        lpm_type           => "LPM_MULT",
        lpm_widtha         => inWidth,
        lpm_widthb         => inWidth,
        lpm_widthp         => inWidth*2,
        lpm_pipeline       => MULT_PIPELINE_DEPTH
        )
      port map (
        dataa  => inA_reg,
        datab  => inB_reg,
        result => multAB,
        clock  => clk
        );
  end generate GenPipelinedMult;

  GenMult : if (USE_MY_OWN_MULTIPLIER = false) and (MULT_PIPELINE_DEPTH = 0) generate
    
    mult1 : lpm_mult
      generic map (
        lpm_hint           => lpm_hint,
        lpm_representation => "UNSIGNED",
        lpm_type           => "LPM_MULT",
        lpm_widtha         => inWidth,
        lpm_widthb         => inWidth,
        lpm_widthp         => inWidth*2,
        lpm_pipeline       => MULT_PIPELINE_DEPTH
        )
      port map (
        dataa  => inA_reg,
        datab  => inB_reg,
        result => multAB,
        clock  => open                  -- Open for non-pipelined multiplier
        );
  end generate GenMult;

  GenMyMult : if (USE_MY_OWN_MULTIPLIER = true) generate
    
    MyMult_1: entity work.MyMult
      generic map (
        inWidth => inWidth)
      port map (
        clk    => clk,
        reset  => reset,
        inA    => inA_reg,
        inB    => inB_reg,
        result => multAB
        );

  end generate GenMyMult;
  
-------------------------------------------------------------------------------
-- Multiplying Process
-------------------------------------------------------------------------------
  Multiply_proc : process (clk, reset)
  begin  -- process accessMem
    if reset = '0' then
      outAB <= (others => '0');
    elsif clk'event and clk = '1' then  -- rising clock edge
      inA_reg <= inA;
      inB_reg <= inB;

      -- 1. Use * Operator 
      --outAB     <= std_logic_vector(unsigned(inA) * unsigned(inB));

      -- 2/3. Use LPM/MyMult instance
      outAB <= MultAB;

    end if;
  end process Multiply_proc;

end behaviour;
