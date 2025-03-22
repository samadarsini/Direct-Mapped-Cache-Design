library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_textio.all;
use STD.textio.all;

entity cc_byte is

port (
	en	: in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic_vector(7 downto 0);
	rd_data	: out std_logic_vector(7 downto 0));
end cc_byte;

architecture structural of cc_byte is

component cache_cell
  port (
	en	: in std_logic;
	rd_wrn	: in std_logic;
	data_in	: in std_logic;
	rd_data	: out std_logic);
end component;

for cache_cell_1: cache_cell use entity work.cache_cell(structural);
for cache_cell_2: cache_cell use entity work.cache_cell(structural);
for cache_cell_3: cache_cell use entity work.cache_cell(structural);
for cache_cell_4: cache_cell use entity work.cache_cell(structural);
for cache_cell_5: cache_cell use entity work.cache_cell(structural);
for cache_cell_6: cache_cell use entity work.cache_cell(structural);
for cache_cell_7: cache_cell use entity work.cache_cell(structural);
for cache_cell_8: cache_cell use entity work.cache_cell(structural);

begin

cache_cell_1: cache_cell port map (en, rd_wrn, data_in(0), rd_data(0));
cache_cell_2: cache_cell port map (en, rd_wrn, data_in(1), rd_data(1));
cache_cell_3: cache_cell port map (en, rd_wrn, data_in(2), rd_data(2));
cache_cell_4: cache_cell port map (en, rd_wrn, data_in(3), rd_data(3));
cache_cell_5: cache_cell port map (en, rd_wrn, data_in(4), rd_data(4));
cache_cell_6: cache_cell port map (en, rd_wrn, data_in(5), rd_data(5));
cache_cell_7: cache_cell port map (en, rd_wrn, data_in(6), rd_data(6));
cache_cell_8: cache_cell port map (en, rd_wrn, data_in(7), rd_data(7));

end structural;
