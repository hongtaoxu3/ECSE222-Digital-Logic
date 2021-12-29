-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert can_SOP as a component to test it
component can_SOP is
Port ( x1       : in std_logic ;
       x2       : in std_logic ;
       x3       : in std_logic ;
       x4       : in std_logic ;
       f1       : out std_logic ;
       f2       : out std_logic );
       
end component;

--define signals 
signal x1_in, x2_in, x3_in, x4_in, f1_out, f2_out:std_logic;

begin
  --connect DUT(design on the test)
  DUT : can_SOP port map (x1_in, x2_in, x3_in, x4_in, f1_out, f2_out);
  
  process
  begin
   --list all the possible inputs 
   
    x1_in <= '0';
    x2_in <= '0';
    x3_in <= '0';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '0';
    x3_in <= '0';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '0';
    x3_in <= '1';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '0';
    x3_in <= '1';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '1';
    x3_in <= '0';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '1';
    x3_in <= '0';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '1';
    x3_in <= '1';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '0';
    x2_in <= '1';
    x3_in <= '1';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '0';
    x3_in <= '0';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '0';
    x3_in <= '0';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '0';
    x3_in <= '1';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '0';
    x3_in <= '1';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '1';
    x3_in <= '0';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '1';
    x3_in <= '0';
    x4_in <= '1';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '1';
    x3_in <= '1';
    x4_in <= '0';
    wait for 1 ns;
    
    x1_in <= '1';
    x2_in <= '1';
    x3_in <= '1';
    x4_in <= '1';
    wait for 1 ns;
    
    --clear inputs
    x1_in <= '0';
    x2_in <= '0';
    x3_in <= '0';
    x4_in <= '0';
    
    wait;
  end process;
end tb;