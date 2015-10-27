library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric.std.all;

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
	                 "0111111" when to_unsigned(0,4) ;   --0
                    "0000110" when to_unsigned(1,4) ;   --1
						  "1011011" when to_unsigned(2,4) ;   --2
						  "1001111" when to_unsigned(3,4) ;   --3
						  "1100110" when to_unsigned(4,4) ;   --4
						  "1101101" when to_unsigned(5,4) ;   --5
						  "1111101" when to_unsigned(6,4) ;   --6
						  "0000111" when to_unsigned(7,4) ;   --7
						  "1111111" when to_unsigned(8,4) ;   --8
						  "1100111" when to_unsigned(9,4) ;   --9
						  "1111100" when to_unsigned(10,4) ;  --bleu
						  "0110111" when to_unsigned(11,4) ;  --red 
						  "1110100" when to_unsigned(12,4) ;  --noir
						  "" when to_unsigned(13,4) ;  --jaune 
						  "" when to_unsigned(14,4) ;   --vert
						  "" when to_unsigned(15,4) ;   --blanc
  
