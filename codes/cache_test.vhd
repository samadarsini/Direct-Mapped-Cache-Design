library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cache_test is

end cache_test;

architecture test of cache_test is

component cache
port (
	en	    : in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic_vector(7 downto 0);
	cpu_add : in std_logic_vector(5 downto 0);
	rd_data	: out std_logic_vector(7 downto 0));
end component;

for cache_1 : cache use entity work.cache(structural);
   signal en1, rw1: std_logic;
   signal din1, rdd1: std_logic_vector(7 downto 0);
   signal cpua1: std_logic_vector(5 downto 0);
   signal clock : std_logic;

begin
cache_1 : cache port map (en1, rw1, din1, cpua1, rdd1);

clk : process
   begin  -- process clk
    clock<='0','1' after 5 ns;
    wait for 10 ns;
  end process clk;

io_process: process
  file infile  : text is in "cache_in.txt";
  file outfile : text is out "cache_out.txt";
  variable en_1, rw_1: std_logic;
  variable din_1, rdd_1: std_logic_vector(7 downto 0);
  variable cpua_1: std_logic_vector(5 downto 0);
  variable buf : line;

begin
  while not (endfile(infile)) loop
  
    readline(infile,buf);
    read (buf,en_1);
    en1<=en_1;

    readline(infile,buf);
    read (buf,rw_1);
    rw1<=rw_1;

    readline(infile,buf);
    read (buf,din_1);
    din1<=din_1;

    readline(infile,buf);
    read (buf,cpua_1);
    cpua1<=cpua_1;

    wait until falling_edge(clock);

    rdd_1:=rdd1;

    write(buf,rdd_1);
    writeline(outfile,buf);
  end loop;

end process io_process;

end test;