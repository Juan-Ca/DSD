--Juan Carlos Borges

library ieee;
use ieee.std_logic_1164.all;

entity g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto 0);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end g14_7_segment_decoder;

architecture imp of g14_7_segment_decoder is
signal x : std_logic_vector(4 downto 0);
-- signal y : std_logic_vector(7 downto 0);
begin
x<= RippleBlank_In&code;
-- y<= RippleBlank_Out&segments;
RippleBlank_Out <= RippleBlank_In;
with x select
		segments<= 	"0111111" when "00000",--0
						"0000110" when "00001",--1
						"1011011" when "00010",--2
						"1001111" when "00011",--3
						"1100110" when "00100",--4
						"1101101" when "00101",--5
						"1111101" when "00110",--6
						"0000111" when "00111",--7
						"1100111" when "01000",--8
						"0111111" when "01001",--9
						"1111100" when "01010",--b
						"1111011" when "01011",--r
						"1110100" when "01100",--n
						"0011110" when "01101",--j
						"0111110" when "01110",--u
						"0111001" when "01111",--c
			-- for decoders that are connected to the left part
						"0000000" when "10000",--leading 0
						"0000110" when "10001",--1
						"1011011" when "10010",--2
						"1001111" when "10011",--3
						"1100110" when "10100",--4
						"1101101" when "10101",--5
						"1111101" when "10110",--6
						"0000111" when "10111",--7
						"1100111" when "11000",--8
						"0111111" when "11001",--9
						"1111100" when "11010",--b
						"1111011" when "11011",--r
						"1110100" when "11100",--n
						"0011110" when "11101",--j
						"0111110" when "11110",--u
						"0111001" when "11111",--c
				--for all other posible signals
						"0000000" when others;
end imp;

