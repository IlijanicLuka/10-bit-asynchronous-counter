LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY JK_flip_flop IS
PORT (
				j, k, clk, pre, clr: IN std_logic;
				Q, Qn: BUFFER std_logic
		);
END JK_flip_flop;

ARCHITECTURE Arch1 OF JK_flip_flop IS
BEGIN
		PROCESS (clk,j,k,pre,clr)
		VARIABLE reg: std_logic;
			BEGIN
					IF (pre = '0') THEN
						reg := '1';
					ELSIF (clr = '0') THEN
						reg := '0';
					ELSIF (falling_edge(clk)) THEN
						reg:= (j AND Qn) OR ( NOT k AND Q); -- JK flip flop equation
					END IF;
					Q <= reg;
					Qn <= NOT reg;
						
		END PROCESS;
END Arch1;