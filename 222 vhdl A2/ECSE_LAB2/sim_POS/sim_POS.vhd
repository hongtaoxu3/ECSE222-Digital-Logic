library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sim_POS is
Port ( x1       : in std_logic ;
       x2       : in std_logic ;
       x3       : in std_logic ;
       x4       : in std_logic ;
       f1       : out std_logic ;
       f2       : out std_logic );
end sim_POS ;

architecture direct_assignment of sim_POS is
begin

--Use k-map to obtained the simplified POS expression for 
--f1 and f2. The work details will be included in the report. 

f1 <= ((NOT x1) OR x3) AND ((NOT x3) OR x4) AND (x2 OR (NOT x3)) ;

f2 <= x3 AND ((NOT x2) OR (NOT x3) OR x4) ;

END direct_assignment;
