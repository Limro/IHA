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
   signal bcd0: std_logic_vector(3 downto 0);
   signal bcd1: std_logic_vector(3 downto 0);
   signal bcd2: std_logic_vector(3 downto 0);
   signal bcd3: std_logic_vector(3 downto 0);
  
begin


-- Sub-component Instantiation
  seg0: entity work.bcd2sevenseg port map(bcd => bcd0, hex => hex0);
  seg1: entity work.bcd2sevenseg port map(bcd => bcd1, hex => hex1);
  seg2: entity work.bcd2sevenseg port map(bcd => bcd2, hex => hex2);
  seg3: entity work.bcd2sevenseg port map(bcd => bcd3, hex => hex3);


-- Functionality
  process(csi_clockreset_clk, csi_clockreset_reset_n)
  begin
    if (csi_clockreset_reset_n = '0') then
    
       bcd0 <= (others => '0');
       bcd1 <= (others => '0');
       bcd2 <= (others => '0');
       bcd3 <= (others => '0');
       
    elsif rising_edge(csi_clockreset_clk) then
      
      if avs_s1_chipselect = '1' then
        if avs_s1_write = '1' then
          if avs_s1_address = "00000001" then
             bcd0 <= avs_s1_writedata(3 downto 0);
             bcd1 <= avs_s1_writedata(7 downto 4);
             bcd2 <= avs_s1_writedata(11 downto 8);
             bcd3 <= avs_s1_writedata(15 downto 12);            
          end if;
        end if;
      end if;
      
    end if;
  
  end process;
  
end behaviour;
