library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity halfadder is

    port (
    A : in std_logic;
    B : in std_logic;
    
    C : out std_logic;
    S : out std_logic
    
    );
 
end halfadder;

architecture logic of halfadder is
begin
    C <= A and B;
    S <= A xor B;
end architecture logic;   

library ieee;
use ieee.std_logic_1164.all;

entity fulladder is 

    port (
    A1 : in std_logic;
    B1 : in std_logic;
    Ci : in std_logic;
    
    S1  : out std_logic;
    Co : out std_logic
    
    );
    
end fulladder;


architecture structure of fulladder is
    component halfadder
        port (
        A : in std_logic;
        B : in std_logic;
    
        C : out std_logic;
        S : out std_logic
        );
    end component;
    
   signal Sum_ha1, carry_ha1, carry_ha2 : std_logic;
    
begin
   -- Halfadder 1, ergo A1+B1
   HA1 : halfadder port map (
   A => A1, 
   B => B1, 
   S => Sum_ha1,
   C => carry_ha1
   );
   -- Halfadder 2, ergo (A1+B1) + Cin
   HA2 : halfadder port map (
   A => Sum_ha1,
   B => Ci,
   S => S1,
   C => carry_ha2
   );
   
   Co<=carry_ha2 or carry_ha1;
   
 end structure;

library ieee;
use ieee.std_logic_1164.all;

ENTITY adder_bits_n IS

GENERIC(n: INTEGER := 2);

PORT (

	Cin: IN std_logic;

    a, b: IN std_logic_vector(n-1 downto 0);

    S: OUT std_logic_vector(n-1 downto 0);

    Cout: OUT std_logic
	
	);

END; 


ARCHITECTURE ripple_n_arch OF adder_bits_n IS

  COMPONENT fulladder

        port (
    A1 : in std_logic;
    B1 : in std_logic;
    Ci : in std_logic;
    
    S1  : out std_logic;
    Co : out std_logic
    
    );

  END COMPONENT;

  SIGNAL t: std_logic_vector(n downto 0);

BEGIN 

t(0) <= Cin; Cout <= t(n);

FA: for i in 0 to n-1 generate

        FA_i: fulladder PORT MAP (Ci => t(i), A1 => a(i), B1 => b(i), S1 => S(i), Co => t(i+1));

end generate;

END;

library ieee;
use ieee.std_logic_1164.all;

ENTITY test IS
GENERIC(n: INTEGER := 2);
END;

ARCHITECTURE test_bench OF test IS
	COMPONENT adder_bits_n
	GENERIC(n: INTEGER := 2);
	port(
	
	Cin: IN std_logic;

    a, b: IN std_logic_vector(n-1 downto 0);

    S: OUT std_logic_vector(n-1 downto 0);

    Cout: OUT std_logic
	
	);
	
	END COMPONENT;

SIGNAL A_in, B_in, S_out : std_logic_vector(n-1 downto 0); 
SIGNAL cin, cout : std_logic;

BEGIN
	UUT: adder_bits_n
        generic map (n => 2)
        port map (
            Cin  => cin,
            a    => A_in,
            b    => B_in,
            S    => S_out,
            Cout => cout
        );

    -- Stimulus process
    stim_proc: process
    begin
        A_in <= "11";
        B_in <= "11";
        cin  <= '0';
        wait for 10 ns;


        wait; -- stop simulation
    end process;
END;