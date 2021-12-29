library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity rca_behavioral is
port  ( A: in std_logic_vector (3 downto 0) ;
        B: in std_logic_vector (3 downto 0) ;
        S: out std_logic_vector (4 downto 0) );
end rca_behavioral ;

architecture behavioral of rca_behavioral is

begin
--To use the + operator we must first define std_logic_vector a and b to be unsigned vector.
--Then an extra bit of 0 is added infront of a and b so that they now have the same number of bits with s

s <= std_logic_vector(unsigned ('0' & a) + unsigned('0' & b));


end behavioral;