library IEEE;

use IEEE.STD_logic_1164.all;

entity when_assignment is

Port(x1,x2,x3,x4:in std_logic; 
f1,f2:out std_logic);

end when_assignment;

architecture Behavioral of when_assignment is 

signal s:std_logic_vector(1 downto 0); 

signal x:std_logic_vector(3 downto 0);

begin

  x<=x1 & x2 & x3 & x4;

s <= "10" when x= "0000" else
"10" when x="0001" else
"10" when x="0100" else
"10" when x="0101" else

"00" when x="0110" else
"00" when x="1000" else
"00" when x="1001" else
"00" when x="1100" else
"00" when x="1101" else
"00" when x="1110" else

"01" when x="0010" else
"01" when x="0011" else
"01" when x="1010" else
"01" when x="1011" else

"11" ;

f1<=s(1);

f2<=s(0);

end Behavioral;