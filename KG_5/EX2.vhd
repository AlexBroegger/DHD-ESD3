library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity counter is
    port(
        clk: in std_logic;
        reset: in std_logic;
        led: out std_logic_vector(7 downto 0);
        en: in std_logic;
        up: in std_logic
    );
end counter;


architecture rtl of counter is

signal q : unsigned(23 downto 0) := (others=>'0');

begin

process(clk, reset)
begin
    if reset = '1' then
        q <= (others=>'0');
    elsif rising_edge(clk) then
        if en = '1' then
            if up = '1' then
                q <= q+1;
            else
                q <= q-1;
            end if;
        end if;
    end if;
end process;

led <= STD_LOGIC_VECTOR(q(23 downto 16)); -- Bit 1 har 1/2 af clk frekvensen, bit 2 har har 1/4 af clk frekvensen osv... Så bit x er 1/2^(x+1) af clk frekvensen. 

end architecture;

