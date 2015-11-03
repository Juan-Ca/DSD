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

signal addr : std_logic_vector(11 downto 0);
signal flag : std_logic;

begin
TM_ADDR <= addr;
TC_LAST <= flag;

process (clk, TM_EN, TC_RST)

	while (TM_EN = '1' and flag = '0')then
		if (TC_RST = '1') then
			addr <= std_logic_vector(to_unsigned(0,12));
		elsif (clk'event and clock = '0') then
			addr <= std_logic_vector(to_unsigned(1,12))+addr;
		end if;
		if ()
		end if;
	end while;

end imp;