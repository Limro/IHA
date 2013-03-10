-- iis2st_hw_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity iis2st_hw_0 is
	port (
		reset_n          : in  std_logic                     := '0';             --                   reset.reset_n
		ast_sink_data    : in  std_logic_vector(23 downto 0) := (others => '0'); --   avalon_streaming_sink.data
		ast_sink_ready   : out std_logic;                                        --                        .ready
		ast_sink_valid   : in  std_logic                     := '0';             --                        .valid
		ast_sink_error   : in  std_logic_vector(1 downto 0)  := (others => '0'); --                        .error
		ast_source_data  : out std_logic_vector(23 downto 0);                    -- avalon_streaming_source.data
		ast_source_ready : in  std_logic                     := '0';             --                        .ready
		ast_source_valid : out std_logic;                                        --                        .valid
		ast_source_error : out std_logic_vector(1 downto 0);                     --                        .error
		bitclk           : in  std_logic                     := '0';             --             conduit_end.export
		adcdat           : in  std_logic                     := '0';             --                        .export
		dacdat           : out std_logic;                                        --                        .export
		adclrck          : in  std_logic                     := '0';             --                        .export
		daclrck          : in  std_logic                     := '0';             --                        .export
		clk              : in  std_logic                     := '0';             --               clock_12M.clk
		ast_clk          : in  std_logic                     := '0'              --               clock_48k.clk
	);
end entity iis2st_hw_0;

architecture rtl of iis2st_hw_0 is
	component iis2st is
		port (
			reset_n          : in  std_logic                     := 'X';             -- reset_n
			ast_sink_data    : in  std_logic_vector(23 downto 0) := (others => 'X'); -- data
			ast_sink_ready   : out std_logic;                                        -- ready
			ast_sink_valid   : in  std_logic                     := 'X';             -- valid
			ast_sink_error   : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- error
			ast_source_data  : out std_logic_vector(23 downto 0);                    -- data
			ast_source_ready : in  std_logic                     := 'X';             -- ready
			ast_source_valid : out std_logic;                                        -- valid
			ast_source_error : out std_logic_vector(1 downto 0);                     -- error
			bitclk           : in  std_logic                     := 'X';             -- export
			adcdat           : in  std_logic                     := 'X';             -- export
			dacdat           : out std_logic;                                        -- export
			adclrck          : in  std_logic                     := 'X';             -- export
			daclrck          : in  std_logic                     := 'X';             -- export
			clk              : in  std_logic                     := 'X';             -- clk
			ast_clk          : in  std_logic                     := 'X'              -- clk
		);
	end component iis2st;

begin

	iis2st_hw_0 : component iis2st
		port map (
			reset_n          => reset_n,          --                   reset.reset_n
			ast_sink_data    => ast_sink_data,    --   avalon_streaming_sink.data
			ast_sink_ready   => ast_sink_ready,   --                        .ready
			ast_sink_valid   => ast_sink_valid,   --                        .valid
			ast_sink_error   => ast_sink_error,   --                        .error
			ast_source_data  => ast_source_data,  -- avalon_streaming_source.data
			ast_source_ready => ast_source_ready, --                        .ready
			ast_source_valid => ast_source_valid, --                        .valid
			ast_source_error => ast_source_error, --                        .error
			bitclk           => bitclk,           --             conduit_end.export
			adcdat           => adcdat,           --                        .export
			dacdat           => dacdat,           --                        .export
			adclrck          => adclrck,          --                        .export
			daclrck          => daclrck,          --                        .export
			clk              => clk,              --               clock_12M.clk
			ast_clk          => ast_clk           --               clock_48k.clk
		);

end architecture rtl; -- of iis2st_hw_0
