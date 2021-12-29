library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity rca_structural is
port  ( A: in std_logic_vector (3 downto 0) ;
        B: in std_logic_vector (3 downto 0) ;
        S: out std_logic_vector (4 downto 0) );
end rca_structural ;

architecture structural of rca_structural is

--define signal c to represent carry between stages
signal c: std_logic_vector (2 downto 0);
begin

--For stage 1
s(0) <= a(0) XOR b(0);
c(0) <= a(0) AND b(0);

--For stage 2
s(1) <= a(1) XOR b(1) XOR c(0);
c(1) <= (a(1) AND b(1)) OR (a(1) AND c(0)) OR (b(1) AND c(0));

--For stage 3
s(2) <= a(2) XOR b(2) XOR c(1);
c(2) <= (a(2) AND b(2)) OR (a(2) AND c(1)) OR (b(2) AND c(1));

--For stage 4
s(3) <= a(3) XOR b(3) XOR c(2);
s(4) <= (a(3) AND b(3)) OR (a(3) AND c(2)) OR (b(3) AND c(2));

end structural;
