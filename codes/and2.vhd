library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity and2 is

  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end and2;

architecture structural of and2 is

begin

  output <= input1 and input2;

end structural;

