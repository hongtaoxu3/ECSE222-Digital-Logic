-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert wrapper as a component to test it
component wrapper is
Port   ( enable  : in std_logic ;
         reset   : in std_logic ;
         clk     : in std_logic ;
         HEX0    : out std_logic_vector(6 downto 0));
end component;

--define signals
signal enable_in: std_logic;
signal reset_in:  std_logic;
signal clk_in:  std_logic;
signal HEX0_out: std_logic_vector(6 downto 0);
constant clock_period : time := 100 ms;

begin 
--connect DUT(design on the test)
DUT : wrapper port map (enable_in, reset_in, clk_in, HEX0_out);

clock_generation : process
begin
   clk_in <= '1';
   wait for clock_period/2;
   clk_in <= '0';
   wait for clock_period/2;
end process clock_generation ;

  process 
  begin
  
  enable_in <= '0';
  reset_in <= '0';
  wait for 700 ms;

  enable_in <= '0';
  reset_in <= '1';
  wait for 700 ms;

  enable_in <= '1';
  reset_in <= '0';
  wait for 700 ms;

  enable_in <= '1';
  reset_in <= '1';
  wait for 800 ms;

    wait;
  end process;
end tb;




