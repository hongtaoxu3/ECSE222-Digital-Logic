-- Testbench for 2-to-1 Multiplexer
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert MUX_structural as a component to test it
component MUX_structural is
port(A       : in   std_logic;
     B       : in   std_logic;
     S       : in   std_logic;
     Y       : out  std_logic);
end component;

signal a_in, b_in, s_in, y_out: std_logic;

begin
  --connect DUT(design on the test)
  DUT: MUX_structural port map(a_in, b_in, s_in, y_out);
  
  process
  begin
    a_in <= '0';
    b_in <= '0';
    s_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '0';
    s_in <= '1';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '1';
    s_in <= '0';
    wait for 1 ns;
    
    a_in <= '0';
    b_in <= '1';
    s_in <= '1';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    s_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '0';
    s_in <= '1';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '1';
    s_in <= '0';
    wait for 1 ns;
    
    a_in <= '1';
    b_in <= '1';
    s_in <= '1';
    wait for 1 ns;
    
    --Clear inputs
    a_in <= '0';
    b_in <= '0';
    s_in <= '0';
    
    wait;
  end process;
end tb;
    
 

    