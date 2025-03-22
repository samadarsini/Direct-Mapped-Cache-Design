library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux4_1 is

port (
	input1	: in std_logic;
	input2	: in std_logic;
        input3	: in std_logic;
	input4	: in std_logic;
	sel1	: in std_logic;
        sel2	: in std_logic;
	output  : out std_logic);
end mux4_1;

architecture structural of mux4_1 is

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

component or2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

for and3_1,and3_2,and3_3,and3_4: and3 use entity work.and3(structural);
for or2_1: or2 use entity work.or2(structural);
for inverter_1: inverter use entity work.inverter(structural);

signal temp1, temp2, temp3, temp4, temp5, temp6,temp7, temp8: std_logic;

begin

inverter_1: inverter port map (sel1,temp1);
inverter_2: inverter port map (sel2,temp2);

and3_1: and3 port map (temp1,temp2,input1,temp3);
and3_2: and3 port map (temp1,sel2,input2,temp4);
and3_3: and3 port map (sel1,temp2,input3,temp5);
and3_4: and3 port map (sel1,sel2,input4,temp6);

or2_1: or2 port map (temp3,temp4,temp7);
or2_2: or2 port map (temp5,temp6,temp8);
or2_3: or2 port map (temp7,temp8,output);

end structural;
