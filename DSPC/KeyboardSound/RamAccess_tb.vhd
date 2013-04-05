library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity ramAccess_tb is
end;

architecture bench of ramAccess_tb is

	component ramAccess
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
	end component;
	
	constant dataSize 	: natural 								:= 32;
	constant ramSize 	: natural 								:= 256;
	
	signal clk			: std_logic								:= '0'; -- The clock
	signal reset_n		: std_logic								:= '1';
	signal CS			: std_logic								:= '0'; -- Chip selected or not
	signal writeAddr	: integer range 0 to ramSize-1			:= 0; -- Address to write to
	signal readAddr		: integer range 0 to ramSize-1			:= 0; -- Address to read from
	signal writedata	: std_logic_vector(dataSize-1 downto 0)	:= (others => '0'); -- Data to write into ram
	signal readData		: std_logic_vector(dataSize-1 downto 0)	:= (others => '0'); -- Data to read from ram
	
	-- clock
	constant bitperiod    	: time 		:= 10 ns;    -- clk period time

begin
	RA : ramAccess
		generic map (
			dataSize 	=> dataSize,
			ramSize 	=> ramSize )
		port map (
			clk 		=> clk,
			reset_n		=> reset_n,
			CS 			=> CS,
			writeAddr 	=> writeAddr,
			readAddr 	=> readAddr,
			writedata 	=> writedata,
			readData 	=> readData );
		
	clk <= not clk after bitperiod/2;
	reset_n <= '0', '1' after 50 ns;	
	
	stimulus : process
	begin
		wait until reset_n = '1';
		
		CS <= '0';

		wait for bitperiod;
		
		CS <= '1';
		writeAddr <= 0;
		writeData <= "00000000000000000000000000000011";
		
		wait for bitperiod;
		
		assert(CS = '1')
		report "ram_cs_module0 not set" severity error;
		
		assert(writeAddr = 0)
		report "writeAddr not assigned correct value (0)" severity error;
		
		writeAddr <= 1;
		writeData <= "00000000000000000000000000000001";
		
		wait for bitperiod;
		
		readAddr <= 0;
		
		wait for bitperiod;
		
		assert(readData = "00000000000000000000000000000011")
		report "Does not read correct value of ram_block(0)" severity error;
		
		readAddr <= 1;
		
		wait for bitperiod;
		
		assert(readData = "00000000000000000000000000000001")
		report "Does not read correct value of ram_block(1)" severity error;
		
		wait;
	end process;
end;


configuration RamAccess_tb_cfg of ramAccess_tb is
	for bench
	end for;
end RamAccess_tb_cfg;