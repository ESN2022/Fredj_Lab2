library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Lab2 is
	port (                    
		clk: in  std_logic;
		reset : in std_logic;
		display1 : out  STD_LOGIC_VECTOR (7 downto 0); -- the first 7-segments
		display2 : out  STD_LOGIC_VECTOR (7 downto 0); -- the second 7-segments
		display3 : out  STD_LOGIC_VECTOR (7 downto 0) -- the third 7-segments

	);
end entity Lab2;




architecture rtl of Lab2 is

   component Lab2_sys is
        port (
            afficheur_external_connection_export : out std_logic_vector(11 downto 0);        -- export
            clk_clk                              : in  std_logic                     := 'X'; -- clk
            reset_reset_n                        : in  std_logic                     := 'X'
        );
    end component;
	 
	 component decode is
	port (                    
		input : in STD_LOGIC_VECTOR (3 downto 0);
		output: out STD_LOGIC_VECTOR (7 downto 0)
	);
	end component;
	
	 
	 signal readbin: std_logic_vector(11 downto 0); -- variable were we will stock the 12 bits numbers ( every digit in 4 bits)
	 
begin
     u0 : component Lab2_sys
        port map (
		  afficheur_external_connection_export   => readbin,
		  clk_clk       => clk,
		  reset_reset_n => reset               
        );
		  
		 u1: component decode port map (readbin(3 downto 0), display1); -- to display every 4 bits in their 7 segments requirement in 8 bits
		 u2: component decode port map (readbin(7 downto 4), display2);
		 u3: component decode port map (readbin(11 downto 8), display3);
	
end architecture;
