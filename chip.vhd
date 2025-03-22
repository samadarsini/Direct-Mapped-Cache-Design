library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity chip is
port (
      cpu_add    : in  std_logic_vector(5 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	 : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(5 downto 0));
end chip;

architecture structural of chip is

component valid
port (
         reset    : in  std_logic;
         read_miss: in  std_logic;
	 clk      : in  std_logic;
         valid    : out std_logic;
	 valid_n  : out std_logic);
end component;

component comparator
port (
	tag	: in std_logic_vector(1 downto 0);
        cpu_add : in std_logic_vector(1 downto 0);
	valid	: in std_logic;
	hit_miss: out std_logic);
end component;

component state_machine
port (
      start    : in  std_logic;
      clk      : in  std_logic;
      re_wr    : in  std_logic;
      hit_miss : in  std_logic;
      cpu_add  : in  std_logic_vector(5 downto 0);
      cpu_data : inout  std_logic_vector(7 downto 0);
      reset    : in  std_logic;
      mem_data : in  std_logic_vector(7 downto 0);
      Vdd      : in  std_logic;
      Gnd      : in  std_logic;
      busy     : out std_logic;
      mem_en   : out std_logic;
      mem_add  : out std_logic_vector(5 downto 0);
      stm      : out std_logic_vector(18 downto 0));
end component;

component inverter
  port (
    input    : in  std_logic;
    output   : out std_logic);
end component;

component cpu_add_reg
port (
	cpu_add    : in std_logic_vector(5 downto 0);
	en         : in std_logic;
	mem_add	   : out std_logic_vector(5 downto 0);
        mem_add_bar: out std_logic_vector(5 downto 0));
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

for valid_1: valid use entity work.valid(structural);
for cpu_add_reg_1: cpu_add_reg use entity work.cpu_add_reg(structural);
for inverter_1,inverter_2: inverter use entity work.inverter(structural);
for comparator_1: comparator use entity work.comparator(structural);
for read_hit_1,read_miss_1,write_hit_1,write_miss_1: state_machine use entity work.state_machine(structural);

signal valid1,valid_n,hit_miss,write_miss1,write_hit1,read_miss1,read_hit1: std_logic;
signal dfftag: std_logic_vector(1 downto 0);
signal mem_add_bar: std_logic_vector(5 downto 0);

begin

valid_1: valid port map (reset,read_miss1,clk,valid1,valid_n);

cpu_add_reg_1: cpu_add_reg port map (cpu_add(5 downto 0),start,mem_add(5 downto 0),mem_add_bar(5 downto 0));

inverter_1: inverter port map (mem_add_bar(5),dfftag(1));
inverter_2: inverter port map (mem_add_bar(4),dfftag(0));

comparator_1: comparator port map (dfftag(1 downto 0),cpu_add(5 downto 4),valid1,hit_miss);

decoder_2x4_1: decoder_2x4 port map (cpu_rd_wrn,hit_miss,start,write_miss1,write_hit1,read_miss1,read_hit1);

read_hit_1: state_machine port map (read_hit1,clk,cpu_rd_wrn,hit_miss,cpu_add(5 downto 0),cpu_data(7 downto 0),reset,mem_data(7 downto 0),Vdd,Gnd,busy,mem_en,mem_add(5 downto 0));
read_miss_1: state_machine port map (read_miss1,clk,cpu_rd_wrn,hit_miss,cpu_add(5 downto 0),cpu_data(7 downto 0),reset,mem_data(7 downto 0),Vdd,Gnd,busy,mem_en,mem_add(5 downto 0));
write_hit_1: state_machine port map (write_hit1,clk,cpu_rd_wrn,hit_miss,cpu_add(5 downto 0),cpu_data(7 downto 0),reset,mem_data(7 downto 0),Vdd,Gnd,busy,mem_en,mem_add(5 downto 0));
write_miss_1: state_machine port map (write_miss1,clk,cpu_rd_wrn,hit_miss,cpu_add(5 downto 0),cpu_data(7 downto 0),reset,mem_data(7 downto 0),Vdd,Gnd,busy,mem_en,mem_add(5 downto 0));

end structural;
