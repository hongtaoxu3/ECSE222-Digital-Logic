-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert half_adder as a component to test it
component half_adder is
port (  a: in std_logic;
        b: in std_logic;
        s: out std_logic; 
        c: out std_logic);

end component;

--define signals
signal a_in, b_in, s_out, c_out:std_logic;

begin 

--connect DUT(design on the test)
  DUT : half_adder port map (a_in, b_in, s_out, c_out);
  
  process
  begin
   --list all the possible inputs 
   
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    
    --Clear inputs
    a_in <= '0';
    b_in <= '0';
    
    wait;
  end process;
end tb;
    
    
    