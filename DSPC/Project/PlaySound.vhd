library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PlaySound is
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
		ram_CS					: out std_logic_vector(1 downto 0) := "00";
			
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
end PlaySound;

architecture behavioural of PlaySound is
	
	signal read_count 	: signed (10 downto 0);
	signal data1		: std_logic_vector ( dataSize-1 downto 0);
begin	
	--Ram chip select
	chipSelect: process(clk)
		variable cs1, cs2		: std_logic;		-- double register
	begin
		
		if rising_edge(clk) then
			cs1 := ram_to_play;
			cs2 := cs1;
			
			if cs2 = '0' then
				ram_CS <= "01";
			elsif cs2 = '1' then
				ram_CS <= "10";
			else
				ram_CS <= "11"; 		-- default nothing selected
			end if;
		end if;
	end process chipSelect;
	
	--Ram data reading
	ramRead: process(ast_clk, reset)
	begin
		if reset = '1' then
			read_count <= (others => '0');
			
		elsif rising_edge(ast_clk) then
		
			if ast_source_ready = '1' and (ram_to_play = '1' or ram_to_play = '0') then
				read_count <= read_count + 1;
				
				addr <= to_integer(read_count);	-- Write addr to ram
				data1 <= data;				-- Read data from ram
				ast_source_data <= data1(23 downto 0);
				ast_source_valid <= '1';

				
				if read_count >= signed(ramSamples_to_read)-1 then
					read_count <= (others => '0');
				end if;
			else
				ast_source_valid <= '0';
			end if;
		end if;
	end process ramRead;
	
end behavioural;