library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fir is
	generic (
		inputWidth 	: natural := 24;
		filterOrder	: natural := 10;
		coefWidth 	: natural := 8);  
	port (
		-- Common --
		clk              : in  std_logic;   -- 48KHz
		reset_n          : in  std_logic;
		-- ST Bus --
		ast_sink_data    : in  std_logic_vector(inputWidth-1 downto 0);
		ast_sink_ready   : out std_logic;
		ast_sink_valid   : in  std_logic;
		ast_sink_error   : in  std_logic_vector(1 downto 0);
		ast_source_data  : out std_logic_vector(inputWidth-1 downto 0);
		ast_source_ready : in  std_logic;
		ast_source_valid : out std_logic;
		ast_source_error : out std_logic_vector(1 downto 0)
		-- Filter --
		
		);
end entity fir;

architecture fir_imp of fir is
	subtype coeff_type is integer range -128 to 127;
	type coeff_array_type is array (0 to filterOrder/2) of coeff_type;

	subtype tap_type is signed(inputWidth-1 downto 0);
	type tap_array_type is array (0 to filterOrder) of tap_type;

	subtype prod_type is signed(inputWidth+coefWidth-1 downto 0);
	type prod_array_type is array (0 to filterOrder/2) of prod_type;

	constant coeff : coeff_array_type := (-1, -3, 0, 27, 11, 19);
	signal tap     : tap_array_type;
	signal prod    : prod_array_type;
	
	--State types
	type state_type is (
		idle, 
		wait_one_bit, 
		bitclk_high, 
		bitclk_low, 
		sample_bit, 
		latch_word, 
		sampleclk_low);
	
	begin

		
		filter_proc : process(clk, reset_n)
			variable bitcount          : integer range 0 to 23;
			variable temp 					: tap_type;
			variable sink_data_temp 	: std_logic_vector(23 downto 0) := (others => '0');
			variable source_data_temp 	: std_logic_vector(7 downto 0) := (others => '0');
			variable result 				: prod_type;
		begin
			if reset_n = '0' then               -- asynchronous reset (active low)
				ast_sink_ready <= '0';
			elsif falling_edge(clk) then
			
				if ast_sink_valid = '1' then
					sink_data_temp := ast_sink_data;
					
					for tap_no in filterOrder-1 downto 1 loop
						tap(tap_no) <= tap(tap_no-1);
					end loop;
					tap(0) <= signed(sink_data_temp);
					
					for tap_no in (filterOrder/2)-1 downto 0 loop
						temp := resize(tap(tap_no), inputWidth) + resize(tap(filterOrder - tap_no), inputWidth);
						prod(filterOrder/2) <= to_signed(coeff(tap_no), coefWidth) * temp;
					end loop;
					prod(filterOrder/2) <= to_signed(coeff(filterOrder/2), coefWidth) * tap(filterOrder/2);
					
					result := (others => '0');
					for tap_no in (filterOrder/2) downto 0 loop
						result := result + prod(tap_no);
					end loop;
					
					source_data_temp := shift_right(result, 8);
					ast_source_data <= std_logic_vector(source_data_temp(inputWidth-1 downto 0));
									
					
					-- for alle tager vi "første" og "sidste" og ganger
					-- ganger det produkt med coeff
					
					-- ???
					
				end if;
			end if;
					
			
		end process filter_proc;
		
end fir_imp;