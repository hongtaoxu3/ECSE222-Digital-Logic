-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert three_bit_up_counter as a component to test it
component three_bit_up_counter is
Port (     enable   : in std_logic;
           reset    : in std_logic;
           clk      : in std_logic;
           count    : out std_logic_vector(2 downto 0));

end component;
--define signals
signal enable_in: std_logic;
signal reset_in:  std_logic;
signal clk_in:  std_logic;
signal count_out: std_logic_vector(2 downto 0);
constant clock_period : time := 10 ns;

begin 
--connect DUT(design on the test)
  DUT : three_bit_up_counter port map (enable_in, reset_in, clk_in, count_out);
  

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
  wait for 100 ns;

  enable_in <= '0';
  reset_in <= '1';
  wait for 100 ns;

  enable_in <= '1';
  reset_in <= '0';
  wait for 100 ns;

  enable_in <= '1';
  reset_in <= '1';
  wait for 100 ns;

    wait;
  end process;
end tb;



