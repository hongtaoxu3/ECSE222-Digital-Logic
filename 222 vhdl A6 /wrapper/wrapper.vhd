—-Wrapper testing version 3 Yutong wang

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity wrapper is
Port  (   reset  : in std_logic ;
          clk    : in std_logic ;
          HEX0   : out std_logic_vector(6 downto 0);
          HEX5   : out std_logic_vector(6 downto 0) );
end wrapper ;

architecture description of wrapper is
signal enable: std_logic;
--First define the signal en_out for the output of clock divider
signal en_out: std_logic;
--Signal for clock divider
signal count: integer range 0 to 9;
signal counter_value : std_logic_vector(3 downto 0);

--For the ROM
signal data: std_logic;
 type rom_type is array (0 to 255) of std_logic;
	signal cnt : std_logic_vector(7 downto 0);
    
    signal sevenSegment_ROM : rom_type := (
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '1',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '0', 
                            '0', 
                            '1', 
                            '1', 
                            '0', 
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '0', 
                            '0', 
                            '0', 
                            '0', 
                            '0', 
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '0', 
                            '0', 
                            '0', 
                            '1',
                            '1', 
                            '1', 
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '1', 
                            '0', 
                            '0', 
                            '1', 
                            '0', 
                            '0', 
                            '1', 
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '1', 
                            '0', 
                            '1', 
                            '0', 
                            '1',
                            '1', 
                            '0', 
                            '0', 
                            '1', 
                            '0', 
                            '0',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '0',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '1',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1',
                            '1',
                            '0',
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '0', 
                            '0', 
                            '0', 
                            '1',
                            '1', 
                            '1', 
                            '1', 
                            '0', 
                            '1', 
                            '1', 
                            '1', 
                            '0', 
                            '0', 
                            '1', 
                            '0', 
                            '0'
);

--For sequence counter

--first implement FSM for out_1
--there are 5 states for detecting '1011'
type state is ( st_one_a, st_one_b, st_one_c, st_one_d, st_one_e);

signal current_state_one, next_state_one: state;

--Then implement FSM for out_2
--there are 5 states for detecting '0010'

type statetwo is ( st_two_a, st_two_b, st_two_c, st_two_d, st_two_e);

signal current_state_two, next_state_two: statetwo;

--then define two signals for the two 3 bits up counter
signal count_signal_one: integer range 0 to 7;
signal count_signal_two: integer range 0 to 7;

signal cnt_1, cnt_2: std_logic_vector(2 downto 0) ;

--Now define the 7 segment decoder input
signal four_bits_input_one: std_logic_vector (3 downto 0);
signal four_bits_input_two: std_logic_vector (3 downto 0);




begin
enable <= '1';
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
--finished clock divider

--implement ROM
process (clk, reset) begin
        if (reset = '0') then
            cnt <= (others=>'0');
        elsif (rising_edge(clk)) then
            if (en_out = '1') then
                cnt <= std_logic_vector(unsigned(cnt) + 1);
            end if;
        end if;
    end process;
    data <= sevenSegment_ROM(to_integer(unsigned(cnt)));
    

--For sequence counter
process (clk, reset, en_out)
 begin
 --when reset signal is low, then output is 0
 IF (reset = '0') then 
   current_state_one <= st_one_a;
   current_state_two <= st_two_a;
   
   
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (en_out = '1') then
   current_state_one <= next_state_one;
   current_state_two <= next_state_two;
   end if;
 end if;
end process;

--Then we use the state map of the 1011 sequence detector
process (current_state_one, data)
 begin
  case (current_state_one) is
  when st_one_a => 
   if (data = '1') then
   --from state a goes to state b
   next_state_one <= st_one_b;
   
   else --remain state a
   next_state_one <= st_one_a;
   end if;
  
  when st_one_b => 
   if (data = '1') then
   --remain state b
   next_state_one <= st_one_b;
   
   else --from state b goes to state c
   next_state_one <= st_one_c;
   end if;
   
  when st_one_c => 
   if (data = '1') then
   --from state c goes to state d
   next_state_one <= st_one_d;
   
   else --from state c goes to state a
   next_state_one <= st_one_a;
   end if;
   
  when st_one_d => 
   if (data = '1') then
   --from state d goes to state e
   next_state_one <= st_one_e;
   
   else --from state d goes to state c
   next_state_one <= st_one_c;
   end if;
   
  when st_one_e => 
   if (data = '1') then
   --from state e goes to state b
   next_state_one <= st_one_b;
   
   else --from state e goes to state c
   next_state_one <= st_one_c;
   end if;
   
  end case;
 end process;
 
--Then we use the state map of the 0010 sequence detector for out_2
process (current_state_two, data)
 begin
  case (current_state_two) is
  when st_two_a => 
   if (data = '1') then
   --remain at state A
   next_state_two <= st_two_a;
   
   else --from state A goes to state B
   next_state_two <= st_two_b;
   end if;
   
  when st_two_b => 
   if (data = '1') then
   --go back to state A
   next_state_two <= st_two_a;
   
   else --from state B goes to state c
   next_state_two <= st_two_c;
   end if;
   
  when st_two_c => 
   if (data = '1') then
   --goes to state D
   next_state_two <= st_two_d;
   
   else --remain at state C
   next_state_two <= st_two_c;
   end if;
   
  when st_two_d => 
   if (data = '1') then
   --goes back to state A
   next_state_two <= st_two_a;
   
   else --from state D goes to state E
   next_state_two <= st_two_e;
   end if;
   
  when st_two_e => 
   if (data = '1') then
   --goes back to state A
   next_state_two <= st_two_a;
   
   else --from state E goes to state C
   next_state_two <= st_two_c;
   end if;
 
 end case;
 end process;
 
 
 
 
 --now connect the output to different states
 process (current_state_one, current_state_two)
 begin
 
 case current_state_one is
 when st_one_e => 
  count_signal_one <= count_signal_one + 1;
 
 when others => 
  count_signal_one <= count_signal_one;
 end case;
 
 case current_state_two is
 when st_two_e => 
  count_signal_two <= count_signal_two + 1;
 
 when others => 
  count_signal_two <= count_signal_two;
 end case;
 
end process;

--Now let the output cnt_1 and cnt_2 equal to value of signal count_signal_one and count_signal_two.
cnt_1 <= std_logic_vector( to_unsigned(count_signal_one, 3));

four_bits_input_one <= "0" & cnt_1;

cnt_2 <= std_logic_vector( to_unsigned(count_signal_two, 3));

four_bits_input_two <= "0" & cnt_2;

-- 7 segment decoder 1
WITH four_bits_input_one SELECT
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
"1111111" WHEN others ; 

-- 7 segment decoder 2
WITH four_bits_input_two SELECT
 HEX5 <=
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
"1111111" WHEN others ;

end description;

 
   
   