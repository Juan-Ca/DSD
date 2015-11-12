--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity g14_possibility_table is
port( TC_EN 	: in std_logic; -- table counter enable
		TC_RST	: in std_logic; -- table counter reset
		TM_IN		: in std_logic; -- table memory input data
		TM_EN		: in std_logic; -- table memory write enable
		clk		: in std_logic;
		TC_LAST	: out std_logic; -- last count flag
		TM_ADDR	: out std_logic_vector(11 downto 0);
		TM_OUT	: out std_logic); -- table memory output
end g14_possibility_table;

Architecture imp of g14_possibility_table is

signal TC : std_logic_vector(12 downto 0);
signal flag : std_logic;
signal C_RST : std_logic; 
signal Clock : std_logic;

begin
TM_ADDR <= TC(11 downto 0);
TM_OUT <= TC(12);
TC_LAST <= flag;
C_RST<= flag or TC_RST;
clock <= TC_EN and Clk;

process (clock, TC_RST)
begin	
	
	if (C_RST = '1' and rising_edge(Clock)) then
			TC(11 downto 0) <= "000000000000";
			flag <= '0';
	elsif(rising_edge(clock)) then	
		if (TC = std_logic_vector(to_unsigned(2925,12)) and C_RST = '0') then 
			flag <= '1';
			
		elsif (TC(8 downto 6) = "101" and C_RST = '0') then 
			TC <= TC+147; -- 512-365
				
		elsif (TC(5 downto 3) = "101" and C_RST = '0') then  
			TC <= TC+19; -- 64-45
				
		elsif (TC(2 downto 0) = "101" and C_RST = '0') then
			TC <= TC+3;
			
		elsif(C_RST = '0') then
			TC <= TC+1;
		end if;
	end if;
	
end process;

process(clock, TM_EN)

begin
	if (rising_edge(clock)) then
		if(TM_EN = '1') then
			TC(12) <= TM_IN;
		elsif (TM_EN = '0') then
			TM_OUT <= TC(12);
		end if;
	end if;
end process;

end imp;