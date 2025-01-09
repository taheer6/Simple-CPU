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
			WHEN "0000" => leds <= "0000001";
			WHEN "0001" => leds <= "1001111";
			WHEN "0010" => leds <= "0010010";
			WHEN "0011" => leds <= "0000110";
			WHEN "0100" => leds <= "1001100";
			WHEN "0101" => leds <= "0100100";
			WHEN "0110" => leds <= "0100000";
			WHEN "0111" => leds <= "0001111";
			WHEN "1000" => leds <= "0000000";
			WHEN "1001" => leds <= "0000100";
			WHEN "1010" => leds <= "0001000";
			WHEN "1011" => leds <= "0000011";
			WHEN "1100" => leds <= "1000110";
			WHEN "1101" => leds <= "0100001";
			WHEN "1110" => leds <= "0000100";
			WHEN "1111" => leds <= "0001110";			
			WHEN OTHERS => leds <= "-------";
		END CASE;
		IF sign = '1' THEN
			SL <= "1111110";
		ELSE 
			SL <= "1111111";
		END IF;
		
 	END PROCESS;
END Behavior;