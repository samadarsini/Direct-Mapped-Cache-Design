library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity state_machine_h_m is
port (
      start    : in  std_logic;
      clk      : in  std_logic;
      re_wr    : in  std_logic;
      hit_miss : in  std_logic;
      stm      : out std_logic_vector(18 downto 0));
end state_machine_h_m;

architecture structural of state_machine_h_m is

component dff
  port ( 
        d     : in  std_logic;
        clk   : in  std_logic;
	q     : out std_logic;
	qbar  : out std_logic); 
end component;

component inverter
  port (
    input    : in  std_logic;
    output   : out std_logic);
end component;

component and3
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    input3   : in  std_logic;
    output   : out std_logic);
end component;

component and2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

component or2
  port (
    input1   : in  std_logic;
    input2   : in  std_logic;
    output   : out std_logic);
end component;

for shift00,shift01,shift02,shift03,shift04,shift05,shift06: dff use entity work.dff(structural);
for shift07,shift08,shift09,shift10,shift11,shift12: dff use entity work.dff(structural);
for shift13,shift14,shift15,shift16,shift17,shift18: dff use entity work.dff(structural);

for inverter_1,inverter_2,inverter_01,inverter_02,inverter_3,inverter_4,inverter_5,inverter_6: inverter use entity work.inverter(structural);
for inverter_7,inverter_8,inverter_9,inverter_10: inverter use entity work.inverter(structural);
for inverter_11,inverter_12,inverter_13,inverter_14: inverter use entity work.inverter(structural);
for inverter_15,inverter_16,inverter_17,inverter_18: inverter use entity work.inverter(structural);
for and2_1: and2 use entity work.and2(structural);
for or2_1: or2 use entity work.or2(structural);
for and3_1,and3_2,and3_3,and3_4,and3_5,and3_6,and3_7,and3_8: and3 use entity work.and3(structural);
for and3_9,and3_10,and3_11,and3_12,and3_13,and3_14,and3_15,and3_16: and3 use entity work.and3(structural);

signal stm0,stm1,stm2,stm3,stm4,stm5,stm6,stm7,stm8,stm9,stm10: std_logic;
signal stm11,stm12,stm13,stm14,stm15,stm16,stm17: std_logic;
signal stmn0,stmn1,stmn2,stmn3,stmn4,stmn5,stmn6,stmn7,stmn8,stmn9,stmn10: std_logic;
signal stmn11,stmn12,stmn13,stmn14,stmn15,stmn16,stmn17,stmn18: std_logic;
signal re_wr_bar, h_m_bar: std_logic;
signal temp1,temp2,temp3,temp4,temp5,temp6,temp7,temp8,temp9: std_logic;
signal temp10,temp11,temp12,temp13,temp14,temp15,temp16,temp17,temp18: std_logic;

begin

inverter_01: inverter port map (re_wr,re_wr_bar);
inverter_02: inverter port map (hit_miss,h_m_bar);

shift00: dff port map (start,clk,stm(0),stmn0);
inverter_1: inverter port map (stmn0,stm0);

shift01: dff port map (stm0,clk,stm(1),stmn1);
inverter_2: inverter port map (stmn1,stm1);
or2_1: or2 port map (re_wr_bar,h_m_bar,temp1);
and2_1: and2 port map (temp1,stm1,temp2);

shift02: dff port map (temp2,clk,stm(2),stmn2);
inverter_3: inverter port map (stmn2,stm2);
and3_1: and3 port map (stm2,re_wr,h_m_bar,temp3);

shift03: dff port map (temp3,clk,stm(3),stmn3);
inverter_4: inverter port map (stmn3,stm3);
and3_2: and3 port map (stm3,re_wr,h_m_bar,temp4);

shift04: dff port map (temp4,clk,stm(4),stmn4);
inverter_5: inverter port map (stmn4,stm4);
and3_3: and3 port map (stm4,re_wr,h_m_bar,temp5);

shift05: dff port map (temp5,clk,stm(5),stmn5);
inverter_6: inverter port map (stmn5,stm5);
and3_4: and3 port map (stm5,re_wr,h_m_bar,temp6);

shift06: dff port map (temp6,clk,stm(6),stmn6);
inverter_7: inverter port map (stmn6,stm6);
and3_5: and3 port map (stm6,re_wr,h_m_bar,temp7);

shift07: dff port map (temp7,clk,stm(7),stmn7);
inverter_8: inverter port map (stmn7,stm7);
and3_6: and3 port map (stm7,re_wr,h_m_bar,temp8);

shift08: dff port map (temp8,clk,stm(8),stmn8);
inverter_9: inverter port map (stmn8,stm8);
and3_7: and3 port map (stm8,re_wr,h_m_bar,temp9);

shift09: dff port map (temp9,clk,stm(9),stmn9);
inverter_10: inverter port map (stmn9,stm9);
and3_8: and3 port map (stm9,re_wr,h_m_bar,temp10);

shift10: dff port map (temp10,clk,stm(10),stmn10);
inverter_11: inverter port map (stmn10,stm10);
and3_9: and3 port map (stm10,re_wr,h_m_bar,temp11);

shift11: dff port map (temp11,clk,stm(11),stmn11);
inverter_12: inverter port map (stmn11,stm11);
and3_10: and3 port map (stm11,re_wr,h_m_bar,temp12);

shift12: dff port map (temp12,clk,stm(12),stmn12);
inverter_13: inverter port map (stmn12,stm12);
and3_11: and3 port map (stm12,re_wr,h_m_bar,temp13);

shift13: dff port map (temp13,clk,stm(13),stmn13);
inverter_14: inverter port map (stmn13,stm13);
and3_12: and3 port map (stm13,re_wr,h_m_bar,temp14);

shift14: dff port map (temp14,clk,stm(14),stmn14);
inverter_15: inverter port map (stmn14,stm14);
and3_13: and3 port map (stm14,re_wr,h_m_bar,temp15);

shift15: dff port map (temp15,clk,stm(15),stmn15);
inverter_16: inverter port map (stmn15,stm15);
and3_14: and3 port map (stm15,re_wr,h_m_bar,temp16);

shift16: dff port map (temp16,clk,stm(16),stmn16);
inverter_17: inverter port map (stmn16,stm16);
and3_15: and3 port map (stm16,re_wr,h_m_bar,temp17);

shift17: dff port map (temp17,clk,stm(17),stmn17);
inverter_18: inverter port map (stmn17,stm17);
and3_16: and3 port map (stm17,re_wr,h_m_bar,temp18);

shift18: dff port map (temp18,clk,stm(18),stmn18);

end structural;
