-- mm_bus_counter_0.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity mm_bus_counter_0 is
	port (
		csi_clockreset_clk     : in  std_logic                     := '0';             --       clockreset.clk
		csi_clockreset_reset_n : in  std_logic                     := '0';             -- clockreset_reset.reset_n
		avs_s1_write           : in  std_logic                     := '0';             --               s1.write
		avs_s1_read            : in  std_logic                     := '0';             --                 .read
		avs_s1_chipselect      : in  std_logic                     := '0';             --                 .chipselect
		avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => '0'); --                 .address
		avs_s1_writedata       : in  std_logic_vector(15 downto 0) := (others => '0'); --                 .writedata
		avs_s1_readdata        : out std_logic_vector(15 downto 0);                    --                 .readdata
		ins_irq0_irq           : out std_logic;                                        --             irq0.irq
		input_counter          : in  std_logic                     := '0';             --      conduit_end.export
		input_irq              : in  std_logic                     := '0'              --                 .export
	);
end entity mm_bus_counter_0;

architecture rtl of mm_bus_counter_0 is
	component mm_bus_counter is
		port (
			csi_clockreset_clk     : in  std_logic                     := 'X';             -- clk
			csi_clockreset_reset_n : in  std_logic                     := 'X';             -- reset_n
			avs_s1_write           : in  std_logic                     := 'X';             -- write
			avs_s1_read            : in  std_logic                     := 'X';             -- read
			avs_s1_chipselect      : in  std_logic                     := 'X';             -- chipselect
			avs_s1_address         : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			avs_s1_writedata       : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			avs_s1_readdata        : out std_logic_vector(15 downto 0);                    -- readdata
			ins_irq0_irq           : out std_logic;                                        -- irq
			input_counter          : in  std_logic                     := 'X';             -- export
			input_irq              : in  std_logic                     := 'X'              -- export
		);
	end component mm_bus_counter;

begin

	mm_bus_counter_0 : component mm_bus_counter
		port map (
			csi_clockreset_clk     => csi_clockreset_clk,     --       clockreset.clk
			csi_clockreset_reset_n => csi_clockreset_reset_n, -- clockreset_reset.reset_n
			avs_s1_write           => avs_s1_write,           --               s1.write
			avs_s1_read            => avs_s1_read,            --                 .read
			avs_s1_chipselect      => avs_s1_chipselect,      --                 .chipselect
			avs_s1_address         => avs_s1_address,         --                 .address
			avs_s1_writedata       => avs_s1_writedata,       --                 .writedata
			avs_s1_readdata        => avs_s1_readdata,        --                 .readdata
			ins_irq0_irq           => ins_irq0_irq,           --             irq0.irq
			input_counter          => input_counter,          --      conduit_end.export
			input_irq              => input_irq               --                 .export
		);

end architecture rtl; -- of mm_bus_counter_0
