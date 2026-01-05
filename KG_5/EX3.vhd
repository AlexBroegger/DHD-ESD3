library ieee;
use ieee.std_logic_1164.all;



entity counter2 is
    port(
        clk: in std_logic;
        reset: in std_logic
    );
end counter2;


architecture rtl of counter2 is


CONSTANT limit: INTEGER := 60;
signal count: integer range 0 to limit-1;    
signal pulse: std_logic;

begin

    process(clk, reset)
    begin
    
        if reset = '1' then
            
            count <= 0;
            pulse <= '0';

        elsif rising_edge(clk) then
        pulse <= '0';
            if count = limit-1 then -- = er lettere at evaluere, da der bare principielt er færre tjeks i modsætning til <=

                count <= 0;
                pulse <= '1';

            else

                count <= count+1;

            end if;

        end if;

    end process;

end architecture; -- Denne viser ikke tid btw