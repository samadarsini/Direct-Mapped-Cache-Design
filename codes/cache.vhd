library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache is

port (
	en	    : in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic_vector(7 downto 0);
	cpu_add : in std_logic_vector(5 downto 0);
	rd_data	: out std_logic_vector(7 downto 0));
end cache;

architecture structural of cache is

component cc_block
  port (
	en   	: in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic_vector(7 downto 0);
	cpu_add : in std_logic_vector(5 downto 0);
	rd_data	: out std_logic_vector(7 downto 0));	
end component;

component decoder_2x4
  port (
	A1	: in std_logic;
	A0	: in std_logic;
	E	: in std_logic;
	Y0	: out std_logic;
	Y1	: out std_logic;
	Y2	: out std_logic;
	Y3	: out std_logic);
end component;

for decoder_2x4_1: decoder_2x4 use entity work.decoder_2x4(structural);
for cc_block_1,cc_block_2,cc_block_3,cc_block_4: cc_block use entity work.cc_block(structural);

signal temp1, temp2, temp3, temp4: std_logic;

begin

decoder_2x4_1: decoder_2x4 port map (cpu_add(3), cpu_add(2), en, temp1, temp2, temp3, temp4);

cc_block_1: cc_block port map (temp1, rd_wrn, data_in(7 downto 0), cpu_add(5 downto 0), rd_data(7 downto 0));
cc_block_2: cc_block port map (temp2, rd_wrn, data_in(7 downto 0), cpu_add(5 downto 0), rd_data(7 downto 0));
cc_block_3: cc_block port map (temp3, rd_wrn, data_in(7 downto 0), cpu_add(5 downto 0), rd_data(7 downto 0));
cc_block_4: cc_block port map (temp4, rd_wrn, data_in(7 downto 0), cpu_add(5 downto 0), rd_data(7 downto 0));

end structural;
