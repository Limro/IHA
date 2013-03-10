library ieee
use ieee.std_logic_1164.all;

entity ramAccess is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		ramSize	: natural := 2048 -- ram-modul i bytes
		);
		
	port(
		-- Inputs
		clk			: in std_logic; -- The clock
		chipSelect	: in std_logic; -- Chip selected or not
		writeAddr	: in integer range 0 to ramSize-1; -- Address to write to
		readAddr	: in integer range 0 to ramSize-1; -- Address to fread from
		data	: in std_logic_vector(dataSize-1 downto 0); -- Data to write into ram
		
		-- Outputs
		readData	: out std_logic_vector(dataSize-1 downto 0)	-- Data to read from ram
		);
end ramAccess;

architecture rtl of ramAccess is
	type MEM is array(0 to ramSize-1) of std_logic_vector(dataSize-1 downto 0); -- Array with stc_logic_vectors
	signal ram_block : MEM; --Ram Module
begin

	process (clk)
	begin
		if (clk'event and clk = '1') then
			if chipSelect = '1' then
				ram_block(writeAddr) <= data;
			end if;
			
			readData <= ram_block(readAddr);
		end if;
	end process;

end rtl;
