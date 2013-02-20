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

	variable counter : signed;

begin
	counter <= 0;
	gettingPressed: process (input_irq, input_counter)
	begin
		if rising_edge(input_counter) then
			counter <= counter + 1;
		end if;
		if rising_edge(input_irq) then
			counter <= 0;
		end if;
	end process gettingPressed;

-- Functionality 
  
  
end behaviour;
