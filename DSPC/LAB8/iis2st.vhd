library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st is
  generic (bitperiod : time := 20 ns);  -- Default value
  port (
    -- Common --
    clk              : in  std_logic;   -- 50MHz
    reset_n          : in  std_logic;
    -- ST Bus --
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
-- Functional version of iis2st 
-- For simulation / test ONLY!
-------------------------------------------------------------------------------
architecture functional of iis2st is

begin

  -----------------------------------------------------------------------------
  -- This process de-serializes the IIS data stream and
  -- creates the appropriate ST-BUS handshaking
  -- It converts the IIS' LEFT channel only! to an ST-BUS 
  -- signal with the following parameteres:
  -- 8 bit/symbol ; 24-bits/beat ; NO backpressure
  -- NOTE! it uses "wait for" etc and can absolutely NOT
  -- be compiled to real FPGA hardware. It is solely for
  -- simulation / testing
  -----------------------------------------------------------------------------
  IIS2ST : process
    variable bitcount            : integer range 0 to 23         := 0;
    variable st_source_data_temp : std_logic_vector(23 downto 0) := (others => '0');
  begin
    wait until adclrck = '0';
    wait for bitperiod;
    wait until bitclk = '1';
    for bitcount in 23 downto 0 loop    --shift register
      st_source_data_temp(bitcount) := adcdat;
      wait for bitperiod;
    end loop;
    wait until adclrck = '1';
    ast_source_valid <= '0';
    ast_source_data  <= st_source_data_temp;
    ast_source_valid <= '1';
  end process;

  ST2IIS : process
    variable bitcount          : integer range 0 to 23;
    variable st_sink_data_temp : std_logic_vector(23 downto 0) := (others => '0');
  begin
    wait until daclrck = '0';
    wait for bitperiod;
    if ast_sink_valid = '1' then
      st_sink_data_temp := ast_sink_data;
    end if;
    for bitcount in 23 downto 0 loop    --shift register
      dacdat <= st_sink_data_temp(bitcount);
      wait for bitperiod;
    end loop;
    dacdat <= '0';
  end process;

  ast_source_error <= (others => '0');
  ast_sink_ready   <= '1';
  
end architecture;


-------------------------------------------------------------------------------
-- RTL version of iis2st 
-- For actual implementation
-------------------------------------------------------------------------------
architecture rtl of iis2st is

  -- Build an enumerated type for the state machine
  type state_type is (idle, wait_one_bit, bitclk_high, bitclk_low, sample_bit, latch_word, sampleclk_low);
  
  type real_state_type is (start, fetchData, writeTo, bitclk_high, bitclk_low, allWritten);

  -- Register to hold the current state
  signal state : state_type;
  signal realState : real_state_type;

  signal data_latched : std_logic_vector(23 downto 0) := (others => '0');


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
	  state <= idle;
    elsif clk'event and clk = '1' then  -- rising clock edge
      case state is
        when idle=>
          if adclrck = '0' then
            state <= wait_one_bit;
          end if;
        when wait_one_bit=>
          if bitclk = '1' then
            state <= bitclk_high;
          end if;
        when bitclk_high=>
          if bitclk = '0' then
            state <= bitclk_low;
          end if;
        when bitclk_low =>
          if bitclk = '1' then
            state <= sample_bit;
          end if;
        when sample_bit =>
          data(23 - bit_count) := adcdat;
          if bit_count < 23 then
            state     <= bitclk_high;
            bit_count := bit_count + 1;
          else
            state     <= latch_word;
            bit_count := 0;
          end if;
        when latch_word =>
          data_latched <= data;
          state        <= sampleclk_low;
        when sampleclk_low=>
          if adclrck = '1' then
            state <= idle;
          end if;
      end case;
    end if;
  end process IIS2ST_proc;

  latch_st_bus : process (adclrck, reset_n)
  begin  -- process latch_st_bus
    if reset_n = '0' then               -- asynchronous reset (active low)
      ast_source_valid <= '0';
      ast_source_data  <= (others => '0');
      ast_source_error <= (others => '0');
    elsif adclrck'event and adclrck = '1' then  -- rising clock edge
      ast_source_data  <= data_latched;
      ast_source_valid <= '1';
      ast_source_error <= (others => '0');
    end if;
  end process latch_st_bus;

  --IMPLEMENT THIS PROCESS AS REAL SYNTIZABLE CODE (Like above)
  -- ST2IIS : process
    -- variable bitcount          : integer range 0 to 23;
    -- variable st_sink_data_temp : std_logic_vector(23 downto 0) := (others => '0');
  -- begin
    -- wait until daclrck = '0';
    -- wait for bitperiod;
    -- if ast_sink_valid = '1' then
      -- st_sink_data_temp := ast_sink_data;
    -- end if;
    -- for bitcount in 23 downto 0 loop    --shift register
      -- dacdat <= st_sink_data_temp(bitcount);
      -- wait for bitperiod;
    -- end loop;
    -- dacdat <= '0';
  -- end process ST2IIS;
  
    ST2IIS_proc : process(clk, reset_n)
    variable bit_count : integer range 0 to 23;
    variable data : std_logic_vector(23 downto 0) := (others => '0');
	variable gotData : std_logic := '0';
	variable lastCycle : std_logic := '0';
  begin
	if reset_n = '0' then               -- asynchronous reset (active low)
	   realState <= start;
	elsif clk'event and clk = '1' then  -- rising clock edge
		case realState is
		
			when start =>			
				if daclrck = '0' then
					gotData := '0';
					lastCycle := '0';
					realState <= bitclk_high;
				end if;
				
			when fetchData =>
				if ast_sink_valid = '1' then
					bit_count := 0;
					data := ast_sink_data;
					gotData := '1';
					realState <= writeTo;
				end if;
			
			when writeTo => 		--Check bit-clock, write 1 bit, check if that was the last bit (and reset / or increment)
				if bitclk = '0' then
				   dacdat <= data(23-bit_count);
				end if;
				if bit_count = 23 then
					bit_count := 0;
					realState <= allWritten;
				else
 					bit_count := bit_count + 1;
					realState <= bitclk_high;
				end if;
			
			when bitclk_high => -- half a bit clock
				if bitclk = '1' then
					realState <= bitclk_low;
				end if;
				
			when bitclk_low => --another half a bit clock
				if bitclk = '0' then
					if gotData = '1' then
						realState <= writeTo;
					elsif lastCycle = '1' then
						realState <= start;
					else 
						realState <= fetchData;
					end if;
				end if;
			
			when allWritten =>
				lastCycle := '1';
				dacdat <= '0';
				gotData := '0';
				realState <= bitclk_high;

		end case;
	end if;
  end process ST2IIS_proc;
  
  ast_sink_ready <= '1';
  
end architecture;

