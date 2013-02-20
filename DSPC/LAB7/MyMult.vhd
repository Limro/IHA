library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library lpm;
use lpm.all;

entity MyMult is
  
  generic (
    inWidth : integer := 8);              -- input bit-width

  port (
    clk    : in  std_logic;
    reset  : in  std_logic;
    inA    : in  std_logic_vector(inWidth-1 downto 0);
    inB    : in  std_logic_vector(inWidth-1 downto 0);
    result : out std_logic_vector(2*inWidth-1 downto 0));

end MyMult;

architecture behaviour of MyMult is

begin  -- behaviour

  -->>>>>> PLACE YOUR OWN CODE HERE INSTEAD
  result <= std_logic_vector(unsigned(inA) * unsigned(inB));
  --<<<<<<

end behaviour;
