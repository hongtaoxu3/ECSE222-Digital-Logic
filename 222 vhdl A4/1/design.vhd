library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity four_bit_comparator is
port ( A,B : in STD_LOGIC_VECTOR (3 downto 0);
AgtBplusOne : out STD_LOGIC;
AgteBplusOne : out STD_LOGIC;
AltBplusOne : out STD_LOGIC;
AlteBplusOne : out STD_LOGIC;
AeqBplusOne : out STD_LOGIC;
Overflow : out STD_LOGIC);
end four_bit_comparator;

architecture behavioral of four_bit_comparator is

begin
process (A,B)
begin

if B="1111" then
AgtBplusOne<='0';AgteBplusOne<='0';AltBplusOne<='0';
AlteBplusOne<='0';AeqBplusOne<='0';
Overflow <= '1';

else 
   if A = STD_LOGIC_VECTOR(unsigned(B)+1) then
        AeqBplusOne<='1';
   else 
        AeqBplusOne<='0';
   end if;
    
    if A >= STD_LOGIC_VECTOR(unsigned(B)+1) then 
    AgteBplusOne<='1';
else 
    AgteBplusOne<='0';
end if;
    
    
    if A > STD_LOGIC_VECTOR(unsigned(B)+1) then 
    AgtBplusOne<='1'; 
    else 
 AgtBplusOne<='0';
end if;
    
    
    if A <= STD_LOGIC_VECTOR(unsigned(B)+1) then 
AlteBplusOne<='1';
else 
AlteBplusOne<='0';
end if;
    
    if A < STD_LOGIC_VECTOR(unsigned(B)+1) then 
 AltBplusOne<='1';
else 
AltBplusOne<='0';
end if;
    
    overflow <= '0';
    

end if;
end process;
  
end architecture;
