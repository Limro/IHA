library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity iis2st_rtl is
  port (
    -- Common --
    clk              : in  std_logic;
    reset_n          : in  std_logic;
    -- ST Bus --
    ast_sink_data    : in  std_logic_vector(23 downto 0);
    ast_sink_ready   : out std_logic := '0'; -- Value at startup
    ast_sink_valid   : in  std_logic;  
    ast_sink_error   : in  std_logic_vector(1 downto 0);
    ast_source_data  : out std_logic_vector(23 downto 0):=(others=>'0');
    ast_source_ready : in  std_logic;
    ast_source_valid : out std_logic:= '0';
    ast_source_error : out std_logic_vector(1 downto 0):=(others=>'0');
    -- IIS Interface --
    bitclk           : in  std_logic;
    adcdat           : in  std_logic;
    dacdat           : out std_logic := '0';
    adclrck          : in  std_logic;
    daclrck          : in  std_logic

    );
end entity iis2st_rtl;

architecture rtl of iis2st_rtl is

  component iis2st
    generic (
      bitperiod : time);
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
      ast_source_error : out std_logic_vector(1 downto 0);
      bitclk           : in  std_logic;
      adcdat           : in  std_logic;
      dacdat           : out std_logic;
      adclrck          : in  std_logic;
      daclrck          : in  std_logic
      );
  end component;

  -- This is where we select the rtl architecture
  for iis2st_inst : iis2st use entity work.iis2st(rtl);
  
begin

  iis2st_inst : iis2st
    generic map (
      bitperiod => 20 ns)
    port map (
      clk              => adclrck,
      reset_n          => reset_n,
      ast_sink_data    => ast_sink_data,
      ast_sink_ready   => ast_sink_ready,
      ast_sink_valid   => ast_sink_valid,
      ast_sink_error   => ast_sink_error,
      ast_source_data  => ast_source_data,
      ast_source_ready => ast_source_ready,
      ast_source_valid => ast_source_valid,
      ast_source_error => ast_source_error,
      bitclk           => bitclk,
      adcdat           => adcdat,
      dacdat           => dacdat,
      adclrck           => adclrck,
      daclrck           => daclrck);

end;
