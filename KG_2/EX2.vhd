library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity EX2 is
    Port (
        SW : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(0 downto 0)
    );
end EX2;

architecture Behavioral of EX2 is
begin
    LED(0) <= (SW(0) and SW(1)) or (not(SW(2) and SW(3)));

end Behavioral;