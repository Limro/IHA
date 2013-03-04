library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st is
  port (
    -- Common --
    clk              : in  std_logic;   -- 50MHz
    reset_n          : in  std_logic;
    -- ST Bus --
    ast_clk          : in  std_logic;   -- 12MHz
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic                     := '0';  -- Value at startup
    ast_sink_valid   : in  std_logic;
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    ast_source_data  : out std_logic_vector(23 downto 0) := (others => '0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic                     := '0';
    ast_source_error : out std_logic_vector(1 downto 0)  := (others => '0');
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


begin

  -- purpose: Converts IIS to ST format
  -- type   : sequential
  -- inputs : clk, reset_n
  -- outputs: 
  IIS2ST_proc : process (clk, reset_n)
    variable bit_count : integer range 0 to 23;
    variable data      : std_logic_vector(23 downto 0) := (others => '0');
  begin  -- process IIS2ST_proc
    if reset_n = '0' then               -- asynchronous reset (active low)
    elsif clk'event and clk = '1' then  -- rising clock edge
      case i2s_state is
        when idle=>
          if adclrck = '0' then
--            i2s_state <= wait_one_bit;
            i2s_state <= sample_bit;
          end if;
        when wait_one_bit=>
          if bitclk = '1' then
            i2s_state <= bitclk_high;
          end if;
        when bitclk_high=>
          if bitclk = '0' then
            i2s_state <= bitclk_low;
          end if;
        when bitclk_low =>
          if bitclk = '1' then
            i2s_state <= sample_bit;
          end if;
        when sample_bit =>
          data(23 - bit_count) := adcdat;
          if bit_count < 23 then
--            i2s_state     <= bitclk_high;
            bit_count := bit_count + 1;
          else
            i2s_state     <= latch_word;
            bit_count := 0;
          end if;
        when latch_word =>
          data_latched <= data;
          i2s_state        <= wait_for_daclrck_high;
        when wait_for_daclrck_high =>
          if daclrck = '1' then
            i2s_state        <= idle;
          end if;
      end case;
    end if;
  end process IIS2ST_proc;

  -- purpose: Converts IIS to ST format
  -- type   : sequential
  -- inputs : clk, reset_n
  -- outputs: 
  ST2IIS_proc : process (clk, reset_n)
    variable bit_count : integer range 0 to 23;
--    variable data      : std_logic_vector(23 downto 0) := (others => '0');
  begin  -- process IIS2ST_proc
    if reset_n = '0' then               -- asynchronous reset (active low)
      s2i_state        <= idle;
      dacdat <= '0';
      bit_count := 0;
--      data := (others => '0');
    elsif clk'event and clk = '0' then  -- rising clock edge
      case s2i_state is
        when idle=>
          if i2s_state = sample_bit then
--          if daclrck = '0' then
            s2i_state <= sample_bit;
            dacdat <= dac_data(23);
--            s2i_state <= wait_one_bit;
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
--            s2i_state     <= bitclk_low;
            bit_count := bit_count + 1;
          else
            s2i_state     <= wait_for_daclrck_high;
            bit_count := 0;
          end if;
        when bitclk_low =>
          if bitclk = '1' then
            s2i_state <= bitclk_high;
          end if;
        when wait_for_daclrck_high =>
          dacdat <= '0';
          if daclrck = '1' then
            s2i_state        <= idle;
          end if;
        when others =>
          s2i_state <= idle;
      end case;
    end if;
  end process ST2IIS_proc;
  
  latch_st_bus : process (ast_clk, reset_n)
  begin  -- process latch_st_bus
    if reset_n = '0' then               -- asynchronous reset (active low)
      ast_source_valid <= '0';
      ast_source_data  <= (others => '0');
      ast_source_error <= (others => '0');
    elsif ast_clk'event and ast_clk = '1' then  -- rising clock edge
      ast_source_data  <= data_latched;
      ast_source_valid <= '1';
      ast_source_error <= (others => '0');
    end if;
  end process latch_st_bus;

  latch_iis_bus : process (ast_clk, reset_n)
  begin  -- process latch_st_bus
    if reset_n = '0' then               -- asynchronous reset (active low)
      dac_data  <= (others => '0');
      ast_sink_ready <= '1';
    elsif ast_clk'event and ast_clk = '0' then  -- falling clock edge
      ast_sink_ready <= '1';
      if ast_sink_valid = '1' then
        dac_data  <= ast_sink_data;
      end if;
    end if;
  end process latch_iis_bus;
  
end architecture;

