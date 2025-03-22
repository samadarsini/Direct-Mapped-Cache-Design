library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity decoder_2x4_test is

end decoder_2x4_test;

architecture test of decoder_2x4_test is

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

for decoder_2x4_1 : decoder_2x4 use entity work.decoder_2x4(structural);
   signal a1, a0, e, y0, y1, y2, y3: std_logic;
   signal clock : std_logic;

begin

decoder_2x4_1 : decoder_2x4 port map (a1, a0, e, y0, y1, y2, y3);

clk : process
   begin  -- process clk

    clock<='0','1' after 5 ns;
    wait for 10 ns;

  end process clk;

io_process: process

  file infile  : text is in "decoder_2x4_in.txt";
  file outfile : text is out "decoder_2x4_out.txt";
  variable a_1, a_0, e_1, y_0, y_1, y_2, y_3: std_logic;
  variable buf : line;

begin

  while not (endfile(infile)) loop


    readline(infile,buf);
    read (buf,a_1);
    a1<=a_1;

    readline(infile,buf);
    read (buf,a_0);
    a0<=a_0;

    readline(infile,buf);
    read (buf,e_1);
    e<=e_1;

    wait until falling_edge(clock);

    y_0:=y0;
    y_1:=y1;
    y_2:=y2;
    y_3:=y3;

    write(buf,y_0);
    writeline(outfile,buf);

    write(buf,y_1);
    writeline(outfile,buf);

    write(buf,y_2);
    writeline(outfile,buf);

    write(buf,y_3);
    writeline(outfile,buf);
  end loop;

end process io_process;

end test;
