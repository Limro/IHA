library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TransferProtocol is
	generic(
		dataSize 	: natural := 32 -- bits der overfÃƒÆ’Ã†â€™Ãƒâ€ Ã¢â‚¬â„¢ÃƒÆ’Ã¢â‚¬Å¡Ãƒâ€šÃ‚Â¸res
		);
		
	port(
		-- Avalon Interface
		csi_clockreset_clk     	: in  std_logic;                     -- Avalon Clk
		csi_clockreset_reset_n 	: in  std_logic;                     -- Avalon Reset
		avs_s1_write           	: in  std_logic;                     -- Avalon wr
		avs_s1_read            	: in  std_logic;                     -- Avalon rd
		avs_s1_chipselect      	: in  std_logic;                     -- Avalon cs
		avs_s1_address         	: in  std_logic_vector(7 downto 0);  -- Avalon address
		avs_s1_writedata       	: in  std_logic_vector(dataSize-1 downto 0);  -- Avalon wr data, previous 15 downto 0
		--avs_s1_readdata        	: out std_logic_vector(dataSize-1 downto 0);  -- Avalon rd data, previous 15 downto 0
		
		-- Ram interface
		ram_Addr				: out std_logic_vector(dataSize-1 downto 0);
		ram_Data				: out std_logic_vector(dataSize-1 downto 0);
		ram_cs_module0			: out std_logic;
		ram_cs_module1			: out std_logic;
		ram_InUse				: buffer std_logic
		);
end entity TransferProtocol;

architecture protocol of TransferProtocol is
	signal index : integer range 0 to 256 := 0;
	
begin	
	getData: process(csi_clockreset_clk) 
	begin	
		if csi_clockreset_clk = '1' and avs_s1_chipselect = '1' then -- is active
			if avs_s1_write = '1' then 					-- should write to ram

				--Which ram module to use
				if ram_InUse = '0' then 				-- First ram module in use
					ram_cs_module0 <= '0';
					ram_cs_module1 <= '1';
					index <= 0;
				else									-- Second ram module in use
					ram_cs_module0 <= '1';
					ram_cs_module1 <= '0';
					index <= 0;
				end if;

				--What to write on ram module
				if index = to_integer(signed(avs_s1_address)) then 	-- all data written
					index <= 0; 						-- index reset
				else
					ram_Data <= avs_s1_writedata; 		-- write data to ram
					index <= index +1;					-- increment index
				end if;
				
				--What to play
				if index = 0  then						-- tone written in ram
					ram_InUse <= not ram_InUse;			-- switch which ram block to use
				end if;				
				
			end if;
		end if;

	end process getData;
	
end protocol;