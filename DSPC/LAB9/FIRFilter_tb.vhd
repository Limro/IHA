library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
--use fir_filter.work.all;

entity FIRFilter_tb is
end;

architecture bench of FIRFilter_tb is

  component FIRFilter
    generic (
      filterOrder : natural;
      inputWidth : natural);
    port (
      clk              : in  std_logic;
      reset_n          : in  std_logic;
      ast_sink_data    : in  std_logic_vector(23 downto 0);
      ast_sink_ready   : out std_logic;
      ast_sink_valid   : in  std_logic;
      ast_sink_error   : in  std_logic_vector(1 downto 0);
      ast_source_data  : out std_logic_vector(23 downto 0);
      ast_source_ready : in  std_logic;
      ast_source_valid : out std_logic;
      ast_source_error : out std_logic_vector(1 downto 0)
      );
  end component;

  signal clk              : std_logic                     := '0';
  signal Clk48KHz         : std_logic                     := '0';
  signal reset_n          : std_logic                     := '0';
  signal coeff_in_clk     : std_logic                     := '0';
  signal coeff_in_areset  : std_logic                     := '0';
  signal ast_sink_data    : std_logic_vector(23 downto 0) := (others => '0');
  signal ast_sink_ready   : std_logic                     := '0';
  signal ast_sink_valid   : std_logic                     := '0';
  signal ast_sink_error   : std_logic_vector(1 downto 0)  := (others => '0');
  signal ast_source_data  : std_logic_vector(23 downto 0);
  signal ast_source_ready : std_logic                     := '1';
  signal ast_source_valid : std_logic;
  signal ast_source_error : std_logic_vector(1 downto 0);

  -- clock
  constant clockperiod  : time := 10 ns;  -- clk period time
  constant sampleperiod : time := 20833 ns;  -- clk period time
  constant filterOrder : natural := 10;
  constant inputWidth : natural := 24;
  
  -- IIS data generation process
  procedure sendSample(
    constant val : in std_logic_vector(23 downto 0);
    signal audioclk : in std_logic;
    signal clk : in std_logic;
    signal valid : out std_logic;
    signal data : out std_logic_vector(23 downto 0)) is
  begin    
    wait until audioclk = '0';
    wait until audioclk = '1';
    wait until clk = '1';
    data <= val; 
    valid <= '1';
    -- One wait state
    wait until clk = '0';
    wait until clk = '1';
    for i in 1 downto 0 loop -- 3 wait states
      wait until clk = '0';
      wait until clk = '1';
    end loop;    
    valid <= '0';    
  end sendSample;  
  
begin

  FirFilter_inst : FIRFilter
    generic map (
      filterOrder => filterOrder,
      inputWidth => inputWidth)
    port map (
      clk              => clk,       --48KHz Clock
      reset_n          => reset_n,
      ast_sink_data    => ast_sink_data,
      ast_sink_ready   => ast_sink_ready,
      ast_sink_valid   => ast_sink_valid,
      ast_sink_error   => ast_sink_error,
      ast_source_data  => ast_source_data,
      ast_source_ready => ast_source_ready,
      ast_source_valid => ast_source_valid,
      ast_source_error => ast_source_error);


   -- clock generation
clk <= not clk after clockperiod/2;
Clk48KHz <= not Clk48KHz after sampleperiod/2;

reset_n <= '0', '1' after 125 ns;

-------------------------------------------------------------------------------
-- waveform generation
-- Creates impulse and waits
-------------------------------------------------------------------------------
WaveGen_Proc: process
begin
  wait until reset_n = '1';

  ast_source_ready <= '1';
  ast_sink_error <= "00";
  
  sendSample(X"000100", CLK48KHz, clk, ast_sink_valid, ast_sink_data); -- Impulse
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  sendSample(X"000000", CLK48KHz, clk, ast_sink_valid, ast_sink_data);
  
  wait;
end process WaveGen_Proc;


end;  -- Architecture


-------------------------------------------------------------------------------
-- RTL simulation of iis/st-bus bridge
-------------------------------------------------------------------------------
configuration rtl_sim_cfg of FIRFilter_tb is  -- config name of arch
  for bench                                       -- TB architecture name
    for FirFilter_inst : FIRFilter                      -- For the specific instance

    end for;
  end for;
end rtl_sim_cfg;

configuration state_sim_cfg of FIRFilter_tb is  -- config name of arch
  for bench                                       -- TB architecture name
    for FirFilter_inst : FIRFilter                      -- For the specific instance
      use entity work.FIRFilter(state);         -- use its "functional" arch
    end for;
  end for;
end state_sim_cfg;
