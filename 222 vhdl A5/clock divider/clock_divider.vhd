library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_divider is
Port (   enable   : in std_logic;
         reset    : in std_logic;
         clk      : in std_logic;
         en_out   : out std_logic );
end clock_divider ;

architecture description of clock_divider is

--define a signal represent the output of the down counter
--N = 10, so the down counter is a 4 bits , 9 to 0 down counter

signal count: integer range 0 to 9;
signal counter_value : std_logic_vector(3 downto 0);

--now implement the 9 to 0 down counter
begin
--use a process block
 process (reset, clk)
 begin
 --when reset signal is low, then output is 9
 IF (reset = '0') then 
   count <= 9;
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (enable = '1') then
     --use another if statement to check if the current count reaches 0
     if (count = 0) then
       count <= 9;
     else
       count <= count - 1;
     end if;
   end if;
 end if;
end process;

--Then let the output en_out be the NOR of the bits in the counter value

counter_value <= std_logic_vector( to_unsigned(count, 4));

en_out <= not (counter_value(3) or counter_value(2) or counter_value(1) or counter_value(0));

end description;
