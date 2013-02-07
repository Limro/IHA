library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package vector_test is
  
  type test_vector is record
    a : std_logic_vector(31 downto 0);
    b : std_logic_vector(31 downto 0);
    r : std_logic_vector(31 downto 0);
  end record;  
  
  type test_array is array
    (natural range <>) of test_vector;
  
  constant test_vectors : test_array := (
    (X"01010101",
     X"02020202",
     X"00000007"),
     
    (X"01010101",
     X"03030303",
     X"0000000C"),
    
    (X"01010101",
     X"03030303",
     X"0000000C"),
    
    (X"02020202",
     X"03030303",
     X"00000018"),
    
    (X"7F7F7F7F",
     X"7F7F7F7F",
     X"0000FC04"),
    
    (X"05070A0E",
     X"06090B0F",
     X"0000019D"),
    
    (X"FAFAFAFA",  -- FA = -6
     X"F7F7F7F7",  -- F7 = -9
     X"000000D8"), -- 216
    
    (X"06060606",  -- FA = 6
     X"F7F7F7F7",  -- F7 = -9
     X"FFFFFF28"), -- -216
    
    (X"05070A0E",
     X"06090B0F",
     X"0000000D")
     );         

end vector_test;

package body vector_test is
end vector_test; 
