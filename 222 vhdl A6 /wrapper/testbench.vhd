-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert wrapper as a component to test it
component wrapper is
Port   (  reset  : in std_logic ;
          clk    : in std_logic ;
          HEX0   : out std_logic_vector(6 downto 0);
          HEX5   : out std_logic_vector(6 downto 0) );
end component;

--define signals
signal reset: std_logic;
signal clk:  std_logic;
signal HEX0: std_logic_vector(6 downto 0);
signal HEX5: std_logic_vector(6 downto 0);
constant clock_period : time := 100 ms;

begin
uut: wrapper port map (
       
       reset => reset,
       clk => clk,
       HEX0 => HEX0,
       HEX5 => HEX5 );

clock_generation : process
begin
   clk <= '1';
   wait for 50 ms;
   clk <= '0';
   wait for 50 ms;
end process clock_generation ;

process 
  begin
  
   reset <= '0';
  
   wait for 700 ms;
   
   reset <= '1';

 

    wait;
  end process;
end tb;
