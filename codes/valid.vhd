library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity valid is
port (
         reset    : in  std_logic;
         read_miss: in  std_logic;
	 clk      : in  std_logic;
         valid    : out std_logic;
	 valid_n  : out std_logic);
end valid;

architecture structural of valid is

component and2
port (
    input1    : in  std_logic;
	input2    : in  std_logic;
    output    : out std_logic);
end component;

component or2
port (
    input1    : in  std_logic;
    input2    : in  std_logic;
    output    : out std_logic);
end component;

component inverter
port (
    input   : in std_logic;
	output  : out std_logic);
end component;

component Dlatch
  port ( 
    d     : in  std_logic;
    clk   : in  std_logic;
	q     : out std_logic;
	qbar  : out std_logic); 
end component;

for inverter_1: inverter use entity work.inverter(structural);
for and2_1,and2_2: and2 use entity work.and2(structural);
for valid_1: Dlatch use entity work.Dlatch(structural);

signal temp1,temp2,temp3: std_logic;

begin

inverter_1: inverter port map (reset,temp1);
and2_1: and2 port map (read_miss,temp1,temp2);
and2_2: and2 port map (clk,read_miss,temp3);

valid_1: Dlatch port map (temp2,temp3,valid,valid_n);
end structural;
