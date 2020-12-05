library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity contador is
	Port (CLK : in STD_LOGIC;
			EN  : in STD_LOGIC;
			Q   : out STD_LOGIC_VECTOR (7 downto 0));
end contador;

architecture a_contador of contador is

signal cont : unsigned (7 downto 0) := (others => '0');
signal modo : STD_LOGIC := '0';

begin 
	process (CLK)
	begin
		if (CLK'event and CLK='1') then
			if (EN = '1') then
				if (modo = '0') then
					cont <= cont + 1;
				else
					cont <= cont - 1;
				end if;
			end if;
			
			if (cont = 255) then
				modo <= '1';
			elsif (cont = 0) then
				modo <= '0';
			end if;
		end if;
	end process;
	
	Q <= STD_LOGIC_VECTOR(cont);
end a_contador;