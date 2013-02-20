library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
	port(fa_a, fa_b, fa_cin : in std_logic;
		fa_sum, fa_cout : out std_logic);
	end fullAdder;
	
architecture mixStyle of fullAdder is
	signal ha1_sum, ha1_cout, ha2_cout : std_logic;
	
	begin
		ha1: entity work.halfAdder port map( ha_a => fa_a, 
											ha_b => fa_b, 
											ha_sum => ha1_sum, 
											ha_carry => ha1_cout);
		
		ha2: entity work.halfAdder port map( ha_a => ha1_sum, 
											ha_b => fa_cin, 
											ha_sum => fa_sum, 
											ha_carry => ha2_cout);
		fa_cout <= ha1_cout or ha2_cout;
end mixStyle;