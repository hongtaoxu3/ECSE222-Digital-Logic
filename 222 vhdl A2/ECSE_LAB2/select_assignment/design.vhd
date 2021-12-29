library IEEE;

use IEEE.STD_logic_1164.all;

entity select_assignment is Port(x1,x2,x3,x4:in std_logic;
f1,f2:out std_logic);

end select_assignment; 

architecture Behavioral of select_assignment is 
signal s:std_logic_vector(1 downto 0); 
signal x:std_logic_vector(3 downto 0);
begin
  
x<= x1&x2&x3&x4;
  
with x SELECT

s <= "10" when "0000"|"0001"|"0100"|"0101", 

"00" when "0110"|"1000"|"1001"|"1100"|"1101"|"1110", 
  
"01" when "0010"|"0011"|"1010"|"1011", 

"11" when others;
  
f1<=s(1);

f2<=s(0);
  
end Behavioral;