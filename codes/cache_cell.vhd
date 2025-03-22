library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_cell is

port (
	en	: in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic;
	rd_data	: out std_logic);
end cache_cell;

architecture structural of cache_cell is

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

component Dlatch                      
  port ( d     : in  std_logic;
         clk   : in  std_logic;
         q     : out std_logic;
         qbar  : out std_logic); 
end component;

component tx                      
  port ( sel   : in std_logic;
         selnot: in std_logic;
         input : in std_logic;
         output:out std_logic);
end component;

for Dlatch_1: Dlatch use entity work.Dlatch(structural);
for tx_1: tx use entity work.tx(structural);
for and2_1, and2_2: and2 use entity work.and2(structural);
for inverter_1, inverter_2: inverter use entity work.inverter(structural);

signal wr, re, ren, we, temp1, temp2: std_logic;

begin

inverter_1: inverter port map (rd_wrn, wr);

and2_1: and2 port map (en, rd_wrn, re);
and2_2: and2 port map (en, wr, we);

inverter_2: inverter port map (re, ren);

Dlatch_1: Dlatch port map (data_in, we, temp1, temp2);

tx_1: tx port map (re, ren, temp1, rd_data);

end structural;
