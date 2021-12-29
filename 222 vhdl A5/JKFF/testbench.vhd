-- Code your testbench here
library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert jkff as a component to test it
component jkff is
Port (    clk : in std_logic;
          J   : in std_logic;
          K   : in std_logic;
          Q   : out std_logic);

end component;
--define signals
signal clk_in: std_logic;
signal J_in:  std_logic;
signal K_in:  std_logic;
signal Q_out: std_logic;
constant clock_period : time := 10 ns;


begin 
--connect DUT(design on the test)
  DUT : jkff port map (clk_in, J_in, K_in, Q_out);
  

clock_generation : process
begin
   clk_in <= '1';
   wait for clock_period/2;
   clk_in <= '0';
   wait for clock_period/2;
end process clock_generation ;

  process 
  begin

  J_in <= '0';
  K_in <= '0';
  wait for 100 ns;

  J_in <= '0';
  K_in <= '1';
  wait for 100 ns;

  J_in <= '1';
  K_in <= '0';
  wait for 100 ns;

  J_in <= '1';
  K_in <= '1';
  wait for 100 ns;

    wait;
  end process;
end tb;


