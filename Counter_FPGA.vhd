LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Counter_FPGA IS
PORT (	set: IN std_logic;
			reset: IN std_logic;
			clock: IN std_logic;
			display_1: OUT std_logic_vector (7 downto 0);
			display_2: OUT std_logic_vector (7 downto 0);
			display_3: OUT std_logic_vector (7 downto 0);
			display_4: OUT std_logic_vector (7 downto 0);
			BCD_ones: OUT std_logic_vector (3 downto 0);
			BCD_tens: OUT std_logic_vector (3 downto 0);
			BCD_hundreds: OUT std_logic_vector (3 downto 0);
			BCD_thousands: OUT std_logic_vector (3 downto 0)
		);
END Counter_FPGA;

ARCHITECTURE Arch4 OF Counter_FPGA IS

	COMPONENT Counter  
		PORT (
					set: IN std_logic;
					reset: IN std_logic;
					clock: IN std_logic;
					B0,B1,B2,B3,B4,B5,B6,B7,B8,B9: OUT std_logic
				);
	END COMPONENT;

	COMPONENT Binary_to_BCD 
		PORT (
					number_in: IN std_logic_vector (9 downto 0);
					display_1: OUT std_logic_vector (7 downto 0);
					display_2: OUT std_logic_vector (7 downto 0);
					display_3: OUT std_logic_vector (7 downto 0);
					display_4: OUT std_logic_vector (7 downto 0);
					BCD_ones: OUT std_logic_vector (3 downto 0);
					BCD_tens: OUT std_logic_vector (3 downto 0);
					BCD_hundreds: OUT std_logic_vector (3 downto 0);
					BCD_thousands: OUT std_logic_vector (3 downto 0)
				);
	END COMPONENT;
	
	
	SIGNAL B: std_logic_vector (9 downto 0);
	
	
	BEGIN
	
		counter : Counter PORT MAP (set,reset,clock,B(0),B(1),B(2),B(3),B(4),B(5),B(6),B(7),B(8),B(9));
		display : Binary_to_BCD PORT MAP (B,display_1,display_2,display_3,display_4,BCD_ones,BCD_tens,BCD_hundreds,BCD_thousands);
		
END Arch4;