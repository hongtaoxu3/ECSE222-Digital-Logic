library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
entity half_adder is
  port (a: in std_logic;
        b: in std_logic;
        s: out std_logic; 
        c: out std_logic);
end half_adder;

architecture structural_half_adder of half_adder is
begin
--The sum can be seen as a XOR gate of inputs a and b
--The carry can be seen as a AND gate of inputs a and b
 s <= a XOR b;
 
 c <= a AND b;
 
end structural_half_adder;