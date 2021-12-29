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
--the process begin loop 
begin
process (A,B)
begin

--first of all, find out the situations where overflow happens, 
--when B=1111, then plus one would be out of space 
if B="1111" then
AgtBplusOne<='0';AgteBplusOne<='0';AltBplusOne<='0';
AlteBplusOne<='0';AeqBplusOne<='0';
Overflow <= '1';

--those are the situation where does not have overflow 
else 
--this is when A = B+1
   if A = STD_LOGIC_VECTOR(unsigned(B)+1) then
        AeqBplusOne<='1';
   else 
        AeqBplusOne<='0';
   end if;
   --this is when A larger and equal than B+1
    
    if A >= STD_LOGIC_VECTOR(unsigned(B)+1) then 
    AgteBplusOne<='1';
else 
    AgteBplusOne<='0';
end if;
   
   --this is when A larger than B+1
    
    if A > STD_LOGIC_VECTOR(unsigned(B)+1) then 
    AgtBplusOne<='1'; 
    else 
 AgtBplusOne<='0';
end if;
    
    --this is when A smaller and equal than B+1
    
    if A <= STD_LOGIC_VECTOR(unsigned(B)+1) then 
AlteBplusOne<='1';
else 
AlteBplusOne<='0';
end if;
    -- this is when A smaller than B+!
    if A < STD_LOGIC_VECTOR(unsigned(B)+1) then 
 AltBplusOne<='1';
else 
AltBplusOne<='0';
end if;
    --covered all five cases and indicate that overflow is 0
    overflow <= '0';
    

end if;
end process;
  
end architecture;
