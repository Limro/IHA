library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PlaySoundAndRam_tb is
end;

architecture bench of PlaySoundAndRam_tb is

	component PlaySound
		generic(
			dataSize 	: natural := 32; -- bits der overføres
			ramSize		: natural := 2048 -- ram-modul i bytes
			);
			
		port (
			clk 					: in std_logic; -- domain clock
			reset					: in std_logic;
			
			-- Transfer Protokol interface
			ram_to_play				: in std_logic; 
			ramSamples_to_read		: in std_logic_vector(7 downto 0);
			
			-- Ram interface
			addr					: out integer range 0 to ramSize-1;
			data					: in std_logic_vector(dataSize-1 downto 0);
			ram_CS					: out std_logic_vector(1 downto 0);
				
			-- ST Bus --
			ast_clk 				: in  std_logic;   -- 12MHz
			ast_sink_data    		: in  std_logic_vector(23 downto 0);
			ast_sink_ready   		: out std_logic;  -- Value at startup
			ast_sink_valid   		: in  std_logic;
			ast_sink_error   		: in  std_logic_vector(1 downto 0);
			ast_source_data  		: out std_logic_vector(23 downto 0);
			ast_source_ready 		: in  std_logic;
			ast_source_valid 		: out std_logic;
			ast_source_error 		: out std_logic_vector(1 downto 0)
		);
	end component;
	
	component ramAccess
		generic(
			dataSize 	: natural := 32; -- bits der overføres
			ramSize		: natural := 2048 -- ram-modul i bytes
			);
		
		port(
			-- Inputs
			clk			: in std_logic; -- The clock
			reset 		: in std_logic;
			CS			: in std_logic; -- Chip selected or not
			writeAddr	: in integer range 0 to ramSize-1; -- Address to write to
			readAddr	: in integer range 0 to ramSize-1; -- Address to read from
			writedata	: in std_logic_vector(dataSize-1 downto 0); -- Data to write into ram
			
			-- Outputs
			readData	: out std_logic_vector(dataSize-1 downto 0)	-- Data to read from ram
			);
	end component;

	constant dataSize 	: natural 								:= 32;
	constant ramSize 	: natural 								:= 2048;
	
	signal clk			: std_logic								:= '0'; -- The clock
	signal reset		: std_logic;
	signal CS0, CS1		: std_logic								:= '0'; -- Chip selected or not
	signal writeAddr	: integer range 0 to ramSize-1			:= 0; -- Address to write to
	signal readAddr		: integer range 0 to ramSize-1			:= 0; -- Address to read from
	signal writedata	: std_logic_vector(dataSize-1 downto 0)	:= (others => '0'); -- Data to write into ram
	signal readData		: std_logic_vector(dataSize-1 downto 0)	:= (others => '0'); -- Data to read from ram
	
	-- Transfer Protokol interface
	signal ram_to_play			: std_logic; 
	signal ramSamples_to_read	: std_logic_vector(7 downto 0);
	
	-- Ram interface
	signal addr					: integer range 0 to ramSize-1;
	signal data, data1, data2	: std_logic_vector(dataSize-1 downto 0);
	signal ram_CS				: std_logic_vector(1 downto 0);
		
	-- ST Bus --
	signal ast_clk 				: std_logic := '0';   -- 12MHz
	signal ast_sink_data    	: std_logic_vector(23 downto 0);
	signal ast_sink_ready   	: std_logic                     := '0';  -- Value at startup
	signal ast_sink_valid   	: std_logic;
	signal ast_sink_error   	: std_logic_vector(1 downto 0);
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
			reset 				=> reset,
			ram_to_play 		=> ram_to_play,
			ramSamples_to_read 	=> ramSamples_to_read,
			addr 				=> addr,
			data 				=> data,
			ram_CS 				=> ram_CS,
			ast_clk 			=> ast_clk,
			ast_sink_data 		=> ast_sink_data,
			ast_sink_ready 		=> ast_sink_ready,
			ast_sink_valid 		=> ast_sink_valid,
			ast_sink_error 		=> ast_sink_error,
			ast_source_data 	=> ast_source_data,
			ast_source_ready 	=> ast_source_ready,
			ast_source_valid 	=> ast_source_valid,
			ast_source_error 	=> ast_source_error);
			
	ramAccess_init1 : ramAccess
		generic map (
			dataSize 	=> dataSize,
			ramSize 	=> ramSize )
		port map (
			clk 		=> clk,
			reset 		=> reset,
			CS 			=> CS0,
			writeAddr 	=> writeAddr,
			readAddr 	=> addr,
			writedata 	=> writedata,
			readData 	=> data1 );			
	
	ramAccess_init2 : ramAccess
		generic map (
			dataSize 	=> dataSize,
			ramSize 	=> ramSize )
		port map (
			clk 		=> clk,
			reset 		=> reset,
			CS			=> CS1,
			writeAddr 	=> writeAddr,
			readAddr 	=> addr,
			writedata 	=> writedata,
			readData 	=> data2 );	
			
	clk <= not clk after bitperiod/2;
	ast_clk <= not ast_clk after ast_bitperiod/2;
	
	reset <= '1', '0' after 50 ns;
	
	data <= data1 when ram_CS = "01" else
			data2 when ram_CS = "10" else
			(others => '0');
	
	stimulus : process
	begin
		
		wait until reset = '0';
		
		wait for bitperiod;
		ast_source_ready <= '0';				--Not ready to read
		ramSamples_to_read <= "00000100";		--Set data to read = 2
		
		wait for bitperiod;
		CS0 <= '1';
		CS1 <= '0';
		writeAddr <= 0;
		writeData <= "00000000000000000000000000000100";
		
		wait for bitperiod;
		writeAddr <= 1;
		writeData <= "00000000000000000000000000000101";
		
		wait for bitperiod;
		writeAddr <= 2;
		writeData <= "00000000000000000000000000000110";
		
		wait for bitperiod;
		writeAddr <= 3;
		writeData <= "00000000000000000000000000000111";
		
		wait for bitperiod;
		
		CS0 <= '0';
		CS1 <= '1';
		writeAddr <= 0;
		writeData <= "00000000000000000000000000000011";
		
		wait for bitperiod;
		writeAddr <= 1;
		writeData <= "00000000000000000000000000001100";
		
		wait for bitperiod;
		writeAddr <= 2;
		writeData <= "00000000000000000000000000001101";
		
		wait for bitperiod;
		writeAddr <= 3;
		writeData <= "00000000000000000000000000001110";
		
		wait for bitperiod;
		writeAddr <= 1;
		writeData <= "00000000000000000000000000001111";
		
		wait for bitperiod;
		--CS0 <= '1';
		--CS1 <= '0';
		ram_to_play <= '1';	
		
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait for bitperiod;
		ram_to_play <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '1';				--Ready to play
		
		wait until falling_edge(ast_clk);
		ast_source_ready <= '0';
		
		wait;
	end process;
end;

configuration PlaysoundAndRam_tb_cfg of PlaySoundAndRam_tb is
	for bench
	end for;
end PlaysoundAndRam_tb_cfg;