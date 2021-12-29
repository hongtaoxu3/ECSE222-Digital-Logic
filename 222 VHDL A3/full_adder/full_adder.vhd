library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
entity full_adder is
  port (a: in std_logic; 
        b: in std_logic;
        c_in: in std_logic; 
        s: out std_logic;
        c_out: out std_logic); 
end full_adder;

architecture structural_full_adder of full_adder is
begin
--From the truth table of the three inputs (a, b, c_in) and --two outputs (s, c_out), we can obtain the k-map and then --derieve the relationalship between inputs signals and ---outputs

s <= a XOR b XOR c_in;

c_out <= (a AND b) OR (a AND c_in) OR (b AND c_in) ;

end structural_full_adder;
