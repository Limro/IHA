library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

	
entity Syntezise is
	generic(
		dataSize 	: natural := 32; 	-- bits der overfï¿½res
		ramSize		: natural := 2048 	-- ram-modul i bytes
		);

	port(
		    -- Avalon Interface
    csi_clockreset_clk     	: in  std_logic;                     -- Avalon Clk
    csi_clockreset_reset_n 	: in  std_logic;                     -- Avalon Reset
    avs_s1_write           	: in  std_logic;                     -- Avalon wr
    avs_s1_read            	: in  std_logic;                     -- Avalon rd
    avs_s1_chipselect      	: in  std_logic;                     -- Avalon cs
    avs_s1_address         	: in  std_logic_vector(7 downto 0);  -- Avalon address
    avs_s1_writedata       	: in  std_logic_vector(dataSize-1 downto 0); -- Avalon wr data
    avs_s1_readdata			: out std_logic_vector(dataSize-1 downto 0); -- Avalon rd data
	
	-- ST Bus --
    ast_clk 				: in  std_logic;   -- 12MHz
    ast_sink_data    		: in  std_logic_vector(23 downto 0);
    ast_sink_ready   		: out std_logic                     := '0';  -- Value at startup
    ast_sink_valid   		: in  std_logic;
    ast_sink_error   		: in  std_logic_vector(1 downto 0);
    ast_source_data  		: out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready 		: in  std_logic;
    ast_source_valid 		: out std_logic                     := '0';
    ast_source_error 		: out std_logic_vector(1 downto 0)  := (others => '0')
	);
end Syntezise;

architecture mixStyle of Syntezise is
	signal TP_Addr,  PS_Addr						: integer range 0 to ramSize-1;
	signal TP_cs0, TP_cs1, PS_cs0, PS_cs1, TP_ps	: std_logic;
	signal tmp 										: std_logic_vector(1 downto 0); --Ram selection for PlaySound
	signal TP_samplesToRead 						: std_logic_vector(7 downto 0); --Ram samples to read
	signal TP_Data, PS_Data, r0, r1 				: std_logic_vector(dataSize-1 downto 0);

begin
	TP: entity work.TransferProtocol 
	port map(
			--Avalon Slave interface
			clk				=> csi_clockreset_clk,
			reset 			=> csi_clockreset_reset_n,
			WE           	=> avs_s1_write,
			RE            	=> avs_s1_read,
			CS      		=> avs_s1_chipselect,
			address         => avs_s1_address,
			writedata       => avs_s1_writedata,
			readdata       	=> avs_s1_readdata,

			-- Ram interface
			ram_Addr		=> TP_Addr,
			ram_Data		=> TP_Data,
			ram_cs_module0	=> TP_cs0,
			ram_cs_module1	=> TP_cs1,
			
			-- PlaySound interface
			ram_to_play 	=>	TP_ps,
			ramSamples_to_read => TP_samplesToRead
		);

	
	PS_Data <= 	r0 when tmp = "01" else
				r1 when tmp = "10" else
				(others => '0');
	
	Ram0: entity work.ramAccess
	port map( 	
			clk 			=> csi_clockreset_clk,
			CS 				=> TP_cs0,
			writeAddr 		=> TP_Addr,
			writedata		=> TP_Data,
			readAddr 		=> PS_Addr,
			readData 		=> r0 );

	Ram1: entity work.ramAccess
	port map( 	
			clk 			=> csi_clockreset_clk,
			CS		 		=> TP_cs1,
			writeAddr 		=> TP_Addr,
			writedata		=> TP_Data,
			readAddr 		=> PS_Addr,
			readData 		=> r1 );
	
	PS: entity work.PlaySound 
	port map(
			clk 				=> ast_clk,
			ram_to_play			=> TP_ps,
			ramSamples_to_read 	=> TP_samplesToRead,
			addr				=> PS_Addr,
			data 				=> PS_Data,
			ram_CS				=> tmp,
			ast_clk 			=> ast_clk,
			ast_sink_data    	=> ast_sink_data,
			ast_sink_ready   	=> ast_sink_ready,
			ast_sink_valid   	=> ast_sink_valid,
			ast_sink_error   	=> ast_sink_error,
			ast_source_data  	=> ast_source_data,
			ast_source_ready 	=> ast_source_ready,
			ast_source_valid 	=> ast_source_valid,
			ast_source_error	=> ast_source_error	 
			);
	
	
end mixStyle;










