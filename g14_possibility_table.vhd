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
TM_ADDR <= addr;
TC_LAST <= flag;

process (clk, TM_EN, TC_RST)

		if (TC_RST = '1') then
			TC <= std_logic_vector(0,12);
		end if;
		
		
		
		
		
		
		for i in 0 to 5 loop
				for j in 0 to 5 loop
					for m in 0 to 5 loop
						for n in 0 to 5 loop
							if (TM_EN = '1') then 
								if ()
								elsif (clk'event and ckl = '0') then
									addr <= std_logic_vector(to_unsigned(i)&to_unsigned(j)&to_unsigned(m)&to_unsigned(n));
						end loop;
					end loop;
				end loop;
		end loop;

end imp;