library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MUX_behavioral is
Port (A       : in   std_logic;
      B       : in   std_logic;
      S       : in   std_logic;
      Y       : out  std_logic);
end MUX_behavioral ;

architecture Behavioral of MUX_behavioral is 
--describe the response of the outputs to changes of input
begin
    with s select
      Y <= A WHEN '0',
           B WHEN others;
    
end Behavioral;