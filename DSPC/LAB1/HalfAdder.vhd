library ieee;
use ieee.std_logic_1164.all;

entity halfAdder is
	port(ha_a, ha_b : in std_logic;
		ha_sum, ha_carry : out std_logic);
end halfAdder;

architecture dataflow of halfAdder is
	begin	
		ha_sum <= ha_a xor ha_b;
		ha_carry <= ha_a and ha_b;
end dataflow;
