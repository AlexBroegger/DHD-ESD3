library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ex1 is
    Port (
        SW : in std_logic_vector(3 downto 0);
        LED : out std_logic_vector(3 downto 0)
    );
end ex1;

architecture Behavioral of ex1 is
begin
    LED <= SW; 
end Behavioral;