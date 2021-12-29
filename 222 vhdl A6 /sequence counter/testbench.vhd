-- Code your testbench here
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert sequence_detector as a component to test it
component sequence_counter is
Port (   seq      : in std_logic ;
         enable   : in std_logic ;
         reset    : in std_logic ;
         clk      : in std_logic ;
         cnt_1    : out std_logic_vector(2 downto 0) ; -- counts the occurrence of "1101".
         cnt_2    : out std_logic_vector(2 downto 0) ); -- counts the occurrence of "0010".
end component;

--define signals
signal seq, enable, reset, clk: std_logic;
signal cnt_1, cnt_2: std_logic_vector(2 downto 0) ;

constant clock_period : time := 10 ns;

begin
uut: sequence_counter port map (
       seq => seq,
       enable => enable,
       reset => reset,
       clk => clk,
       cnt_1 => cnt_1,
       cnt_2 => cnt_2 );

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


