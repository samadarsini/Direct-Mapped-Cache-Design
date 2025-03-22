library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_h_m_test is

end state_machine_h_m_test;

architecture test of state_machine_h_m_test is

component state_machine_h_m
port (
      start    : in  std_logic;
      clk      : in  std_logic;
      re_wr    : in  std_logic;
      hit_miss : in  std_logic;
      stm      : out std_logic_vector(18 downto 0));
end component;

for state_machine_h_m_1 : state_machine_h_m use entity work.state_machine_h_m(structural);
   signal start1,clk1,re_wr1,hit_miss1: std_logic;
   signal stm1: std_logic_vector(18 downto 0);
   signal clock : std_logic;

signal clk_count: integer:=0;

begin

clk1 <= clock;
state_machine_h_m_1 : state_machine_h_m port map (start1,clk1,re_wr1,hit_miss1,stm1);

  clking : process
  begin
    clock<= '0', '1' after 5 ns;
    wait for 10 ns;
  end process clking;

io_process: process
  file infile  : text is in "state_machine_h_m_in.txt";
  file outfile : text is out "state_machine_h_m_out.txt";
  variable start_1,clk_1,re_wr_1,hit_miss_1: std_logic;
  variable stm_1: std_logic_vector(18 downto 0);
  variable buf : line;

begin
  while not (endfile(infile)) loop
  
    readline(infile,buf);
    read (buf,start_1);
    start1<=start_1;

    readline(infile,buf);
    read (buf,re_wr_1);
    re_wr1<=re_wr_1;

    readline(infile,buf);
    read (buf,hit_miss_1);
    hit_miss1<=hit_miss_1;

    wait until falling_edge(clock);

    stm_1:=stm1;

    write(buf,stm_1);
    writeline(outfile,buf);
  end loop;

end process io_process;

end test;
