library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity mem_data_reg is

port (
	cpu_data: in std_logic_vector(7 downto 0);
	en      : in std_logic;
	mem_data: out std_logic_vector(7 downto 0));
end mem_data_reg;

architecture structural of mem_data_reg is

component dff                      
  port ( d     : in  std_logic;
         clk   : in  std_logic;
         q     : out std_logic;
         qbar  : out std_logic); 
end component;

for dff_1,dff_2,dff_3,dff_4,dff_5,dff_6,dff_7,dff_8: dff use entity work.dff(structural);

signal temp1, temp2, temp3, temp4,temp5,temp6,temp7,temp8: std_logic;

begin

dff_1: dff port map (cpu_data(0),en,mem_data(0),temp1);
dff_2: dff port map (cpu_data(1),en,mem_data(1),temp2);
dff_3: dff port map (cpu_data(2),en,mem_data(2),temp3);
dff_4: dff port map (cpu_data(3),en,mem_data(3),temp4);
dff_5: dff port map (cpu_data(4),en,mem_data(4),temp5);
dff_6: dff port map (cpu_data(5),en,mem_data(5),temp6);
dff_7: dff port map (cpu_data(6),en,mem_data(6),temp7);
dff_8: dff port map (cpu_data(7),en,mem_data(7),temp8);

end structural;
