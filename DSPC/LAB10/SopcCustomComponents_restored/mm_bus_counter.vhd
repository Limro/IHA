library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mm_bus_counter is
  
  port (
    -- Avalon Interface
    csi_clockreset_clk     : in  std_logic;                     -- Avalon Clk
    csi_clockreset_reset_n : in  std_logic;                     -- Avalon Reset
    avs_s1_write           : in  std_logic;                     -- Avalon wr
    avs_s1_read            : in  std_logic;                     -- Avalon rd
    avs_s1_chipselect      : in  std_logic;                     -- Avalon cs
    avs_s1_address         : in  std_logic_vector(7 downto 0);  -- Avalon address
    avs_s1_writedata       : in  std_logic_vector(15 downto 0); -- Avalon wr data
    avs_s1_readdata        : out std_logic_vector(15 downto 0); -- Avalon rd data
    ins_irq0_irq           : out std_logic;                     -- Avalon irq

  -- External Inputs
  input_irq     : in std_logic;
  input_counter : in std_logic);

end mm_bus_counter;

architecture behaviour of mm_bus_counter is

-- Signal Declarations
  signal counter: std_logic_vector(15 downto 0);
  signal reset_counter: std_logic := '0'; 

begin

-- Functionality 
  
  process(csi_clockreset_clk, csi_clockreset_reset_n)
  begin
    if (csi_clockreset_reset_n = '0') then
      reset_counter <= '0';       
              
    elsif rising_edge(csi_clockreset_clk) then
      reset_counter <= '1';    
      if avs_s1_chipselect = '1' then
        if avs_s1_write = '1' then
          if avs_s1_address = "00000001" then
             reset_counter <= '0';
          end if;
        end if;
        if avs_s1_read = '1' then
          if avs_s1_address = "00000000" then
             avs_s1_readdata <= counter;
          end if;
        end if;
      end if; 
    end if;  
 end process;
  
 process(input_counter, reset_counter)
  begin
    if (reset_counter = '0') then
      counter <= (others => '0');
    elsif rising_edge(input_counter) then
      counter <= std_logic_vector(unsigned(counter) + 1);
    end if;  
 end process;
  
end behaviour;
