--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_possibility_table is
port( TC_en 	: in std_logic; -- table counter enable
		TC_RST	: in std_logic; -- table counter reset
		TM_IN		: in std_logic; -- table memory input data
		TM_EN		: in std_logic; -- table memory write enable
		clk		: in std_logic;
		TC_LAST	: out std_logic; -- last count flag
		TM_ADDR	: out std_logic_vector(11 downto 0);
		TM_OUT	: out std_logic); -- table memory output
end g14_possibility_table;

Architecture imp of g14_possibility_table is

signal TC : std_logic_vector(11 downto 0);
signal flag : std_logic;

begin
TM_ADDR <= TC;
TC_LAST <= flag;
process (clk, TC_RST)
begin	
	
	if(TC = std_logic_vector(to_unsigned(0,12)) then
			flag <= '0'
	elsif (TC = std_logic_vector(to_unsigned(2925,12)) then
			flag <= '1';
	
	elsif ((flag = '1' or TC_RST = 1) and clk'event and clk = '1') then
			TC <= std_logic_vector(0,12);
	elsif ((TC = std_logic_vector(to_unsigned(365,12) or TC = std_logic_vector(to_unsigned(877,12) or 
				  TC = std_logic_vector(to_unsigned(1389,12) or TC = std_logic_vector(to_unsigned(1901,12) or 
				  TC = std_logic_vector(to_unsigned(2413,12))and clk'event and clk = '1') then
				TC < = TC+512;
	elsif ((TC = std_logic_vector(to_unsigned(45,12) or TC = std_logic_vector(to_unsigned(109,12) or 
				  TC = std_logic_vector(to_unsigned(173,12) or TC = std_logic_vector(to_unsigned(237,12) or 
				  TC = std_logic_vector(to_unsigned(301,12))and clk'event and clk = '1') then
				TC <= TC+64;
	elsif ((TC = std_logic_vector(to_unsigned(5,12)) or TC = std_logic_vector(to_unsigned(13,12) or 
			  TC = std_logic_vector(to_unsigned(21,12) or TC = std_logic_vector(to_unsigned(29,12) or 
			  TC = std_logic_vector(to_unsigned(37,12))and clk'event and clk = '1') then
			TC <= TC+8;
	elsif(clk'event and ckl = '1' and flag = '0' and TC_RST = '0') then
			TC <= TC+1;
	end if;
end process;

process(clk, TM_EN, TC_RST)
begin
		TM_OUT <= '0';
	if (clk'event and clk = '1' and TM_EN = '1' and TC_RST = '0') then
		TM_OUT <= TM_IN;
	end if;
end process;

end imp;