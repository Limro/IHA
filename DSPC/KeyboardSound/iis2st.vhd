library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st is
  port (
    -- Common --
    clk              : in  std_logic;   -- 12MHz
    reset_n          : in  std_logic;
    -- ST Bus --
    --ast_clk          : in  std_logic;   -- 48Khz
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic                     := '0';  -- Value at startup
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    -- IIS Interface --
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic                     := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic
    );
end entity iis2st;

-------------------------------------------------------------------------------
-- RTL version of iis2st 
-- For actual implementation
-------------------------------------------------------------------------------
architecture rtl of iis2st is

  -- Build an enumerated type for the state machine
  type state_type is (idle, wait_one_bit, bitclk_high, bitclk_low, sample_bit, latch_word, wait_for_daclrck_high );

  -- Register to hold the current state
  signal i2s_state : state_type;
  signal s2i_state : state_type;
  signal data_latched : std_logic_vector(23 downto 0) := (others => '0');
  signal dac_data : std_logic_vector(23 downto 0) := (others => '0');
  signal daclrck_last : std_logic; -- last sampled value of daclrck

begin
  -- purpose: Converts ST to IIS format
  -- type   : sequential
  -- inputs : clk, reset_n
  -- outputs: dacdat
  ST2IIS_proc : process (clk, reset_n)
    variable bit_count : integer range 0 to 23;
  begin  -- process IIS2ST_proc
    if reset_n = '0' then               -- asynchronous reset (active low)
      s2i_state <= idle;
      dacdat <= '0';
      bit_count := 0;
    elsif clk'event and clk = '0' then  -- rising clock edge
      case s2i_state is
        when idle=>
				  if adclrck = '0' then -- 48Khz sample clock 1 -> 0
            s2i_state <= sample_bit;
            dacdat <= dac_data(23);
          end if;
        when wait_one_bit=>
          if bitclk = '1' then
            s2i_state <= bitclk_high;
          end if;
        when bitclk_high=>
          if bitclk = '0' then
            s2i_state <= sample_bit;
          end if;
        when sample_bit =>
          dacdat <= dac_data(22 - bit_count);
          if bit_count < 22 then
            bit_count := bit_count + 1;
          else
            s2i_state <= wait_for_daclrck_high;
            bit_count := 0;
          end if;
        when bitclk_low =>
          if bitclk = '1' then
            s2i_state <= bitclk_high;
          end if;
        when wait_for_daclrck_high =>
          dacdat <= '0';
          if daclrck = '1' then
            s2i_state <= idle;
          end if;
        when others =>
          s2i_state <= idle;
      end case;
    end if;
  end process ST2IIS_proc;
  
  -- Handles syncronisation of data from ST bus to I2S
	ST_sink : process (clk, reset_n)
  begin
    if reset_n = '0' then               -- asynchronous reset (active low)
      ast_sink_ready <= '0';
      dac_data  <= (others => '0');
			daclrck_last <= '0';
    elsif falling_edge(clk) then  -- faling clock edge
			if daclrck = '1' and daclrck_last = '0' then -- New sample from left channel 0 -> 1
				ast_sink_ready <= '1';
			end if;
      if ast_sink_valid = '1' then
        dac_data  <= ast_sink_data;
				ast_sink_ready <= '0';
      end if;
			daclrck_last <= daclrck;
    end if;
  end process ST_sink;
  
end architecture;

