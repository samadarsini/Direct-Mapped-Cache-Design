library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity read_miss is
port (
      cpu_add    : in  std_logic_vector(5 downto 0);
      cpu_data   : inout  std_logic_vector(7 downto 0);
      cpu_rd_wrn : in  std_logic;    
      start      : in  std_logic;
      clk        : in  std_logic;
      reset      : in  std_logic;
      mem_data   : in  std_logic_vector(7 downto 0);
      Vdd	     : in  std_logic;
      Gnd        : in  std_logic;
      busy       : out std_logic;
      mem_en     : out std_logic;
      mem_add    : out std_logic_vector(5 downto 0));
end read_miss;

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

for cache_1,cache_2,cache_3,cache_4: cache use entity work.cache(structural);
for Dlatch_1,Dlatch_2,Dlatch_3,Dlatch_4,Dlatch_5,Dlatch_6: Dlatch use entity work.Dlatch(structural);
for enable,shift1,shift2,shift3,shift4,shift5,shift6,shift7,shift8,shift9,shift10,shift11,shift12,shift13,shift14,shift15,shift16,shift17,shift18,shift19: dff use entity work.dff(structural);
for and2_1,and2_2,and2_3,and2_4,and2_5,and2_6,and2_7,and2_8,and2_9,and2_10: and2 use entity work.and2(structural);
for and2_11,and2_12,and2_13,and2_14,and2_15,and2_16,and2_17,and2_18,and2_19: and2 use entity work.and2(structural);

signal st1,st1n,st2,st2n,st3,st3n,enable1,en,enn,temp1,temp2,temp3,temp4,temp5,temp6: std_logic;
signal st4,st4n,st5,st5n,st6,st6n,st7,st7n,st8,st8n,st9,st9n,s10,s10n,st10,st10n,st11,st11n,st12,st12n: std_logic;
signal st13,st13n,st14,st14n,st15,st15n,st16,st16n,st17,st17n,st18,st18n,st19,st19n,st20,st20n,st21,st21n,b1,b2,dfftag1,dfftag2,hit_miss: std_logic;
signal mem_add_bar: std_logic_vector(5 downto 0);

begin

shift1: dff port map (start,clk,st1,st1n);
shift2: dff port map (st1,clk,st2,st2n);

Dlatch_1: Dlatch port map (cpu_add(5),en,mem_add(5),temp1);
Dlatch_2: Dlatch port map (cpu_add(4),en,mem_add(4),temp2);
Dlatch_3: Dlatch port map (cpu_add(3),en,mem_add(3),temp3);
Dlatch_4: Dlatch port map (cpu_add(2),en,mem_add(2),temp4);
Dlatch_5: Dlatch port map (cpu_add(1),en,mem_add(1),temp5);
Dlatch_6: Dlatch port map (cpu_add(0),en,mem_add(0),temp6);

shift3: dff port map (st2,clk,st3,st3n);
shift4: dff port map (st3,clk,st4,st4n);
shift5: dff port map (st4,clk,st5,st5n);
shift6: dff port map (st5,clk,st6,st6n);
shift7: dff port map (st6,clk,st7,st7n);
shift8: dff port map (st7,clk,st8,st8n);
shift9: dff port map (st8,clk,st9,st9n);
shift10: dff port map (st9,clk,s10,s10n);
shift11: dff port map (s10,clk,st11,st11n);

shift12: dff port map (st11,clk,st12,st12n);
cache_1: cache port map (st12,cpu_rd_wrn,mem_data(7 downto 0),cpu_add(5 downto 0),cpu_data(7 downto 0)); 
shift13: dff port map (st12,clk,st13,st13n);

shift14: dff port map (st13,clk,st14,st14n);
cache_2: cache port map (st14,cpu_rd_wrn,mem_data(7 downto 0),cpu_add(5 downto 0),cpu_data(7 downto 0)); 
shift15: dff port map (st14,clk,st15,st15n);

shift16: dff port map (st15,clk,st16,st16n);
cache_3: cache port map (st16,cpu_rd_wrn,mem_data(7 downto 0),cpu_add(5 downto 0),cpu_data(7 downto 0)); 
shift17: dff port map (st16,clk,st17,st17n);

shift18: dff port map (st17,clk,st18,st18n);
cache_4: cache port map (st18,cpu_rd_wrn,mem_data(7 downto 0),cpu_add(5 downto 0),cpu_data(7 downto 0)); 
shift19: dff port map (st18,clk,st19,st19n);

end structural;
