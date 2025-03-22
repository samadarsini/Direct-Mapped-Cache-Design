library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mux2_1 is

port (
	input1	: in std_logic;
	input2	: in std_logic;
	sel1	: in std_logic;
	output  : out std_logic);
end mux2_1;

architecture structural of mux2_1 is

component inverter
  port (
    input    : in  std_logic;
    output   : out std_logic);
end component;

component and2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

component or2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

for and2_1,and2_2: and2 use entity work.and2(structural);
for or2_1: or2 use entity work.or2(structural);
for inverter_1: inverter use entity work.inverter(structural);

signal temp1, temp2, temp3: std_logic;

begin

inverter_1: inverter port map (sel1,temp1);

and2_1: and2 port map (input1,temp1,temp2);
and2_2: and2 port map (input2,sel1,temp3);

or2_1: or2 port map (temp2,temp3,output);

end structural;
