--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity g14_possibility_table is
port(TC_en 		: in std_logic;
		TC_RST	: in std_logic;
		TM_IN		: in std_logic;
		TM_EN		: in std_logic;
		clk		: in std_logic;
		TC_LAST	: out std_logic;
		TM_ADDR	: out std_logic_vector(11 downto 0);
		TM_OUT	: out std_logic);
end g14_possibility_table;

Architecture imp of g14_possibility_table is



begin

end imp;