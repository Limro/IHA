-- cpu_0_vector_mult_inst.vhd

-- This file was auto-generated as part of a generation operation.
-- If you edit it your changes will probably be lost.

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity cpu_0_vector_mult_inst is
	port (
		dataa  : in  std_logic_vector(31 downto 0) := (others => '0'); -- nios_custom_instruction_slave_0.dataa
		datab  : in  std_logic_vector(31 downto 0) := (others => '0'); --                                .datab
		result : out std_logic_vector(31 downto 0)                     --                                .result
	);
end entity cpu_0_vector_mult_inst;

architecture rtl of cpu_0_vector_mult_inst is
	component vector_mult is
		port (
			dataa  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- dataa
			datab  : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datab
			result : out std_logic_vector(31 downto 0)                     -- result
		);
	end component vector_mult;

begin

	cpu_0_vector_mult_inst : component vector_mult
		port map (
			dataa  => dataa,  -- nios_custom_instruction_slave_0.dataa
			datab  => datab,  --                                .datab
			result => result  --                                .result
		);

end architecture rtl; -- of cpu_0_vector_mult_inst
