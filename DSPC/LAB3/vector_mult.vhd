library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vector_mult is
port(dataa, datab : in std_logic_vector(31 downto 0);
  result : out std_logic_vector(31 downto 0));
end vector_mult;

architecture actions of vector_mult is

signal mult0, mult1, mult2, mult3 : signed(15 downto 0);

begin
  
  mult0 <= SIGNED(dataa(7 downto 0)) * SIGNED(datab(7 downto 0));
  mult1 <= SIGNED(dataa(15 downto 8)) * SIGNED(datab(15 downto 8));
  mult2 <= SIGNED(dataa(23 downto 16)) * SIGNED(datab(23 downto 16));
  mult3 <= SIGNED(dataa(31 downto 24)) * SIGNED(datab(31 downto 24));
  
  result <= std_logic_vector(resize(mult0,32) + resize(mult1,32) + resize(mult2,32) + resize(mult3,32));
end actions;