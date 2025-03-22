library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity tx_test is

end tx_test;

architecture test of tx_test is

component tx

port ( sel   : in std_logic;
       selnot: in std_logic;
       input : in std_logic;
       output:out std_logic);
end component;

for tx_1 : tx use entity work.tx(structural);
   signal sel1, selbar1, ip1, op1: std_logic;
   signal clock : std_logic;

begin

tx_1 : tx port map (sel1, selbar1, ip1, op1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

io_process: process

  file infile  : text is in "tx_in.txt";
  file outfile : text is out "tx_out.txt";
  variable sel_1, selbar_1, ip_1, op_1: std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,sel_1);
    sel1<=sel_1;

    readline(infile,buf);
    read (buf,selbar_1);
    selbar1<=selbar_1;

    readline(infile,buf);
    read (buf,ip_1);
    ip1<=ip_1;

    wait until falling_edge(clock);

    op_1:=op1;

    write(buf,op_1);
    writeline(outfile,buf);

  end loop;

end process io_process;

end test;
