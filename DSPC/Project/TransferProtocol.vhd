library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TransferProtocol is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		ramSize		: natural := 2048 -- ram-modul i bytes
		);
		
	port(
		-- Avalon Interface
		clk     			: in  std_logic;                     			-- Avalon Clk
		reset				: in  std_logic;                     			-- Avalon Reset
		WE           		: in  std_logic;                     			-- Avalon wr
		RE            		: in  std_logic;                     			-- Avalon rd
		CS      			: in  std_logic;                     			-- Avalon cs
		address         	: in  std_logic_vector(7 downto 0);  			-- Avalon address
		writedata       	: in  std_logic_vector(dataSize-1 downto 0);  	-- Avalon wr data, previous 15 downto 0
		readdata        	: out std_logic_vector(dataSize-1 downto 0);  	-- Avalon rd data, previous 15 downto 0
		
		-- Ram interface
		ram_Addr			: out integer range 0 to ramSize-1; 			
		ram_Data			: out std_logic_vector(dataSize-1 downto 0);
		ram_cs_module0		: out std_logic;
		ram_cs_module1		: out std_logic;
		
		-- PlaySound interface
		ram_to_play			: buffer std_logic; 
		ramSamples_to_read	: out std_logic_vector(7 downto 0)
		);
end entity TransferProtocol;

architecture protocol of TransferProtocol is
	signal index : integer range 0 to 256 := 0;
	
begin	
	getData: process(clk, reset) 
	begin	
	    if reset = '0' then
			ram_to_play <= '0';
			ram_cs_module0 <= '0';
			ram_cs_module1 <= '0';
			ramSamples_to_read <= "00000000";
			
		elsif rising_edge(clk) then
			ram_cs_module0 <= '0';
			ram_cs_module1 <= '0';
			if CS = '1' then							-- is active
				if WE = '1' then 						-- should write to ram
				
					-- Write on ram module 0
					if address = "00000000" then			
						ramSamples_to_read <= writedata(7 downto 0);
						index <= 0;
						ram_to_play <= '1';
						
					-- Write on ram module 1
					elsif address = "00000001" then			
						ramSamples_to_read <= writedata(7 downto 0);
						index <= 0;
						ram_to_play <= '0';
						
					--What to write on ram module
					elsif address = "00000010" then	 	-- binary, address = 2
						ram_Addr <= index;				-- write addr to ram
						ram_Data <= writedata; 			-- write data to ram
						index <= index + 1;				-- increment index				    
						
						--Which ram module to use
						if ram_to_play = '0' then 		-- First ram module in use
							ram_cs_module1 <= '1';
						else							-- Second ram module in use
							ram_cs_module0 <= '1';
						end if;
					end if;
												
				end if;
			end if;
		end if;

	end process getData;
	
end protocol;