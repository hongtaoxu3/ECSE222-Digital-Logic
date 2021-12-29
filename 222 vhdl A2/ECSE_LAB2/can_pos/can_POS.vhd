library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity can_POS is
Port ( x1       : in std_logic ;
       x2       : in std_logic ;
       x3       : in std_logic ;
       x4       : in std_logic ;
       f1       : out std_logic ;
       f2       : out std_logic );
end can_POS ;

architecture direct_assignment of can_POS is
begin
--Use Maxterms to find the canonical form of POS
--f1 = M2 * M3 * M6 * M8 * M9 * M10 * M11 * M12 * M13 * M14
--f2 = M0 * M1 * M4 * M5 * M6 * M8 * M9 * M12 * M13 * M14

f1 <= (x1 OR x2 OR (NOT x3) OR x4) AND (x1 OR x2 OR (NOT x3) OR (NOT x4)) AND (x1 OR (NOT x2) OR (NOT x3) OR x4) AND ((NOT x1) OR x2 OR x3 OR x4) AND ((NOT x1) OR x2 OR x3 OR (NOT x4)) AND ((NOT x1) OR x2 OR (NOT x3) OR x4) AND ((NOT x1) OR x2 OR (NOT x3) OR (NOT x4)) AND ((NOT x1) OR (NOT x2) OR x3 OR x4) AND ((NOT x1) OR (NOT x2) OR x3 OR (NOT x4)) AND ((NOT x1) OR (NOT x2) OR (NOT x3) OR x4) ;

f2 <= (x1 OR x2 OR x3 OR x4) AND (x1 OR x2 OR x3 OR (NOT x4)) AND (x1 OR (NOT x2) OR x3 OR x4) AND (x1 OR (NOT x2) OR x3 OR (NOT x4)) AND (x1 OR (NOT x2) OR (NOT x3) OR x4) AND ((NOT x1) OR x2 OR x3 OR x4) AND ((NOT x1) OR x2 OR x3 OR (NOT x4)) AND ((NOT x1) OR (NOT x2) OR x3 OR x4) AND ((NOT x1) OR (NOT x2) OR x3 OR (NOT x4)) AND ((NOT x1) OR (NOT x2) OR (NOT x3) OR x4) ;

END direct_assignment;