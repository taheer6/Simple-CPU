LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY sseg IS
	PORT ( bcd :IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			 sign :IN STD_LOGIC;
			 SL : OUT STD_LOGIC_VECTOR(1 TO 7);
			 leds :OUT STD_LOGIC_VECTOR(1 TO 7));
			
end sseg;

ARCHITECTURE Behavior OF sseg IS
BEGIN
	PROCESS (bcd, sign) 
	BEGIN
		CASE bcd IS
			WHEN "0000" => leds <= "0000001"; -- 0
			WHEN "0001" => leds <= "1001111"; -- 1
			WHEN "0010" => leds <= "0010010"; -- 2
			WHEN "0011" => leds <= "0000110"; -- 3
			WHEN "0100" => leds <= "1001100"; -- 4
			WHEN "0101" => leds <= "0100100"; -- 5
			WHEN "0110" => leds <= "1100000"; -- 6
			WHEN "0111" => leds <= "0001111"; -- 7
			WHEN "1000" => leds <= "0000000"; -- 8
			WHEN "1001" => leds <= "0000100"; -- 9
			WHEN "1010" => leds <= "0011111"; -- a
			WHEN "1011" => leds <= "0110001"; -- b
			WHEN "1100" => leds <= "1000010"; -- c
			WHEN "1101" => leds <= "0110000"; -- d
			WHEN "1110" => leds <= "0000100"; -- e
			WHEN "1111" => leds <= "0111000"; -- f	
			WHEN OTHERS => leds <= "-------";
		END CASE;
		IF sign = '1' THEN
			SL <= "1111110";
		ELSE 
			SL <= "1111111";
		END IF;
		
 	END PROCESS;
END Behavior;