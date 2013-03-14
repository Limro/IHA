library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TransferProtocol is
	generic(
		dataSize 		: natural := 32 -- bits der overføres
		);
		
	port(
		-- Avalon Interface
		clk     		: in  std_logic;                     			-- Avalon Clk
		reset			: in  std_logic;                     			-- Avalon Reset
		WE           	: in  std_logic;                     			-- Avalon wr
		RE            	: in  std_logic;                     			-- Avalon rd
		CS      		: in  std_logic;                     			-- Avalon cs
		address         : in  std_logic_vector(7 downto 0);  			-- Avalon address
		writedata       : in  std_logic_vector(dataSize-1 downto 0);  	-- Avalon wr data, previous 15 downto 0
		readdata        : out std_logic_vector(dataSize-1 downto 0);  	-- Avalon rd data, previous 15 downto 0
		
		-- Ram interface
		ram_Addr		: out std_logic_vector(dataSize-1 downto 0);
		ram_Data		: out std_logic_vector(dataSize-1 downto 0);
		ram_cs_module0	: out std_logic;
		ram_cs_module1	: out std_logic;
		
		-- PlaySound interface
		ram_to_play		: out std_logic; 
		ram_to_read		: out signed
		);
end entity TransferProtocol;

architecture protocol of TransferProtocol is
	signal index : integer range 0 to 256 := 0;
	variable ram0Count, ram1Count : signed;
	
begin	
	getData: process(clk) 
	begin	
		if clk = '1' and CS = '1' then					-- is active
			if WE = '1' then 							-- should write to ram
				
				if address = "00000000" 				-- Write on ram module 0
					ram0Count <= address;
				elsif address = "00000003"				-- Write on ram module 1
					ram1Count <= address;
				end if;
				
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
				if index = to_integer(signed(address)) then -- all data written
					index <= 0; 						-- index reset
				else
					ram_Addr <= index;					-- write addr to ram
					ram_Data <= writedata; 				-- write data to ram
					index <= index +1;					-- increment index
				end if;
				
				--What to play
				if index = 0  then							-- tone written in ram
					ram_to_play <= not ram_to_play;			-- switch which ram block to use
					if (not ram_to_play) = '0' then			-- how many readings
						ram_to_read <= ram0Count;
					else
						ram_to_read <= ram1Count;
					end if;
				end if;				
				
			end if;
		end if;

	end process getData;
	
end protocol;