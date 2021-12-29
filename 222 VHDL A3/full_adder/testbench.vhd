-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert full_adder as a component to test it
component full_adder is
port (  a: in std_logic; 
        b: in std_logic;
        c_in: in std_logic; 
        s: out std_logic;
        c_out: out std_logic); 

end component;

--define signals
signal a_in, b_in, c_in, s_out, c_out:std_logic;

begin 
--connect DUT(design on the test)
  DUT : full_adder port map (a_in, b_in, c_in, s_out, c_out);
  
  process
  begin
   --list all the possible inputs 
   
    c_in <= '0';
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    
    c_in <= '0';
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    
    c_in <= '0';
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    
    c_in <= '0';
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    
    c_in <= '1';
    a_in <= '0';
    b_in <= '0';
    wait for 1 ns;
    
    c_in <= '1';
    a_in <= '0';
    b_in <= '1';
    wait for 1 ns;
    
    c_in <= '1';
    a_in <= '1';
    b_in <= '0';
    wait for 1 ns;
    
    c_in <= '1';
    a_in <= '1';
    b_in <= '1';
    wait for 1 ns;
    
    --Clear inputs
    c_in <= '0';
    a_in <= '0';
    b_in <= '0';
    
    wait;
  end process;
end tb;
   




