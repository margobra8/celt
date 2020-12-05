library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity gen_enable is
	Port( CLK : in STD_LOGIC;
			VALOR : in STD_LOGIC_VECTOR (31 downto 0);
			EN : out STD_LOGIC);
end gen_enable;

architecture a_gen_enable of gen_enable is

type STATE_TYPE is (EN_OFF, EN_ON);
signal ST : STATE_TYPE := EN_OFF;
signal cont : unsigned (31 downto 0) := (others => '0');

begin
	process (CLK)
		begin
			if CLK'event and CLK = '1' then
				case ST is
					when EN_OFF => 
						cont <= cont + 1;
						if (cont >= unsigned(VALOR) - 2) then ST <= EN_ON; end if;
					when EN_ON => 
						cont <= (others => '0');
						ST <= EN_OFF;
				end case;
			end if;
		end process;
	EN <= '1' when ST = EN_ON else '0';
end a_gen_enable;