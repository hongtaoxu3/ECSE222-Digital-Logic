library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity barrel_shifter_structural is
Port (X       : in std_logic_vector (3 downto 0) ;
      sel     : in std_logic_vector (1 downto 0) ;
      Y       : out std_logic_vector (3 downto 0) );
end barrel_shifter_structural ;

architecture Structural of barrel_shifter_structural is
 signal sig: std_logic_vector (3 downto 0);
 -- sig represent the outputs signals from MUX layer sel(1) 
 -- sig are the input signals to MUX layer sel(0)

BEGIN
sig(0) <= (x(2) AND sel(1) ) OR ((NOT sel(1)) AND x(0)) ;
sig(1) <= (x(3) AND sel(1) ) OR ((NOT sel(1)) AND x(1)) ;
sig(2) <= (x(0) AND sel(1) ) OR ((NOT sel(1)) AND x(2)) ;
sig(3) <= (x(1) AND sel(1) ) OR ((NOT sel(1)) AND x(3)) ;

Y(0) <= (sig(3) AND sel(0)) OR ((NOT sel(0)) AND sig(0)) ;
Y(1) <= (sig(0) AND sel(0)) OR ((NOT sel(0)) AND sig(1)) ;
Y(2) <= (sig(1) AND sel(0)) OR ((NOT sel(0)) AND sig(2)) ;
Y(3) <= (sig(2) AND sel(0)) OR ((NOT sel(0)) AND sig(3)) ;

END Structural ;