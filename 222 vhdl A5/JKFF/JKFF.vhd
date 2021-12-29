library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity jkff is
    Port (clk : in std_logic;
          J   : in std_logic;
          K   : in std_logic;
          Q   : out std_logic);
end jkff ;

architecture description of jkff is
--define a signal t and let Q <= t
signal t: std_logic;
--use a single process block

begin
PROCESS (j, k, clk)
BEGIN

if RISING_EDGE( clk ) then
  --when j and k are both 0, Q(t+1) = Q(t)
  if ( J ='0' AND K = '0') then
      t <= t;
  --when J is 0, K is 1, Q(t+1)=0
  elsif ( J ='0' AND K = '1') then
      t <= '0';
  --when j is 1, k is 0, Q(t+1) = 1
  elsif ( J ='1' AND K = '0') then
      t <= '1';
  --when both J and K are 1, Q(t+1) =NOT Q(t)
  elsif ( J ='1' AND K = '1') then
       t <= NOT (t);
  else
  null;
  end if;
end if;
Q <= t;
end process;
end description;