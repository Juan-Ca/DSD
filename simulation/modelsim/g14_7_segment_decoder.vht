-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "10/28/2015 11:29:18"
                                                            
-- Vhdl Test Bench template for design  :  g14_7_segment_decoder
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all; 
use ieee.numeric_std.all;                               

ENTITY g14_7_segment_decoder_vhd_tst IS
END g14_7_segment_decoder_vhd_tst;
ARCHITECTURE g14_7_segment_decoder_arch OF g14_7_segment_decoder_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL code : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL RippleBlank_In : STD_LOGIC;
SIGNAL RippleBlank_Out : STD_LOGIC;
SIGNAL segments : STD_LOGIC_VECTOR(6 DOWNTO 0);
COMPONENT g14_7_segment_decoder
	PORT (
	code : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	RippleBlank_In : IN STD_LOGIC;
	RippleBlank_Out : OUT STD_LOGIC;
	segments : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;
BEGIN
-- the following 2 instances is to observe the behaviour of the circuit when RB is passed to the next instance
	i1 : g14_7_segment_decoder
	PORT MAP (
-- list connections between master ports and signals
	code => code,
	RippleBlank_In => RippleBlank_In,
	RippleBlank_Out => RippleBlank_Out,
	segments => segments
	);
	
init : PROCESS                                               
                                     
BEGIN                                                        
			RippleBlank_In <= '0';
			for j in 0 to 15 loop
				code <= std_logic_vector(to_unsigned(j,4));
				wait for 10 ns;
			end loop;
		RippleBlank_In <= '1';
			for j in 0 to 15 loop
				code <= std_logic_vector(to_unsigned(j,4));
				wait for 10 ns;
			end loop;
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END g14_7_segment_decoder_arch;
