library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mm_bus_seven_seg_four_digit is
  
  port (
    -- Avalon Interface
    csi_clockreset_clk     : in  std_logic;                     -- Avalon Clk
    csi_clockreset_reset_n : in  std_logic;                     -- Avalon Reset
    avs_s1_write           : in  std_logic;                     -- Avalon wr
    avs_s1_read            : in  std_logic;                     -- Avalon rd
    avs_s1_chipselect      : in  std_logic;                     -- Avalon cs
    avs_s1_address         : in  std_logic_vector(7 downto 0);  -- Avalon address
    avs_s1_writedata       : in  std_logic_vector(15 downto 0);  -- Avalon wr data
    avs_s1_readdata        : out std_logic_vector(15 downto 0);  -- Avalon rd data

    -- 7-Segment Displays
    hex0 : out std_logic_vector(6 downto 0);
    hex1 : out std_logic_vector(6 downto 0);
    hex2 : out std_logic_vector(6 downto 0);
    hex3 : out std_logic_vector(6 downto 0));
end mm_bus_seven_seg_four_digit;

architecture behaviour of mm_bus_seven_seg_four_digit is

	-- Signal Declaration
	signal inputValue : std_logic_vector(15 downto 0);
	  
	begin
	
	bcdProc: process (csi_clockreset_clk, avs_s1_read)
		variable wrData : std_logic_vector(avs_s1_writedata'high downto 0);
	begin
		if cs_clockreset_rest_n = '0' then
			bcd <= (others => '0');
			avs_s1_readdata <= (others => 'Z');
		if rising_edge(csi_clockreset_clk) then
			avs_s1_readdata <= (others => 'Z');
			if avs_s1_chipselect <= '1' then
			
				if avs_s1_read <= '1' then
					inputValue <= avs_s1_writedata;
					
				else if avs_s1_write <= '1' then
					wrData <= avs_s1_readdata; --Not done
					
				end if;
			end if;
		end if;
		
	end process bcdProc;
			
	-- Sub-component Instantiation
		h1: entity work.bcd2sevenseg port map( bcd => inputValue(3 downto 0), hex => hex0 );
		h2: entity work.bcd2sevenseg port map( bcd => inputValue(7 downto 4), hex => hex1 );
		h3: entity work.bcd2sevenseg port map( bcd => inputValue(11 downto 8), hex => hex2 );
		h4: entity work.bcd2sevenseg port map( bcd => inputValue(15 downto 12), hex => hex3 );

	-- Functionality
	

end behaviour;
