-- mm_bus_seven_seg_four_digit_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mm_bus_seven_seg_four_digit_0 is
	port (
		csi_clockreset_clk     : in  std_logic                     := '0';             --       clockreset.clk
		csi_clockreset_reset_n : in  std_logic                     := '0';             -- clockreset_reset.reset_n
		avs_s1_write           : in  std_logic                     := '0';             --               s1.write
		avs_s1_read            : in  std_logic                     := '0';             --                 .read
		avs_s1_chipselect      : in  std_logic                     := '0';             --                 .chipselect
		avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => '0'); --                 .address
		avs_s1_writedata       : in  std_logic_vector(15 downto 0) := (others => '0'); --                 .writedata
		avs_s1_readdata        : out std_logic_vector(15 downto 0);                    --                 .readdata
		hex0                   : out std_logic_vector(6 downto 0);                     --              HEX.export
		hex1                   : out std_logic_vector(6 downto 0);                     --                 .export
		hex2                   : out std_logic_vector(6 downto 0);                     --                 .export
		hex3                   : out std_logic_vector(6 downto 0)                      --                 .export
	);
end entity mm_bus_seven_seg_four_digit_0;

architecture rtl of mm_bus_seven_seg_four_digit_0 is
	component mm_bus_seven_seg_four_digit is
		port (
			csi_clockreset_clk     : in  std_logic                     := 'X';             -- clk
			csi_clockreset_reset_n : in  std_logic                     := 'X';             -- reset_n
			avs_s1_write           : in  std_logic                     := 'X';             -- write
			avs_s1_read            : in  std_logic                     := 'X';             -- read
			avs_s1_chipselect      : in  std_logic                     := 'X';             -- chipselect
			avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			avs_s1_writedata       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			avs_s1_readdata        : out std_logic_vector(15 downto 0);                    -- readdata
			hex0                   : out std_logic_vector(6 downto 0);                     -- export
			hex1                   : out std_logic_vector(6 downto 0);                     -- export
			hex2                   : out std_logic_vector(6 downto 0);                     -- export
			hex3                   : out std_logic_vector(6 downto 0)                      -- export
		);
	end component mm_bus_seven_seg_four_digit;

begin

	mm_bus_seven_seg_four_digit_0 : component mm_bus_seven_seg_four_digit
		port map (
			csi_clockreset_clk     => csi_clockreset_clk,     --       clockreset.clk
			csi_clockreset_reset_n => csi_clockreset_reset_n, -- clockreset_reset.reset_n
			avs_s1_write           => avs_s1_write,           --               s1.write
			avs_s1_read            => avs_s1_read,            --                 .read
			avs_s1_chipselect      => avs_s1_chipselect,      --                 .chipselect
			avs_s1_address         => avs_s1_address,         --                 .address
			avs_s1_writedata       => avs_s1_writedata,       --                 .writedata
			avs_s1_readdata        => avs_s1_readdata,        --                 .readdata
			hex0                   => hex0,                   --              HEX.export
			hex1                   => hex1,                   --                 .export
			hex2                   => hex2,                   --                 .export
			hex3                   => hex3                    --                 .export
		);

end architecture rtl; -- of mm_bus_seven_seg_four_digit_0
