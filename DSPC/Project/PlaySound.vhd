library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity PlaySound is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		ramSize		: natural := 2048 -- ram-modul i bytes
		);
		
	port map(
		clk 					: in std_logic; -- domain clock
		
		-- Transfer Protokol interface
		ram_to_play				: in std_logic; 
		ram_to_read				: in signed;
		
		-- Ram interface
		addr					: out integer range 0 to ramSize-1;
		data					: in std_logic_vector(dataSize downto 0);
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
		ast_source_error 		: out std_logic_vector(1 downto 0)  := (others => '0');
		);
end PlaySound;

architecture behavioural of PlaySound is
	signal tmp : std_logic_vector(1 downto 0);
	signal read_count : signed;
	
begin
	--Convertering til MM-domain 1
	step1: process(ast_clk)
	begin
		if rising_edge(ast_clk) = '1' then
			tmp(0) <= ram_tp_play;
		end if;
	end process step1;
	
	--Convertering til MM-domain 1
	step1: process(ast_clk)
	begin
		if rising_edge(ast_clk) = '1' then
			tmp(1) <= tmp(0);
		end if;
	end process step1;
	
	--Ram chip select
	if tmp(1) = '0' then
		ram_CS <= "01";
	else
		ram_CS <= "10";
	end if;
	
	--Ram data reading
	ramRead: process(clk)		-- !! Must read in ST-clock doamin
	begin
		if rising_edge(clk) then
			if ast_source_ready = '1' then
				if read_count = ram_to_read then 	-- Done
					read_count := 0;				-- Reset
				else 
					addr <= X"0" + read_count;		-- Write addr to ram
					ast_source_valid <= '1';
					ast_source_data <= data;		-- Read data from ram - need a clock cycle?
				end if;
			end if;
		end if;
	end process ramRead;
	
end behavioural;