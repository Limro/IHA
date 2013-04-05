library ieee;
use ieee.std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ramAccess is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		ramSize		: natural := 256 -- ram-modul i bytes
		);
		
	port(
		-- Inputs
		clk			: in std_logic; -- The clock
		reset_n		: in std_logic;
		CS			: in std_logic; -- Chip selected or not
		writeAddr	: in integer range 0 to ramSize-1; -- Address to write to
		readAddr	: in integer range 0 to ramSize-1; -- Address to read from
		writedata	: in std_logic_vector(dataSize-1 downto 0); -- Data to write into ram
		
		-- Outputs
		readData	: out std_logic_vector(dataSize-1 downto 0)	-- Data to read from ram
		);
end ramAccess;

architecture rtl of ramAccess is
	type MEM is array(0 to ramSize-1) of std_logic_vector(dataSize-1 downto 0); -- Array with stc_logic_vectors
	signal ram_block : MEM; --Ram Module
begin

	process (clk, reset_n)
	begin
		if reset_n = '0' then
			ram_block <= (others => (others => '0'));
			readData <= (others => '0');
			
		elsif rising_edge(clk) then
			if CS = '1' then
				ram_block(writeAddr) <= writedata;
			end if;
			
			readData <= ram_block(readAddr);
		end if;
	end process;

end rtl;