LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY Counter IS
PORT (	set: IN std_logic;
			reset: IN std_logic;
			clock: IN std_logic;
			B0,B1,B2,B3,B4,B5,B6,B7,B8,B9: BUFFER std_logic
		);
END Counter;

ARCHITECTURE Arch2 OF Counter IS
	COMPONENT JK_flip_flop 
		PORT(
				j, k, clk, pre, clr : IN std_logic;
				Q, Qn : OUT std_logic);
	END COMPONENT;
	
	SIGNAL Bn0,Bn1,Bn2,Bn3,Bn4,Bn5,Bn6,Bn7,Bn8,Bn9 : std_logic; -- complementary signals
	
	BEGIN
		
		jk_0 : JK_flip_flop PORT MAP ('1', '1', clock,  set,  reset, B0, Bn0);
		jk_1 : JK_flip_flop PORT MAP ('1', '1', B0,     set,  reset, B1, Bn1);
		jk_2 : JK_flip_flop PORT MAP ('1', '1', B1,     set,  reset, B2, Bn2);
		jk_3 : JK_flip_flop PORT MAP ('1', '1', B2,     set,  reset, B3, Bn3);
		jk_4 : JK_flip_flop PORT MAP ('1', '1', B3,     set,  reset, B4, Bn4);
		jk_5 : JK_flip_flop PORT MAP ('1', '1', B4,     set,  reset, B5, Bn5);
		jk_6 : JK_flip_flop PORT MAP ('1', '1', B5,     set,  reset, B6, Bn6);
		jk_7 : JK_flip_flop PORT MAP ('1', '1', B6,     set,  reset, B7, Bn7);
		jk_8 : JK_flip_flop PORT MAP ('1', '1', B7,     set,  reset, B8, Bn8);
		jk_9 : JK_flip_flop PORT MAP ('1', '1', B8,     set,  reset, B9, Bn9);
		
END Arch2;