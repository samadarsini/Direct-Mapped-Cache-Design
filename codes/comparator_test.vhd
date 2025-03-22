library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity comparator_test is

end comparator_test;

architecture test of comparator_test is

component comparator
port (
	tag	: in std_logic_vector(1 downto 0);
        cpu_add : in std_logic_vector(1 downto 0);
	valid	: in std_logic;
	hit_miss: out std_logic);
end component;

for comparator_1 : comparator use entity work.comparator(structural);
   signal tag1,cpu_add1: std_logic_vector(1 downto 0);
   signal valid1,hm1: std_logic;
   signal clock : std_logic;

begin

comparator_1 : comparator port map (tag1,cpu_add1,valid1,hm1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

io_process: process

  file infile  : text is in "comparator_in.txt";
  file outfile : text is out "comparator_out.txt";
  variable valid_1,hm_1: std_logic;
  variable tag_1,cpu_add_1: std_logic_vector(1 downto 0);
  variable buf : line;

begin
  while not (endfile(infile)) loop
  
    readline(infile,buf);
    read (buf,tag_1);
    tag1<=tag_1;

    readline(infile,buf);
    read (buf,cpu_add_1);
    cpu_add1<=cpu_add_1;

    readline(infile,buf);
    read (buf,valid_1);
    valid1<=valid_1;

    wait until falling_edge(clock);

    hm_1:=hm1;

    write(buf,hm_1);
    writeline(outfile,buf);
  end loop;

end process io_process;

end test;
