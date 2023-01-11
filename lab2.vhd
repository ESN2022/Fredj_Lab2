library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Lab2 is
	port (                    
		clk: in  std_logic;
		reset : in std_logic;
		display : out  STD_LOGIC_VECTOR (7 downto 0)	
	);
end entity Lab2;




architecture rtl of Lab2 is

   component Lab2_sys is
        port (
            clk_clk                              : in  std_logic                    := 'X'; -- clk
            reset_reset_n                        : in  std_logic                    := 'X'; -- reset_n
            afficheur_external_connection_export : out std_logic_vector(3 downto 0)         -- export
        );
    end component Lab2_sys;
	 
	 signal readbin: std_logic_vector(3 downto 0);
	 
begin
     u0 : component Lab2_sys
        port map (
		  clk_clk       => clk,
		  reset_reset_n => reset,
        afficheur_external_connection_export   => readbin  
            
               
        );
		  
decodage : process(readbin)
    begin
        case readbin is
            when "0000" => display <= "00000011";
            when "0001" => display <= "10011111";
            when "0010" => display <= "00100101";
            when "0011" => display <= "00001101";
            when "0100" => display <= "10011011";
            when "0101" => display <= "01001011";
            when "0110" => display <= "01000001";
            when "0111" => display <= "00011111";
            when "1000" => display <= "00000001";
            when "1001" => display <= "00001001";
            when others => display <= "01100000";
        end case;
    end process;
	
end architecture;
