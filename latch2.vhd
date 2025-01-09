LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch2 IS
    PORT (
        B     : IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
        Resetn: IN  STD_LOGIC;
        Clock : IN  STD_LOGIC;
        Q     : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END latch2;

ARCHITECTURE Behaviour OF latch2 IS
BEGIN
    PROCESS (Resetn, Clock)
    BEGIN
        IF Resetn = '0' THEN
            Q <= "00000000";
        ELSIF Clock'EVENT AND Clock = '1' THEN
            Q <= B;
        END IF;
    END PROCESS;
END Behaviour;