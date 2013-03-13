library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity power3 is
	port( 
		clk	: in std_logic;
		X	: in std_logic_vector (7 downto 0);
		XPower : out std_logic_vector (7 downto 0)
		);
end power3;

architecture modul of power3 is
	--signal XPower1, XPower2, X1, X2 : signed (7 downto 0);
	signal XPower2, X2 : signed (7 downto 0);

begin
	process(clk) 
	begin
		if rising_edge(clk) then
--			X1 <= signed(X);
--			XPower1 <= signed(X);
--			
--			--Stage 2
--			X2 <= X1;
--			XPower2 <= resize(XPower1 * X1, 8);
--			
--			--Stage 3
--			XPower <= std_logic_vector(resize(XPower2 * X2, 8));

			
			--Optimize
			--Stage 2
			X2 <= signed(X);
			XPower2 <= resize(signed(X) * signed(X), 8);
			
			--Stage 3
			XPower <= std_logic_vector(resize(XPower2 * X2, 8));
		end if;
	end process;

end modul;