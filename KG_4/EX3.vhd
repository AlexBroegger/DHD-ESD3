library ieee;
use ieee.std_logic_1164.all;


entity bitshifter2 is 
    port (
        klok: in STD_LOGIC;
        switch: in STD_LOGIC;
        LED: out std_logic_vector(3 downto 0)
    );
end bitshifter2;

architecture Behavioral of bitshifter2 is
signal buff: std_logic_vector(3 downto 0) := "0001";
begin
process(klok)

begin


    if(klok'event and klok = '1') then
        buff(3) <= buff(2); -- Kan vidst også du uden at det skal være signaler
        buff(2) <= buff(1);
        buff(1) <= buff(0);
        buff(0) <= buff(3) xor buff(2);

        LED(3) <= buff(3);
        LED(2) <= buff(2);
        LED(1) <= buff(1);
        LED(0) <= buff(0);


    end if;

end process;
    

end architecture;




    