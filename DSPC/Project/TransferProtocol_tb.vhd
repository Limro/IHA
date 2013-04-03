library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity transferProtocol_tb is
end;

architecture bench of transferProtocol_tb is

	component TransferProtocol
		generic (
			dataSize 	: natural;
			ramSize 	: natural );
	
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
	end component;
	
	constant dataSize 		: natural := 32;
	constant ramSize 		: natural := 2048;
	
	signal clk     			: std_logic								:= '0';
	signal reset			: std_logic								:= '0';                     			
	signal WE           	: std_logic								:= '0';
	signal RE            	: std_logic								:= '0';
	signal CS      			: std_logic								:= '0';
	signal address         	: std_logic_vector(7 downto 0)			:= (others => '0');  			
	signal writedata       	: std_logic_vector(dataSize-1 downto 0) := (others => '0');  	
	signal readdata        	: std_logic_vector(dataSize-1 downto 0) := (others => '0');  	
	
	-- Ram interface
	signal ram_Addr			: integer range 0 to ramSize-1			:= 0; 			
	signal ram_Data			: std_logic_vector(dataSize-1 downto 0)	:= (others => '0');
	signal ram_cs_module0	: std_logic								:= '0';
	signal ram_cs_module1	: std_logic								:= '0';
	
	-- PlaySound interface
	signal ram_to_play			: std_logic							:= '0';
	signal ramSamples_to_read	: std_logic_vector(7 downto 0)		:= (others => '0');

	-- clock
	constant bitperiod    	: time 		:= 10 ns;    -- clk period time
	
begin
	TransferProtocol_init : TransferProtocol
		generic map (
			dataSize 		=> dataSize,
			ramSize 		=> ramSize)
		port map(
			clk 			=> clk,
			reset 			=> reset,
			WE 				=> WE,
			RE 				=> RE,
			CS 				=> CS,
			address			=> address,
			writedata 		=> writedata,
			readdata 		=> readdata,
			ram_Addr 		=> ram_Addr,
			ram_Data 		=> ram_Data,
			ram_cs_module0 	=> ram_cs_module0,
			ram_cs_module1 	=> ram_cs_module1,
			ram_to_play 	=> ram_to_play,
			ramSamples_to_read => ramSamples_to_read );
		
		clk <= not clk after bitperiod/2;
		
		stimulus : process
		begin
			
			address <= "00000000"; 		-- Write on RAM 0
			CS <= '1'; 					-- CS active
			WE <= '1'; 					-- WE active
			writedata <= "00000000000000000000000000000010" ; 	-- Write twice to the ram
			
			wait for bitperiod;
			
			assert(ram_to_play = '1')
			report "ram_to_play set wrong" severity error;
					
			assert(ramSamples_to_read = "00000010")
			report "ramSamples_to_read is not 2" severity error;
			
			
			address <= "00000010"; 		-- Write data to RAM
			writedata <= "00000000000000000000000000001000"; 	-- Write 8 to the ram
			
			wait for bitperiod;
			
			assert((ram_cs_module0 = '1') and (ram_cs_module1 = '0'))
			report "ram_cs_module0 not set" severity error;
			
			address <= "00000010"; 		-- Write data to RAM
			writedata <= "00000000000000000000000000000111"; 	-- Write 7 to the ram
			
			wait for bitperiod;
				
			address <= "00000001"; 		-- Write on RAM 1
			writedata <= "00000000000000000000000000000001"; 	-- Write 7 to the ram
			
			wait for bitperiod;
			
			address <= "00000010"; 		-- Write data to RAM
			writedata <= "00000000000000000000000000000101"; 	-- Write 5 to the ram
			
			wait for bitperiod;
			
			WE <= '0';
			
			assert((ram_cs_module0 = '0') and (ram_cs_module1 = '1')) -- check correct ram module is selected 
			report "Ram did not change" severity error;
		
			wait;
		end process;
end; -- Architecture
				
configuration transferProtocol_tb_cfg of transferProtocol_tb is
	for bench
	end for;
end transferProtocol_tb_cfg;