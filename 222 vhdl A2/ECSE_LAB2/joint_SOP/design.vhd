library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity joint_SOP is
Port ( x1       : in std_logic ;
       x2       : in std_logic ;
       x3       : in std_logic ;
       x4       : in std_logic ;
       f1       : out std_logic ;
       f2       : out std_logic );
end joint_SOP ;

architecture direct_assignment of joint_SOP is
begin

--Use k-map to obtained the simplified SOP expression for 
--f1 and f2. The work details will be included in the report. 

f1 <= ((NOT x1) AND (NOT x3)) OR (x2 AND x3 AND x4) ;

f2 <= ((NOT x2) AND x4) OR (x4 AND x3) ;

END direct_assignment;