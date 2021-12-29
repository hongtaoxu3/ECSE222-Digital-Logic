-- Code your testbench here
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert sequence_detector as a component to test it
component sequence_detector is
Port (   seq      : in std_logic ;
         enable   : in std_logic ;
         reset    : in std_logic ;
         clk      : in std_logic ;
         out_1    : out std_logic ; -- generates 1 when "1011" is detected ; otherwise 0.
         out_2    : out std_logic ); -- generates 1 when "0010" is detected ; otherwise 0.

end component;

--define signals
signal seq, enable, reset, clk, out_1, out_2: std_logic;

constant clock_period : time := 10 ns;

begin
uut: sequence_detector port map (
       seq => seq,
       enable => enable,
       reset => reset,
       clk => clk,
       out_1 => out_1,
       out_2 => out_2 );

   clock_generation :process
   begin
        clk <= '1';
        wait for clock_period/2;
        clk <= '0';
        wait for clock_period/2;
   end process clock_generation ;
   
   process
   begin    
      enable <= '0';
      reset <= '0';
      seq <= '0';
      wait for 20 ns;
      
      enable <= '0';
      reset <= '1';
      seq <= '0';
      wait for 20 ns;
      
      enable <= '1';
      reset <= '0';
      seq <= '0';
      wait for 20 ns;
      
      enable <= '1';
      reset <= '1';
      seq <= '0';
      wait for 20 ns;
      
      --set enable =1 and reset =1, then input the sequence 0011011011001001011011
      
      enable <= '1';
      reset <= '1';
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns; 
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns;
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns;
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;
      
      seq <= '0';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;  
      
      seq <= '1';
      wait for 10 ns;

   end process;

end;

