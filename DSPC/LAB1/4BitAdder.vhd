library ieee;
use ieee.std_logic_1164.all;

entity ADD_4_BIT is
	port( a, b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		cout : out std_logic);
	end add_4_BIT;
	
architecture structural of Add_4_BIT is
	signal i1, i2, i3, sum0, sum1, sum2, sum3 : std_logic;
	
	begin
		fa1: entity work.fullAdder port map(fa_a => a(0), fa_b => b(0), fa_cin => cin, fa_sum => sum0, fa_cout => i1);
		fa2: entity work.fullAdder port map(fa_a => a(1), fa_b => b(1), fa_cin => i1, fa_sum => sum1, fa_cout => i2);
		fa3: entity work.fullAdder port map(fa_a => a(2), fa_b => b(2), fa_cin => i2, fa_sum => sum2, fa_cout => i3);
		fa4: entity work.fullAdder port map(fa_a => a(3), fa_b => b(3), fa_cin => i3, fa_sum => sum3, fa_cout => cout);
		
		sum <= sum3 & sum2 & sum1 & sum0;
end structural;