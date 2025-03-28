library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity xor2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end xor2;

architecture structural of xor2 is

begin

  output <= input2 xor input1;

end structural;