library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity can_SOP is
Port ( x1       : in std_logic ;
       x2       : in std_logic ;
       x3       : in std_logic ;
       x4       : in std_logic ;
       f1       : out std_logic ;
       f2       : out std_logic );
end can_SOP ;

architecture direct_assignment of can_SOP is
begin
--Use minterms to find the canonical form of SOP
--f1 = m0 + m1 + m4 + m5 + m7 + m15
--f2 = m2 + m3 + m7 + m10 + m11 + m15

f1 <= ((NOT x1) AND (NOT x2) AND (NOT x3) AND (NOT x4)) OR ((NOT x1) AND (NOT x2) AND (NOT x3) AND x4) OR ((NOT x1) AND x2 AND (NOT x3) AND (NOT x4)) OR ((NOT x1) AND x2 AND (NOT x3) AND x4) OR ((NOT x1) AND x2 AND x3 AND x4) OR (x1 AND x2 AND x3 AND x4) ;

f2 <= ((NOT x1) AND (NOT x2) AND x3 AND (NOT x4)) OR ((NOT x1) AND (NOT x2) AND x3 AND x4) OR ((NOT x1) AND x2 AND x3 AND x4) OR (x1 AND (NOT x2) AND x3 AND (NOT x4)) OR (x1 AND (NOT x2) AND x3 AND x4) OR (x1 AND x2 AND x3 AND x4) ;

END direct_assignment;