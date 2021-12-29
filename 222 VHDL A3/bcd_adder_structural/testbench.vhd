-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert bcd_adder_structural as a component to test it
component bcd_adder_structural is
port (    A: in std_logic_vector (3 downto 0);
          B: in std_logic_vector (3 downto 0); 
          S: out std_logic_vector (3 downto 0);
          C: out std_logic); 

end component;

--define signals
signal a_in: std_logic_vector (3 downto 0) ;
signal b_in: std_logic_vector (3 downto 0) ;
signal s_out: std_logic_vector (3 downto 0) ;
signal c_out: std_logic;

begin 
--connect DUT(design on the test)
  DUT : bcd_adder_structural port map (a_in, b_in, s_out, c_out);
  
  process
  begin
   for m in 0 to 9 loop
   for n in 0 to 9 loop
   a_in <= std_logic_vector(to_unsigned(m, 4));
   b_in <= std_logic_vector(to_unsigned(n, 4));
   wait for 1 ns;
   end loop;
   end loop;
   
   

  wait;
  end process;
end tb;


  