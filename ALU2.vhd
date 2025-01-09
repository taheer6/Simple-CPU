library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU2 is
    port (
        Clock  : in std_logic;
        A, B   : in unsigned(7 downto 0);
        OP     : in unsigned(15 downto 0);
        Neg    : out std_logic;
        R1     : out unsigned(3 downto 0);
        R2     : out unsigned(3 downto 0)
    );
end ALU2;

architecture calculation of ALU2 is
    signal Reg1, Reg2, Result : unsigned(7 downto 0) := (others => '0');
begin
    Reg1 <= A;
    Reg2 <= B;

    process (Clock, OP)
    begin
        if (rising_edge(Clock)) then
            case OP is
                -- Function #1: Shift A to right by 2 bits, input bit = 1 (SHR)
                when "0000000000000001" =>
                    Result <= "11" & Reg1(7 downto 2); -- Shift right, add input bits as '1'

                -- Function #2: Difference of A and B, then increment by 4
                when "0000000000000010" =>
                    Result <= (Reg1 - Reg2) + 4;

                -- Function #3: Find the greater value of A and B (Max(A, B))
                when "0000000000000100" =>
                    if (Reg1 >= Reg2) then
                        Result <= Reg1;
                    else
                        Result <= Reg2;
                    end if;

                -- Function #4: Swap the upper 4 bits of A with lower 4 bits of B
                when "0000000000001000" =>
                    Result <= Reg2(3 downto 0) & Reg1(3 downto 0);

                -- Function #5: Increment A by 1
                when "0000000000010000" =>
                    Result <= Reg1 + 1;

                -- Function #6: ANDing A and B
                when "0000000000100000" =>
                    Result <= Reg1 AND Reg2;

                -- Function #7: Invert the upper 4 bits of A
                when "0000000001000000" =>
                    Result <= (NOT Reg1(7 downto 4)) & Reg1(3 downto 0);

                -- Function #8: Rotate B to the left by 3 bits (ROL)
                when "0000000010000000" =>
                    Result <= Reg2(4 downto 0) & Reg2(7 downto 5);

                -- Default: Retain the current result
                when OTHERS =>
                    Result <= Result;
            end case;
        end if;
    end process;

    -- Assign lower and upper 4 bits of the Result to R1 and R2 respectively
    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);
end calculation;
