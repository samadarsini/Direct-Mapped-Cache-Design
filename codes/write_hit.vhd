library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity write_hit is
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
end write_hit;

architecture structural of read_miss is

component cache
port (
	en	: in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic_vector(7 downto 0);
	cpu_add : in std_logic_vector(5 downto 0);
	rd_data	: out std_logic_vector(7 downto 0));
end component;

component dff
  port ( d   : in  std_logic;
         clk : in  std_logic;
         q   : out std_logic;
         qbar: out std_logic); 
end component;

component Dlatch                     
  port ( d     : in  std_logic;
         clk   : in  std_logic;
         q     : out std_logic;
         qbar  : out std_logic); 
end component;

component xor2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

component mux2_1
port (
	input1	: in std_logic;
	input2	: in std_logic;
	sel1	: in std_logic;
	output  : out std_logic);
end component;

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
        input    : in  std_logic;
        output    : out std_logic);
end component;

component comparator
port (
	tag1	: in std_logic;
	tag2	: in std_logic;
        cpu_add1: in std_logic;
        cpu_add2: in std_logic;
	valid	: in std_logic;
	hit_miss: out std_logic);
end component;

component cpu_add_reg
port (
	cpu_add    : in std_logic_vector(5 downto 0);
	en         : in std_logic;
	mem_add	   : out std_logic_vector(5 downto 0);
        mem_add_bar: out std_logic_vector(5 downto 0));
end component;

for shift1,shift2,shift3: dff use entity work.dff(structural);

signal st1,st1n,st2,st2n,st3,st3n: std_logic;

begin

shift1: dff port map (start,clk,st1,st1n);
shift2: dff port map (st1,clk,st2,st2n);
shift3: dff port map (st2,clk,st3,st3n);

end structural;
