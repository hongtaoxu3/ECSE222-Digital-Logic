library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX_structural is
Port (A       : in   std_logic;
      B       : in   std_logic;
      S       : in   std_logic;
      Y       : out  std_logic);
end MUX_structural ;

architecture Structural of MUX_structural is  
--Use BooleanFunction to describe the 2-to-1 multiplexer
begin
Y <= (B AND s) OR ((NOT s) AND A) ;
end Structural;


