library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vector_mult is

port (dataa, datab : in std_logic_vector(31 downto 0);
      result : out std_logic_vector(31 downto 0));

end vector_mult;

architecture behavior of vector_mult is
  signal tmp1: signed(15 downto 0);
  signal tmp2: signed(15 downto 0);
  signal tmp3: signed(15 downto 0);
  signal tmp4: signed(15 downto 0);
  signal res: signed(31 downto 0);
begin
  tmp1 <= SIGNED(dataa(7 downto 0)) * SIGNED(datab(7 downto 0));  
  tmp2 <= SIGNED(dataa(15 downto 8)) * SIGNED(datab(15 downto 8));  
  tmp3 <= SIGNED(dataa(23 downto 16)) * SIGNED(datab(23 downto 16));  
  tmp4 <= SIGNED(dataa(31 downto 24)) * SIGNED(datab(31 downto 24));  
  res <= resize(tmp1, 32) + resize(tmp2, 32) + resize(tmp3, 32) + resize(tmp4, 32);
  result <= std_logic_vector(res);
end;