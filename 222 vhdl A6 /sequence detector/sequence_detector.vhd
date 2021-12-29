—-Testing version 2 Yutong Wang

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
entity sequence_detector is
Port (   seq      : in std_logic ;
         enable   : in std_logic ;
         reset    : in std_logic ;
         clk      : in std_logic ;
         out_1    : out std_logic ; -- generates 1 when "1011" is detected ; otherwise 0.
         out_2    : out std_logic ); -- generates 1 when "0010" is detected ; otherwise 0.
end sequence_detector ;

architecture description of sequence_detector is
--first implement FSM for out_1
--there are 5 states for detecting '1011'
type state is ( st_one_a, st_one_b, st_one_c, st_one_d, st_one_e);

signal current_state_one, next_state_one: state;

--Then implement FSM for out_2
--there are 5 states for detecting '0010'

type statetwo is ( st_two_a, st_two_b, st_two_c, st_two_d, st_two_e);

signal current_state_two, next_state_two: statetwo;

begin
--use a process block

process (clk, reset, enable)
 begin
 --when reset signal is low, then output is 0
 IF (reset = '0') then 
   current_state_one <= st_one_a;
   current_state_two <= st_two_a;
 elsif RISING_EDGE( clk ) then
   --use another if statement for enable signal
   if (enable = '1') then
   current_state_one <= next_state_one;
   current_state_two <= next_state_two;
   end if;
 end if;
end process;

--Then we use the state map of the 1011 sequence detector
process (current_state_one, seq)
 begin
  case (current_state_one) is
  when st_one_a => 
   if (seq = '1') then
   --from state a goes to state b
   next_state_one <= st_one_b;
   
   else --remain state a
   next_state_one <= st_one_a;
   end if;
  
  when st_one_b => 
   if (seq = '1') then
   --remain state b
   next_state_one <= st_one_b;
   
   else --from state b goes to state c
   next_state_one <= st_one_c;
   end if;
   
  when st_one_c => 
   if (seq = '1') then
   --from state c goes to state d
   next_state_one <= st_one_d;
   
   else --from state c goes to state a
   next_state_one <= st_one_a;
   end if;
   
  when st_one_d => 
   if (seq = '1') then
   --from state d goes to state e
   next_state_one <= st_one_e;
   
   else --from state d goes to state c
   next_state_one <= st_one_c;
   end if;
   
  when st_one_e => 
   if (seq = '1') then
   --from state e goes to state b
   next_state_one <= st_one_b;
   
   else --from state e goes to state c
   next_state_one <= st_one_c;
   end if;
   
  end case;
 end process;
 
--Then we use the state map of the 0010 sequence detector for out_2
process (current_state_two, seq)
 begin
  case (current_state_two) is
  when st_two_a => 
   if (seq = '1') then
   --remain at state A
   next_state_two <= st_two_a;
   
   else --from state A goes to state B
   next_state_two <= st_two_b;
   end if;
   
  when st_two_b => 
   if (seq = '1') then
   --go back to state A
   next_state_two <= st_two_a;
   
   else --from state B goes to state c
   next_state_two <= st_two_c;
   end if;
   
  when st_two_c => 
   if (seq = '1') then
   --goes to state D
   next_state_two <= st_two_d;
   
   else --remain at state C
   next_state_two <= st_two_c;
   end if;
   
  when st_two_d => 
   if (seq = '1') then
   --goes back to state A
   next_state_two <= st_two_a;
   
   else --from state D goes to state E
   next_state_two <= st_two_e;
   end if;
   
  when st_two_e => 
   if (seq = '1') then
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
  out_1 <= '1';
 
 when others => 
  out_1 <= '0';
 end case;
 
 case current_state_two is
 when st_two_e => 
  out_2 <= '1';
 
 when others => 
  out_2 <= '0';
 end case;
 
end process;

end description;
 
   
   