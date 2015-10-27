library ieee;
use ieee.std_logic_1164.all;

entity g14_7_segment_decoder is
port(code : in std_logic_vector(3 downto);
		RippleBlank_In : in std_logic;
		RippleBlank_Out : out std_logic;
		segments : out std_logic_vector(6 downto 0));
end g14_7_segment_decoder;

architecture imp for g14_7_segment_decoder is

begin
process(code,RippleBlank_In)

