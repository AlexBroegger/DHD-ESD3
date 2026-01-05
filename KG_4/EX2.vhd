library ieee;
use ieee.std_logic_1164.all;


entity bitshifter is 
    port (
        klok: in STD_LOGIC;
        switch: in STD_LOGIC;
        LED: out std_logic_vector(3 downto 0)
    );
end bitshifter;

architecture Behavioral of bitshifter is

begin
process(klok)
variable buff: std_logic_vector(3 downto 0) := (others => '0');
begin


    if(klok'event and klok = '1') then
        buff(3):= buff(2);
        buff(2):= buff(1);
        buff(1):= buff(0);
        buff(0):= switch;

        LED(3) <= buff(3);
        LED(2) <= buff(2);
        LED(1) <= buff(1);
        LED(0) <= buff(0);


    end if;

end process;
    

end architecture;




    