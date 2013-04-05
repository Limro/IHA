library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PlaySound_tb is
end;

architecture bench of PlaySound_tb is

	component PlaySound
		generic(
			dataSize 	: natural := 32; -- bits der overføres
			ramSize		: natural := 2048 -- ram-modul i bytes
			);
			
		port (
			clk 					: in std_logic; -- domain clock
			reset_n					: in std_logic;
			
			-- Transfer Protokol interface
			ram_to_play				: in std_logic; 
			ramSamples_to_read		: in std_logic_vector(7 downto 0);
			
			-- Ram interface
			addr					: out integer range 0 to ramSize-1;
			data					: in std_logic_vector(dataSize-1 downto 0);
			ram_CS					: out std_logic_vector(1 downto 0);
				
			-- ST Bus --
			ast_clk 				: in  std_logic;   -- 12MHz
			ast_source_data  		: out std_logic_vector(23 downto 0);
			ast_source_ready 		: in  std_logic;
			ast_source_valid 		: out std_logic;
			ast_source_error 		: out std_logic_vector(1 downto 0)
		);
	end component;
	
	constant dataSize 			: natural 						:= 32;
	constant ramSize 			: natural 						:= 2048;
	
	signal clk					: std_logic								:= '0'; -- The clock
	signal reset_n				: std_logic;
	
	-- Transfer Protokol interface
	signal ram_to_play			: std_logic; 
	signal ramSamples_to_read	: std_logic_vector(7 downto 0);
	
	-- Ram interface
	signal addr					: integer range 0 to ramSize-1;
	signal data					: std_logic_vector(dataSize-1 downto 0);
	signal ram_CS				: std_logic_vector(1 downto 0);
		
	-- ST Bus --
	signal ast_clk 				: std_logic := '0';   -- 12MHz
	signal ast_source_data  	: std_logic_vector(23 downto 0) ;--:= (others => '0');
	signal ast_source_ready 	: std_logic;
	signal ast_source_valid 	: std_logic                     := '0';
	signal ast_source_error 	: std_logic_vector(1 downto 0)  := (others => '0');
	
	-- clock
	constant bitperiod   	 	: time 		:= 10 ns; -- clk period time
	constant ast_bitperiod		: time		:= 83 ns; --(12MHz) -- 20833 ns; -- clk period time for ast (1/48.000 Hz * 1.000.000.000 ns/sec)
	
begin
	PlaySound_init : PlaySound
		generic map(
			dataSize 			=> dataSize,
			ramSize 			=> ramSize )
		port map (
			clk 				=> clk,
			reset_n 			=> reset_n,
			ram_to_play 		=> ram_to_play,
			ramSamples_to_read 	=> ramSamples_to_read,
			addr 				=> addr,
			data 				=> data,
			ram_CS 				=> ram_CS,
			ast_clk 			=> ast_clk,
			ast_source_data 	=> ast_source_data,
			ast_source_ready 	=> ast_source_ready,
			ast_source_valid 	=> ast_source_valid,
			ast_source_error 	=> ast_source_error);
			
	clk <= not clk after bitperiod/2;
	ast_clk <= not ast_clk after ast_bitperiod/2;
	
	reset_n <= '0', '1' after 50 ns;
		
	stimulus : process
	begin
		ram_to_play <= '0';	
		ramSamples_to_read <= (others => '0'); 	--Reset data counter
		data <= (others => '0');				--Reset data
		ast_source_ready <= '0';				--Not ready to read
		
		wait until reset_n = '0';		
		ramSamples_to_read <= "00000010";		--Set data to read = 2
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait for bitperiod;
		data <= "00000000000000000000000000000001";
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait for ast_bitperiod * 3;
		ast_source_ready <= '1';
		
		wait until rising_edge(ast_clk);
		data <= "00000000000000000000000000000011";
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
				
		wait;
	end process;
end;

configuration PlaySound_tb_cfg of PlaySound_tb is
	for bench
	end for;
end PlaySound_tb_cfg;