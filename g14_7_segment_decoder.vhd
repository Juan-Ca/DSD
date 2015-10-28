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
signal y : std_logic_vector(7 downto 0);
begin
x <= RippleBlank_In & code;
RippleBlank_Out <= y(7);
segments <= y(6 downto 0);
-- RippleBlank_Out <= RippleBlank_In;
with x select
			y	<= 	"00111111" when "00000",--0
						"00000110" when "00001",--1
						"01011011" when "00010",--2
						"01001111" when "00011",--3
						"01100110" when "00100",--4
						"01101101" when "00101",--5
						"01111101" when "00110",--6
						"00000111" when "00111",--7
						"01100111" when "01000",--8
						"00111111" when "01001",--9
						"01111100" when "01010",--b
						"01111011" when "01011",--r
						"01110100" when "01100",--n
						"00011110" when "01101",--j
						"00111110" when "01110",--u
						"00111001" when "01111",--c
			-- for decoders that are connected to the left part
						"10000000" when "10000",--leading 0
						"00000110" when "10001",--1
						"01011011" when "10010",--2
						"01001111" when "10011",--3
						"01100110" when "10100",--4
						"01101101" when "10101",--5
						"01111101" when "10110",--6
						"00000111" when "10111",--7
						"01100111" when "11000",--8
						"00111111" when "11001",--9
						"01111100" when "11010",--b
						"01111011" when "11011",--r
						"01110100" when "11100",--n
						"00011110" when "11101",--j
						"00111110" when "11110",--u
						"00111001" when "11111",--c
				--for all other posible signals
						"00000000" when others;
end imp;

