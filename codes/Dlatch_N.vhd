library STD;
library IEEE;                      
use IEEE.std_logic_1164.all;       

entity Dlatch_N is                      
  port ( d     : in  std_logic;
         clk   : in  std_logic;
	 reset : in std_logic;
         q     : out std_logic;
         qbar  : out std_logic); 
end Dlatch_N;                          

architecture structural of Dlatch_N is 
  
begin
  
  output: process (d,clk,reset)                  

  begin                           
    if clk = '0' and reset = '0' then 
    q <= d;
    qbar <= not d ;
 end if; 
 end process output;        
                             
end structural;
