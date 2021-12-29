library IEEE;
use IEEE.std_logic_1164.all;

entity testbench is 
--empty
end testbench;

architecture tb of testbench is
--Insert barrel_shifter_behavioral as a component to test it
component barrel_shifter_behavioral is
Port (X       : in std_logic_vector (3 downto 0) ;
      sel     : in std_logic_vector (1 downto 0) ;
      Y       : out std_logic_vector (3 downto 0) );
end component;

--define input and output signals
signal x_in: std_logic_vector(3 downto 0);
signal sel_in: std_logic_vector(1 downto 0);
signal y_out: std_logic_vector (3 downto 0);

begin
  --connect DUT(design on the test)
  DUT : barrel_shifter_behavioral port map(x_in, sel_in, y_out);
  
  process
  begin
   --list all the possible inputs 
    
    --all different inputs when sel <= "00"
    x_in <= "0000";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0001";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0010";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0011";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0100";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0101";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0110";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "0111";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1000";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1001";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1010";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1011";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1100";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1101";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1110";
    sel_in <= "00";
    wait for 1 ns;
    
    x_in <= "1111";
    sel_in <= "00";
    wait for 1 ns;
    
     --all different inputs when sel <= "01"
    x_in <= "0000";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0001";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0010";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0011";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0100";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0101";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0110";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "0111";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1000";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1001";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1010";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1011";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1100";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1101";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1110";
    sel_in <= "01";
    wait for 1 ns;
    
    x_in <= "1111";
    sel_in <= "01";
    wait for 1 ns;
    
     --all different inputs when sel <= "10"
    x_in <= "0000";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0001";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0010";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0011";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0100";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0101";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0110";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "0111";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1000";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1001";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1010";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1011";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1100";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1101";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1110";
    sel_in <= "10";
    wait for 1 ns;
    
    x_in <= "1111";
    sel_in <= "10";
    wait for 1 ns;
    
     --all different inputs when sel <= "11"
    x_in <= "0000";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0001";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0010";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0011";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0100";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0101";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0110";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "0111";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1000";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1001";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1010";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1011";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1100";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1101";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1110";
    sel_in <= "11";
    wait for 1 ns;
    
    x_in <= "1111";
    sel_in <= "11";
    wait for 1 ns;
    
    wait;
  end process;
end tb;