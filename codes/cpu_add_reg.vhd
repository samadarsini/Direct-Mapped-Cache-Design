library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cpu_add_reg is

port (
	cpu_add    : in std_logic_vector(5 downto 0);
	en         : in std_logic;
	mem_add	   : out std_logic_vector(5 downto 0);
    mem_add_bar: out std_logic_vector(5 downto 0));
end cpu_add_reg;

architecture structural of cpu_add_reg is

component dff                      
  port ( d     : in  std_logic;
         clk   : in  std_logic;
         q     : out std_logic;
         qbar  : out std_logic); 
end component;

for dff_1,dff_2,dff_3,dff_4,dff_5,dff_6: dff use entity work.dff(structural);

begin

dff_1: dff port map (cpu_add(5),en,mem_add(5),mem_add_bar(5));
dff_2: dff port map (cpu_add(4),en,mem_add(4),mem_add_bar(4));
dff_3: dff port map (cpu_add(3),en,mem_add(3),mem_add_bar(3));
dff_4: dff port map (cpu_add(2),en,mem_add(2),mem_add_bar(2));
dff_5: dff port map (cpu_add(1),en,mem_add(1),mem_add_bar(1));
dff_6: dff port map (cpu_add(0),en,mem_add(0),mem_add_bar(0));

end structural;
