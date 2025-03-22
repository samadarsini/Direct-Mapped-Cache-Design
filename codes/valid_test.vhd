library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity valid_test is

end valid_test;

architecture test of valid_test is

component valid
port (
         reset    : in  std_logic;
         read_miss: in  std_logic;
	 clk      : in  std_logic;
         valid    : out std_logic;
	 valid_n  : out std_logic);
end component;

for valid_1 : valid use entity work.valid(structural);
   signal reset1,rm1,clk1,val1,valn1: std_logic;
   signal clock : std_logic;
signal clk_count: integer:=0;
begin

  clk1 <= clock;



valid_1 : valid port map (reset1,rm1,clk1,val1,valn1);

  clking : process
  begin
    clock<= '0', '1' after 5 ns;
    wait for 10 ns;
  end process clking;

io_process: process
  file infile  : text is in "valid_in.txt";
  file outfile : text is out "valid_out.txt";
  variable reset_1,rm_1,clk_1,val_1,valn_1: std_logic;
  variable buf : line;

begin
  while not (endfile(infile)) loop
  
    readline(infile,buf);
    read (buf,reset_1);
    reset1<=reset_1;

    readline(infile,buf);
    read (buf,rm_1);
    rm1<=rm_1;

    wait until falling_edge(clock);

    val_1:=val1;

    write(buf,val_1);
    writeline(outfile,buf);
  end loop;

end process io_process;

end test;
