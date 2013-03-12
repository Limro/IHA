library ieee;
use ieee.std_logic_1164.all;

entity fullAdder is
	port(fa_a, fa_b, fa_cin : in std_logic;
		fa_sum, fa_cout : out std_logic);
	end fullAdder;
	
architecture mixStyle of fullAdder is
	signal ha1_sum, ha1_cout, ha2_cout : std_logic;
	
	begin
		ha1: entity work.halfAdder port map( ha_a => fa_a, 
											ha_b => fa_b, 
											ha_sum => ha1_sum, 
											ha_carry => ha1_cout);
		
		ha2: entity work.halfAdder port map( ha_a => ha1_sum, 
											ha_b => fa_cin, 
											ha_sum => fa_sum, 
											ha_carry => ha2_cout);
		fa_cout <= ha1_cout or ha2_cout;
end mixStyle;

entity topLayer is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		ramSize		: natural := 2048 -- ram-modul i bytes
		);
		
	port(
		clk 		: in std_logic;
		
		-- Transfer Protocol specific
		
		-- Ram specific
		
		-- Playsound specific (ST-BUS)
		);
	end topLayer;
	
architecture mixStyle of topLayer is
	signal TP_Addr, TP_Data, PS_Addr, PS_Data : std_logic_vector(dataSize-1 downto 0);
	signal TP_cs0, TP_cs1, PS_cs0, PS_cs1 : std_logic;

begin
	
	TP: entity work.ramAcces port map( 
				csi_clockreset_clk 		=> clk,
				csi_clockreset_reset_n 	=> ...
				avs_s1_write           	=> ...
				avs_s1_read            	=> ...
				avs_s1_chipselect      	=> ...
				avs_s1_address         	=> ...
				avs_s1_writedata       	=> ...
				--avs_s1_readdata       => ...
				
				-- Ram interface
				ram_Addr				=> TP_Addr,
				ram_Data				=> TP_Data,
				ram_cs_module0			=> TP_cs0,
				ram_cs_module1			=> TP_cs1,
				ram_InUse				=> ...
				);
	
	R0: entity work.ramAcces port map( 	
				clk => clk,
				chipSelect => TP_cs0,
				writeAddr => TP_Addr,
				readAddr => TP_Data,
				readData => ...);

	R1: entity work.ramAcces port map( 	
				clk => clk,
				chipSelect => TP_cs1,
				writeAddr => TP_Addr,
				readAddr => TP_Data,
				readData => ...);
	
	
end mixStyle;










