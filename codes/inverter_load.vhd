library STD;
library IEEE;
use IEEE.std_logic_1164.all;

entity inverter_load is

  port (
    input    : in  std_logic;
    output   : out std_logic);
end inverter_load;

architecture structural of inverter_load is

begin

  output <= not (input);

end structural;
