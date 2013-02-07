library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;
use work.vector_test.all;
use work.io_utils.all;

entity vector_mult_tb is
end;

architecture bench of vector_mult_tb is

  component vector_mult
  port(dataa, datab : in std_logic_vector(31 downto 0);
    result : out std_logic_vector(31 downto 0));
  end component;
  
  signal dataa, datab: std_logic_vector(31 downto 0);
  signal result: std_logic_vector(31 downto 0);

begin

  uut: vector_mult port map ( dataa  => dataa,
                              datab  => datab,
                              result => result );

  stimulus: process
  begin
    for i in test_vectors'range loop
      
      dataa <= test_vectors(i).a;
      datab <= test_vectors(i).b;
      
      wait for 20 ns;
      
      assert(result = test_vectors(i).r) report "Test vector " & integer'image(i) & " failed" severity error;
      
    end loop;
    wait;
  end process;
end;