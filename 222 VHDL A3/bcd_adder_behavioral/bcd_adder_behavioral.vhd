library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL ;

entity bcd_adder_behavioral is
port (    A: in std_logic_vector (3 downto 0);
          B: in std_logic_vector (3 downto 0); 
          S: out std_logic_vector (3 downto 0);
          c: out std_logic); 
end bcd_adder_behavioral;

architecture behavioral of bcd_adder_behavioral is
--define signal z to represent the sum of a and b

signal z: std_logic_vector (4 downto 0);

--define signal p to represent the corrected sum when z > 9
signal p: std_logic_vector (4 downto 0);

--define a signal m and let signal m= port c, use m in the calculation instead of c
signal m: std_logic;

signal six: std_logic_vector (4 downto 0);

begin

z <= std_logic_vector(unsigned ('0' & a) + unsigned('0' & b));

six <= "00110";
p <= std_logic_vector(unsigned (z) + unsigned(six));

c <= '1' when z > "01001" else '0';
--let signal m = signal c
m <= '1' when z > "01001" else '0';

s <= z(3 downto 0) when (m = '0') else 
     p(3 downto 0);

end behavioral;