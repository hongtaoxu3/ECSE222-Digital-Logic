library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity wrapper is
Port   ( enable  : in std_logic ;
         reset   : in std_logic ;
         clk     : in std_logic ;
         HEX0    : out std_logic_vector(6 downto 0));
end wrapper ;

architecture description of wrapper is

--signals used for clock divider
--the output of clock divider
signal en_out: std_logic;
--represent the output of down counter
signal down_counter: integer range 0 to 9;
signal down_counter_value : std_logic_vector(3 downto 0);

--signals used in the counter
--define a signal to represent the output of the counter
signal count: std_logic_vector(2 downto 0) ;
signal count_signal: integer range 0 to 7;
--define a signal which adds a zero in front of signal count
signal four_bits_count:std_logic_vector(3 downto 0) ;

begin
--first implement the clock divider
--use a process block
 process (reset, clk)
 begin
 --when reset signal is low, then output is 9
 IF (reset = '0') then 
   down_counter <= 9;
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (enable = '1') then
     --use another if statement to check if the current count reaches 0
     if (down_counter = 0) then
       down_counter <= 9;
     else
       down_counter <= down_counter - 1;
     end if;
   end if;
 end if;
end process;

--Then let the output en_out be the NOR of the bits in the counter value

down_counter_value <= std_logic_vector( to_unsigned(down_counter, 4));

en_out <= not (down_counter_value(3) or down_counter_value(2) or down_counter_value(1) or down_counter_value(0));

--Now implement the counter with en_out signal as enable
--use a process block
 process (reset, clk)
 begin
 --when reset signal is low, then output is 0
 IF (reset = '0') then 
   count_signal <= 0;
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (en_out = '1') then
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
four_bits_count <= "0" & count;

--Now implement the 7 segment decoder

WITH four_bits_count SELECT
 HEX0 <=
"1000000" WHEN "0000", -- 0
"1111001" WHEN "0001", -- 1
"0100100" WHEN "0010", -- 2
"0110000" WHEN "0011", -- 3
"0011001" WHEN "0100", -- 4
"0010010" WHEN "0101", -- 5
"0000010" WHEN "0110", -- 6
"1111000" WHEN "0111", -- 7
"0000000" WHEN "1000", -- 8
"0010000" WHEN "1001", -- 9
"1111111" WHEN others;

end description;
