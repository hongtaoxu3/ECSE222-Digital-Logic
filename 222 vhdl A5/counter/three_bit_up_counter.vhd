library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity three_bit_up_counter is
    Port ( enable   : in std_logic;
           reset    : in std_logic;
           clk      : in std_logic;
           count    : out std_logic_vector(2 downto 0));
end three_bit_up_counter ;

architecture description of three_bit_up_counter is

--define a signal count_signal, and let the output count <= count_signal;
signal count_signal: integer range 0 to 7;

begin
--use a process block
 process (reset, clk)
 begin
 --when reset signal is low, then output is 0
 IF (reset = '0') then 
   count_signal <= 0;
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (enable = '1') then
     --use another if statement to check if the current count reaches 7
     if (count_signal = 7) then
       count_signal<= 0;
     else
       count_signal <= count_signal + 1;
     end if;
   end if;
 end if;
end process;

--Now let the output count equal to value of count_signal.
count <= std_logic_vector( to_unsigned(count_signal, 3));

end description;
