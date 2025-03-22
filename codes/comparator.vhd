library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity comparator is

port (
	tag	: in std_logic_vector(1 downto 0);
        cpu_add : in std_logic_vector(1 downto 0);
	valid	: in std_logic;
	hit_miss: out std_logic);
end comparator;

architecture structural of comparator is

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

component xor2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

for xor2_1,xor2_2: xor2 use entity work.xor2(structural);
for and3_1: and3 use entity work.and3(structural);
for inverter_1,inverter_2: inverter use entity work.inverter(structural);

signal temp1, temp2, temp3, temp4: std_logic;

begin

xor2_1: xor2 port map (tag(0),cpu_add(0),temp1);
xor2_2: xor2 port map (tag(1),cpu_add(1),temp2);

inverter_1: inverter port map (temp1,temp3);
inverter_2: inverter port map (temp2,temp4);

and3_1: and3 port map (valid,temp3,temp4,hit_miss);

end structural;
