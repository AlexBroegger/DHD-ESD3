library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity traffic is
    Port ( 
        clk    : in  STD_LOGIC;
        reset  : in  STD_LOGIC;

        Red    : out STD_LOGIC;
        Yellow : out STD_LOGIC;
        Green  : out STD_LOGIC
    );
end traffic;

architecture ASM of traffic is
type State_Type is (S_Red, S_RedYellow, S_Green, S_Yellow);
signal state, next_state : State_Type;
signal clk_count: integer range 0 to 79;
signal clk_tick: std_logic;  
signal tick_cntr: integer range 0 to 100; 
signal rst_cntr: std_logic;

begin


    clkgen : process(clk, reset)
    begin
        if reset = '1' then
            clk_count <= 0;
            clk_tick  <= '0';

        elsif rising_edge(clk) then
            clk_tick <= '0';

            if clk_count = 79 then
                clk_count <= 0;
                clk_tick  <= '1';
            else
                clk_count <= clk_count + 1;
            end if;
        end if;
    end process;




    process(clk, reset)
    begin
        if reset = '1' then
            state <= S_Red; 
        elsif rising_edge(clk) then
            state <= next_state;
            
            if rst_cntr = '1' then
                tick_cntr<= 0;
            elsif clk_tick='1' then
                if tick_cntr = 100 then
                    tick_cntr <= 0;
                else
                    tick_cntr <= tick_cntr+1;
                end if;
            end if;
            
        end if;
    end process;

    process(state, tick_cntr)
    begin

        rst_cntr <= '0';
        next_state <= state;
    
        case state is
            when S_Red =>
                if tick_cntr >= 2 then 
                    next_state <= S_RedYellow;
                    rst_cntr <= '1';  
                end if;

            when S_RedYellow =>
                if tick_cntr >= 7 then  
                    next_state <= S_Green;
                    rst_cntr <= '1';    
                end if;

            when S_Green =>
                if tick_cntr >= 13 then 
                    next_state <= S_Yellow;
                    rst_cntr <= '1';    
                end if;

            when S_Yellow =>
                if tick_cntr >= 17 then 
                    next_state <= S_Red;
                    rst_cntr <= '1';    
                end if;
        end case;
    end process;


    process(state)
    begin
        case state is
            when S_Red =>
                Red <= '1'; Yellow <= '0'; Green <= '0';
            when S_RedYellow =>
                Red <= '1'; Yellow <= '1'; Green <= '0';
            when S_Green =>
                Red <= '0'; Yellow <= '0'; Green <= '1';
            when S_Yellow =>
                Red <= '0'; Yellow <= '1'; Green <= '0';
        end case;
    end process;

end ASM;