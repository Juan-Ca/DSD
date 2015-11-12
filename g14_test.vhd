library ieee;
use ieee.std_logic_1164.all;

entity g14_test is
port(x: in std_logic;
		y: out std_logic);
end g14_test;

architecture imp of g14_test is
--bla bla
begin
y<=x;
end imp;
