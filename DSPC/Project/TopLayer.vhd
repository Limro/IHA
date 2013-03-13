library ieee;
use ieee.std_logic_1164.all;

entity topLayer is
	generic(
		dataSize 	: natural := 32; 	-- bits der overføres
		ramSize		: natural := 2048 	-- ram-modul i bytes
		);

	
entity Syntezise is
	port(
		    -- Avalon Interface
    csi_clockreset_clk     	: in  std_logic;                     -- Avalon Clk
    csi_clockreset_reset_n 	: in  std_logic;                     -- Avalon Reset
    avs_s1_write           	: in  std_logic;                     -- Avalon wr
    avs_s1_read            	: in  std_logic;                     -- Avalon rd
    avs_s1_chipselect      	: in  std_logic;                     -- Avalon cs
    avs_s1_address         	: in  std_logic_vector(7 downto 0);  -- Avalon address
    avs_s1_writedata       	: in  std_logic_vector(15 downto 0); -- Avalon wr data
    avs_s1_readdata			: out std_logic_vector(15 downto 0); -- Avalon rd data
	
	-- ST Bus --
    ast_clk 				: in  std_logic;   -- 12MHz
    ast_sink_data    		: in  std_logic_vector(23 downto 0);
    ast_sink_ready   		: out std_logic                     := '0';  -- Value at startup
    ast_sink_valid   		: in  std_logic;
    ast_sink_error   		: in  std_logic_vector(1 downto 0);
    ast_source_data  		: out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready 		: in  std_logic;
    ast_source_valid 		: out std_logic                     := '0';
    ast_source_error 		: out std_logic_vector(1 downto 0)  := (others => '0');
	);
end Syntezise

architecture mixStyle of Syntezise is
	signal TP_Addr, TP_Data, PS_Addr, PS_Data 	: std_logic_vector(dataSize-1 downto 0);
	signal TP_cs0, TP_cs1, PS_cs0, PS_cs1 TP_ps	: std_logic;
	signal tmp 									: std_logic_vector(1 downto 0); --Ram selection for PlaySound

begin
	TP: entity work.TransferProtocol port map(
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
			ram_to_play 	=>	TP_ps
			);

	PS_Data <= r1 when tmp = "01"
			<= r2 when tmp = "10";
	
	R0: entity work.ramAcces port map( 	
			clk 			=> csi_clockreset_clk,
			CS 				=> TP_cs0,
			writeAddr 		=> TP_Addr,
			writedata		=> TP_Data,
			readAddr 		=> PS_Addr,
			readData 		=> PS_Data );

	R1: entity work.ramAcces port map( 	
			clk 			=> csi_clockreset_clk,
			CS		 		=> TP_cs1,
			writeAddr 		=> TP_Addr,
			writedata		=> TP_Data,
			readAddr 		=> PS_Addr,
			readData 		=> PS_Data );
	
	PS: entity work.PlaySound port map(
			clk 			=> ast_clk,
			data 			=> PS_Data,
			ram_CS			=> tmp,
			... --More is missing
			);
	
	
end mixStyle;










