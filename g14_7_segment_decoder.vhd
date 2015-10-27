library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end g14_7_segment_decoder;

architecture imp for g14_7_segment_decoder is

begin
when code select
		
		segments <= 
						"0111111" when to_unsigned(0,7),
						"0000110" when to_unsigned(1,7),
						"1011011" when to_unsigned(2,7),
						"1001111" when to_unsigned(3,7),
						"1100110" when to_unsigned(4,7),
						"1101101" when to_unsigned(5,7),
						"1111101" when to_unsigned(6,7),
						"0000111" when to_unsigned(7,7),
						"1100111" when to_unsigned(8,7),
						"0111111" when to_unsigned(9,7),
						"1111100" when to_unsigned(10,7),--b
						"1111011" when to_unsigned(11,7),--r
						"1110100" when to_unsigned(12,7),--n
						"0011110" when to_unsigned(13,7),--j
						"0111110" when to_unsigned(14,7),--u
						"0111001" when to_unsigned(15,7),--c
						"0000000" when others;
end imp;

