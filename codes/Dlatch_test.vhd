library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity Dlatch_test is

end Dlatch_test;

architecture test of Dlatch_test is

component Dlatch

port ( d   : in  std_logic;
       clk : in  std_logic;
       q   : out std_logic;
       qbar: out std_logic);
end component;

for Dlatch_1 : Dlatch use entity work.Dlatch(structural);
   signal d1, clk1, q1, qbar1: std_logic;
   signal clock : std_logic;

begin

Dlatch_1 : Dlatch port map (d1, clk1, q1, qbar1);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

io_process: process

  file infile  : text is in "Dlatch_in.txt";
  file outfile : text is out "Dlatch_out.txt";
  variable d_1, clk_1, q_1, qbar_1: std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,d_1);
    d1<=d_1;

    readline(infile,buf);
    read (buf,clk_1);
    clk1<=clk_1;

    wait until falling_edge(clock);

    q_1:=q1;
    qbar_1:=qbar1;

    write(buf,q_1);
    writeline(outfile,buf);

    write(buf,qbar_1);
    writeline(outfile,buf);

  end loop;

end process io_process;

end test;
