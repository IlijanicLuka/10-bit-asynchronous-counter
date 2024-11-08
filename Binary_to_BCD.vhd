LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Binary_to_BCD IS
PORT (	
			number_in: IN std_logic_vector (9 downto 0);
			display_1: OUT std_logic_vector (7 downto 0);
			display_2: OUT std_logic_vector (7 downto 0);
			display_3: OUT std_logic_vector (7 downto 0);
			display_4: OUT std_logic_vector (7 downto 0);
			BCD_ones: BUFFER std_logic_vector (3 downto 0);
			BCD_tens: BUFFER std_logic_vector (3 downto 0);
			BCD_hundreds: BUFFER std_logic_vector (3 downto 0);
			BCD_thousands: BUFFER std_logic_vector (3 downto 0)
		);
END Binary_to_BCD;

ARCHITECTURE Arch3 OF Binary_to_BCD IS

BEGIN

	PROCESS (number_in)
		VARIABLE reg1 : std_logic_vector (9 downto 0); -- register for binary number
		VARIABLE reg2: unsigned (15 downto 0); -- register for BCD number
	BEGIN

		reg1(9 downto 0):= number_in; --unos number_ina u registar
		reg2 := (OTHERS => '0'); --postavljanje registra na nulu
		
		FOR i IN 0 TO 9 LOOP
			IF reg2(3 downto 0) > 4 THEN
				reg2(3 downto 0) := reg2(3 downto 0) + 3; -- add 3 to ones
			END IF;
			IF reg2(7 downto 4) > 4 THEN
				reg2(7 downto 4) := reg2(7 downto 4) + 3; -- add 3 to tens
			END IF;
			IF reg2(11 downto 8) > 4 THEN
				reg2(11 downto 8) := reg2(11 downto 8) + 3; -- add 3 to hundreds
			END IF;
			IF reg2(15 downto 12) > 4 THEN
				reg2(15 downto 12) := reg2(15 downto 12) + 3; -- add 3 to thousands
			END IF;
			
			-- store into the second register 15 bits and MSB from binary_reg at LSB position (left shift)
			
			reg2 := reg2(14 downto 0) & reg1 (9);
			
			-- store into the first register 9 bits and set 0 at LSB position (left shift)
			
			reg1 := reg1(8 downto 0) & '0';
			END LOOP;
			
			-- store register content into output vectors 
			
			BCD_ones <= std_logic_vector (reg2(3 downto 0));
			BCD_tens <= std_logic_vector (reg2(7 downto 4));
			BCD_hundreds <= std_logic_vector (reg2(11 downto 8));
			BCD_thousands <= std_logic_vector (reg2(15 downto 12));
			
					

		CASE BCD_ones IS                              
			WHEN "0000" => display_1 <= "11000000"; -- "0"
			WHEN "0001" => display_1 <= "11111001"; -- "1"
			WHEN "0010" => display_1 <= "10100100"; -- "2"
			WHEN "0011" => display_1 <= "10110000"; -- "3"
			WHEN "0100" => display_1 <= "10011001"; -- "4"
			WHEN "0101" => display_1 <= "10010010"; -- "5"
			WHEN "0110" => display_1 <= "10000010"; -- "6"
			WHEN "0111" => display_1 <= "11111000"; -- "7"
			WHEN "1000" => display_1 <= "10000000"; -- "8"
			WHEN "1001" => display_1 <= "10010000"; -- "9"
			WHEN OTHERS => display_1 <= "10000110"; -- error
		END CASE;
		CASE BCD_tens IS                              
			WHEN "0000" => display_2 <= "11000000"; -- "0"
			WHEN "0001" => display_2 <= "11111001"; -- "1"
			WHEN "0010" => display_2 <= "10100100"; -- "2"
			WHEN "0011" => display_2 <= "10110000"; -- "3"
			WHEN "0100" => display_2 <= "10011001"; -- "4"
			WHEN "0101" => display_2 <= "10010010"; -- "5"
			WHEN "0110" => display_2 <= "10000010"; -- "6"
			WHEN "0111" => display_2 <= "11111000"; -- "7"
			WHEN "1000" => display_2 <= "10000000"; -- "8"
			WHEN "1001" => display_2 <= "10010000"; -- "9"
			WHEN OTHERS => display_2 <= "10000110"; -- error
		END CASE;
		CASE BCD_hundreds IS                               
			WHEN "0000" => display_3 <= "11000000"; -- "0"
			WHEN "0001" => display_3 <= "11111001"; -- "1"
			WHEN "0010" => display_3 <= "10100100"; -- "2"
			WHEN "0011" => display_3 <= "10110000"; -- "3"
			WHEN "0100" => display_3 <= "10011001"; -- "4"
			WHEN "0101" => display_3 <= "10010010"; -- "5"
			WHEN "0110" => display_3 <= "10000010"; -- "6"
			WHEN "0111" => display_3 <= "11111000"; -- "7"
			WHEN "1000" => display_3 <= "10000000"; -- "8"
			WHEN "1001" => display_3 <= "10010000"; -- "9"
			WHEN OTHERS => display_3 <= "10000110"; -- error
		END CASE;
		CASE BCD_thousands IS                              
			WHEN "0000" => display_4 <= "11000000"; -- "0"
			WHEN "0001" => display_4 <= "11111001"; -- "1"
			WHEN "0010" => display_4 <= "10100100"; -- "2"
			WHEN "0011" => display_4 <= "10110000"; -- "3"
			WHEN "0100" => display_4 <= "10011001"; -- "4"
			WHEN "0101" => display_4 <= "10010010"; -- "5"
			WHEN "0110" => display_4 <= "10000010"; -- "6"
			WHEN "0111" => display_4 <= "11111000"; -- "7"
			WHEN "1000" => display_4 <= "10000000"; -- "8"
			WHEN "1001" => display_4 <= "10010000"; -- "9"
			WHEN OTHERS => display_4 <= "10000110"; -- error
		END CASE;
		
	END process;
END Arch3;