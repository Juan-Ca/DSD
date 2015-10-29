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
when code & RippleBlank_In select
		
		segments <= 
						"0111111" when to_unsigned(1,8),
						"0000110" when to_unsigned(2,8),
						"1011011" when to_unsigned(3,8),
						"1001111" when to_unsigned(4,8),
						"1100110" when to_unsigned(5,8),
						"1101101" when to_unsigned(6,8),
						"1111101" when to_unsigned(7,8),
						"0000111" when to_unsigned(8,8),
						"1100111" when to_unsigned(9,8),
						"0111111" when to_unsigned(10,8),
						"1111100" when to_unsigned(11,8),--b
						"1111011" when to_unsigned(12,8),--r
						"1110100" when to_unsigned(13,8),--n
						"0011110" when to_unsigned(14,8),--j
						"0111110" when to_unsigned(15,8),--u
						"0111001" when to_unsigned(16,8),--c
						"0000000" when others;
end imp;


