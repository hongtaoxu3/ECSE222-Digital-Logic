-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert clock_divider as a component to test it
component clock_divider is
Port (   enable   : in std_logic;
         reset    : in std_logic;
         clk      : in std_logic;
         en_out   : out std_logic );
end component;

--define signals
signal enable_in: std_logic;
signal reset_in:  std_logic;
signal clk_in:  std_logic;
signal en_out_out: std_logic;
constant clock_period : time := 100 ms;

begin 
--connect DUT(design on the test)
DUT : clock_divider port map (enable_in, reset_in, clk_in, en_out_out);

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
  wait for 1000 ms;

  enable_in <= '0';
  reset_in <= '1';
  wait for 1000 ms;

  enable_in <= '1';
  reset_in <= '0';
  wait for 1200 ms;

  enable_in <= '1';
  reset_in <= '1';
  wait for 1000 ms;

    wait;
  end process;
end tb;



