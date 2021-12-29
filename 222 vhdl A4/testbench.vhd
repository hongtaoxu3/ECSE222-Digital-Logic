library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity testbench is
--empty
end testbench;

architecture tb of testbench is
component four_bit_comparator is
port ( A,B : in STD_LOGIC_VECTOR (3 downto 0);
       AgtBplusOne : out STD_LOGIC;
       AgteBplusOne : out STD_LOGIC;
       AltBplusOne : out STD_LOGIC;
       AlteBplusOne : out STD_LOGIC;
       AeqBplusOne : out STD_LOGIC;
       Overflow : out STD_LOGIC);
end component;

--define signals
signal A_in,B_in:STD_LOGIC_VECTOR (3 downto 0);
signal AgtBplusOne_out,AgteBplusOne_out,AltBplusOne_out,AlteBplusOne_out,AeqBplusOne_out,Overflow_out :STD_LOGIC;

 begin
 --connect DUT(design on the test)
 DUT : four_bit_comparator port map(A_in, b_in,   AgtBplusOne_out,AgteBplusOne_out,AltBplusOne_out,AlteBplusOne_out,AeqBplusOne_out,Overflow_out );

process
begin

   for m in 0 to 15 loop
   for n in 0 to 15 loop
   A_in <= std_logic_vector(to_unsigned(m, 4));
   B_in <= std_logic_vector(to_unsigned(n, 4));
   wait for 1 ns;
   end loop;
   end loop;

wait;
end process;
end tb;
    