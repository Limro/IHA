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
	signal cs1, cs2		: std_logic;		-- double register
	signal data1 		: std_logic_vector ( dataSize-1 downto 0);
	signal read_count 	: signed (ramSize-1 downto 0);
	
begin
	--Convertering til MM-domain
	step1: process(ast_clk)
	begin
		if rising_edge(ast_clk) then
			cs1 <= ram_to_play;
			cs2 <= cs1;
		end if;
	end process step1;

	--Ram chip select
	chipSelect: process(ast_clk)
	begin
		if rising_edge(ast_clk) then
			if cs2 = '0' then
				ram_CS <= "01";
			else
				ram_CS <= "10";
			end if;
		end if;
	end process chipSelect;
	
	--Ram data reading
	ramRead: process(ast_clk)
	begin
		--ram_CS <= "00"; 						-- default nothing selected
		if rising_edge(clk) then
			if ast_source_ready = '1' then
				if signed(ramSamples_to_read) = read_count then
					read_count <= (others => '0');
				else 
					addr <= to_integer(read_count);	-- Write addr to ram
					ast_source_valid <= '1';
					data1 <= data;				-- Read data from ram
					ast_source_data <= data1(23 downto 0);
				end if;
			end if;
		end if;
	end process ramRead;
	
	--Play data reading
	
end behavioural;