library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decoder_2x4 is

port (
	A1	: in std_logic;
	A0	: in std_logic;
	E	: in std_logic;
	Y0	: out std_logic;
	Y1	: out std_logic;
	Y2	: out std_logic;
	Y3	: out std_logic);
end decoder_2x4;

architecture structural of decoder_2x4 is

component inverter
  port (
    input    : in  std_logic;
    output   : out std_logic);
end component;

component and3
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    output   : out std_logic);
end component;

for inverter_1, inverter_2: inverter use entity work.inverter(structural);
for and3_1, and3_2,and3_3, and3_4: and3 use entity work.and3(structural);

signal temp1, temp2: std_logic;

begin

inverter_1: inverter port map (A1, temp1);
inverter_2: inverter port map (A0, temp2);

and3_1: and3 port map (temp1, temp2, E, Y0);
and3_2: and3 port map (temp1, A0, E, Y1);
and3_3: and3 port map (A1, temp2, E, Y2);
and3_4: and3 port map (A1, A0, E, Y3);

end structural;
