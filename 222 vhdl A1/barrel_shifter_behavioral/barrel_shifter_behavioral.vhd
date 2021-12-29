library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity barrel_shifter_behavioral is
Port (X       : in std_logic_vector (3 downto 0) ;
      sel     : in std_logic_vector (1 downto 0) ;
      Y       : out std_logic_vector (3 downto 0) );
end barrel_shifter_behavioral ;

architecture behavioral of barrel_shifter_behavioral is
 --use vhdl select statement
begin 
 with sel select
Y <=
  
  --when sel <="00", the barrel shifter doesn't shift
  --so output y equal to input x
x when std_logic_vector(to_unsigned(0,2)),
  
  --when sel <="01", the barrel shifter shifts x(2) to the 
  --position y(3), x(1) to y(2), x(0) to y(1), x(3) to y(0)
X(2 downto 0)&X(3) when std_logic_vector(to_unsigned(1,2)),
  
  --when sel <="10", the barrel shifter shifts x(1) to the 
  --position y(3), x(0) to y(2), x(3) to y(1), x(2) to y(0)
X(1 downto 0)&X(3 downto 2)   when std_logic_vector(to_unsigned(2,2)),
  
  --when sel <="11", the barrel shifter shifts x(0) to the 
  --position y(3), x(3) to y(2), x(2) to y(1), x(1) to y(0)
X(0)&X(3 downto 1)      when std_logic_vector(to_unsigned(3,2)),

 "0000" when others;
       
END behavioral;
 