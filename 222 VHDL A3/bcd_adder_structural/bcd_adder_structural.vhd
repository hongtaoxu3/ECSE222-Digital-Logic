library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL ;

entity bcd_adder_structural is
port (    A: in std_logic_vector (3 downto 0);
          B: in std_logic_vector (3 downto 0); 
          S: out std_logic_vector (3 downto 0);
          C: out std_logic); 
end bcd_adder_structural;

architecture structural of bcd_adder_structural is
--define signal carry to represent the carry in the 4-bits RCA
--define signal carry2 to represent the carry in the 2-bits RCA

signal carry: std_logic_vector (3 downto 0);
signal carry2: std_logic_vector (1 downto 0);

--define signal z to represent the uncorrected sum of A and B

signal z: std_logic_vector (3 downto 0);

--define a signal m and let signal m= port c, use m in the calculation instead of c
signal m: std_logic;

begin
--first implement the 4-bits RCA
  --For stage 1
  z(0) <= a(0) XOR b(0);
  carry(0) <= a(0) AND b(0);

  --For stage 2
  z(1) <= a(1) XOR b(1) XOR carry(0);
  carry(1) <= (a(1) AND b(1)) OR (a(1) AND carry(0)) OR  (b(1) AND  carry(0));

  --For stage 3
  z(2) <= a(2) XOR b(2) XOR carry(1);
  carry(2) <= (a(2) AND b(2)) OR (a(2) AND carry(1)) OR (b(2) AND carry(1));

  --For stage 4
  z(3) <= a(3) XOR b(3) XOR carry(2);
  carry(3) <= (a(3) AND b(3)) OR (a(3) AND carry(2)) OR (b(3) AND carry(2));

--finished implementing 4 bits RCA

--C out
c <= carry(3) OR (z(2) AND z(3)) OR (z(1) AND z(3)) ;

--Let signal m = signal c
m <= carry(3) OR (z(2) AND z(3)) OR (z(1) AND z(3)) ;

--Now implement the 2 bits RCA
  --For stage 1
  s(1) <= z(1) XOR (m);
  carry2(0) <= z(1) AND m;
  
  --For stage 2
  s(2) <= m XOR z(2) XOR carry2(0);
  carry2(1) <= (m AND z(2)) OR (m AND carry2(0)) OR (z(2) AND carry2(0));
  
s(3) <= carry2(1) XOR z(3) ;
s(0) <= z(0);

end structural;

