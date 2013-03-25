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
	
	signal clk     			: in  std_logic;                     			
	signal reset			: in  std_logic;                     			
	signal WE           	: in  std_logic;                     			
	signal RE            	: in  std_logic;                     			
	signal CS      			: in  std_logic;                     			
	signal address         	: in  std_logic_vector(7 downto 0);  			
	signal writedata       	: in  std_logic_vector(dataSize-1 downto 0);  	
	signal readdata        	: out std_logic_vector(dataSize-1 downto 0);  	
	
	-- Ram interface
	signal ram_Addr			: out integer range 0 to ramSize-1; 			
	signal ram_Data			: out std_logic_vector(dataSize-1 downto 0);
	signal ram_cs_module0	: out std_logic;
	signal ram_cs_module1	: out std_logic;
	
	-- PlaySound interface
	signal ram_to_play			: buffer std_logic; 
	signal ramSamples_to_read	: out std_logic_vector(7 downto 0)

	-- clock
	constant bitperiod    	: time := 10 ns;    -- clk period time
	constant sampleperiod 	: time := 3000 ns;  -- clk period time
	
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
			readdata 		=> readdata
			ram_Addr 		=> ram_Addr,
			ram_Data 		=> ram_Data,
			ram_cs_module0 	=> ram_cs_module0,
			ram_cs_module1 	=> ram_cs_module1,
			ram_to_play 	=> ram_to_play,
			ramSamples_to_read => ramSamples_to_read );
				
				
		stimulus : process
		begin
			-- assign values
			
			wait until reset_n = '1';
			wait for bitperiod;
			
			-- Do stuff
			
			wait;
		end process;
end; -- Architecture
				
				
				
				
				
				
				
				
	