-- RAM_Sound_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RAM_Sound_0 is
	port (
		avs_s1_write           : in  std_logic                     := '0';             --                      s1.write
		avs_s1_read            : in  std_logic                     := '0';             --                        .read
		avs_s1_chipselect      : in  std_logic                     := '0';             --                        .chipselect
		avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => '0'); --                        .address
		avs_s1_writedata       : in  std_logic_vector(31 downto 0) := (others => '0'); --                        .writedata
		avs_s1_readdata        : out std_logic_vector(31 downto 0);                    --                        .readdata
		ast_source_data        : out std_logic_vector(23 downto 0);                    -- avalon_streaming_source.data
		ast_source_ready       : in  std_logic                     := '0';             --                        .ready
		ast_source_valid       : out std_logic;                                        --                        .valid
		ast_source_error       : out std_logic_vector(1 downto 0);                     --                        .error
		csi_clockreset_reset_n : in  std_logic                     := '0';             --                   reset.reset_n
		csi_clockreset_clk     : in  std_logic                     := '0';             --               clock_50M.clk
		ast_clk                : in  std_logic                     := '0'              --               clock_12M.clk
	);
end entity RAM_Sound_0;

architecture rtl of RAM_Sound_0 is
	component Syntezise is
		generic (
			ramSize : natural := 512
		);
		port (
			avs_s1_write           : in  std_logic                     := 'X';             -- write
			avs_s1_read            : in  std_logic                     := 'X';             -- read
			avs_s1_chipselect      : in  std_logic                     := 'X';             -- chipselect
			avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			avs_s1_writedata       : in  std_logic_vector(31 downto 0) := (others => 'X'); -- writedata
			avs_s1_readdata        : out std_logic_vector(31 downto 0);                    -- readdata
			ast_source_data        : out std_logic_vector(23 downto 0);                    -- data
			ast_source_ready       : in  std_logic                     := 'X';             -- ready
			ast_source_valid       : out std_logic;                                        -- valid
			ast_source_error       : out std_logic_vector(1 downto 0);                     -- error
			csi_clockreset_reset_n : in  std_logic                     := 'X';             -- reset_n
			csi_clockreset_clk     : in  std_logic                     := 'X';             -- clk
			ast_clk                : in  std_logic                     := 'X'              -- clk
		);
	end component Syntezise;

begin

	ram_sound_0 : component Syntezise
		generic map (
			ramSize => 256
		)
		port map (
			avs_s1_write           => avs_s1_write,           --                      s1.write
			avs_s1_read            => avs_s1_read,            --                        .read
			avs_s1_chipselect      => avs_s1_chipselect,      --                        .chipselect
			avs_s1_address         => avs_s1_address,         --                        .address
			avs_s1_writedata       => avs_s1_writedata,       --                        .writedata
			avs_s1_readdata        => avs_s1_readdata,        --                        .readdata
			ast_source_data        => ast_source_data,        -- avalon_streaming_source.data
			ast_source_ready       => ast_source_ready,       --                        .ready
			ast_source_valid       => ast_source_valid,       --                        .valid
			ast_source_error       => ast_source_error,       --                        .error
			csi_clockreset_reset_n => csi_clockreset_reset_n, --                   reset.reset_n
			csi_clockreset_clk     => csi_clockreset_clk,     --               clock_50M.clk
			ast_clk                => ast_clk                 --               clock_12M.clk
		);

end architecture rtl; -- of RAM_Sound_0
