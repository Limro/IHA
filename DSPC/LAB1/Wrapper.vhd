-- Top level wrapper entity
library  ieee;
use ieee.std_logic_1164.all;

entity exercise1 is
	port (SW   : in  std_logic_vector(8 downto 0);
      LEDR : out std_logic_vector(4 downto 0)); 
end exercise1;

architecture structural of exercise1 is
 begin
  u1: entity work.ADD_4_BIT 
    port map(
    a => SW(3 downto 0),
    b => SW(7 downto 4),
	 cin => SW(8),
    sum => LEDR(3 downto 0),
    cout => LEDR(4));
end structural;