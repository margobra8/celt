library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity aut_control is
	Port ( CLK : in STD_LOGIC; -- reloj del sistema
			 INC : in STD_LOGIC; -- señal de incremento del sistema
			 DEC : in STD_LOGIC; -- señal de decremento del sistema
			 VALOR : out STD_LOGIC_VECTOR (31 downto 0)); -- valor
end aut_control;

architecture a_aut_control of aut_control is

constant VAL_MIN : unsigned (31 downto 0) := to_unsigned(20, 32);
constant VAL_MAX : unsigned (31 downto 0) := to_unsigned(98, 32);
type STATE_TYPE is (V_MIN, V_INC, V_DEC, V_MAX, ESPERA);
signal ST : STATE_TYPE := V_MAX; -- init frec mas baja
signal s_val : unsigned (31 downto 0) := (others => '0');

begin
	process (CLK)
		begin
			if CLK'event and CLK='1' then
				case ST is
					when V_MIN =>
						s_val <= VAL_MIN;
						if DEC = '1' then ST <= V_INC; end if;
					when V_MAX =>
						s_val <= VAL_MAX;
						if INC = '1' then ST <= V_DEC; end if;
					when V_INC =>
						s_val <= s_val + 1;
					   if s_val >= VAL_MAX - 1 then
							ST <= V_MAX;
						elsif DEC = '1' then
							ST <= V_INC;
						else
							ST <= ESPERA;
						end if;
					when V_DEC =>
						s_val <= s_val - 1;
					   if s_val <= VAL_MIN + 1 then
							ST <= V_MIN;
						elsif INC = '1' then
							ST <= V_DEC;
						else
							ST <= ESPERA;
						end if;
					when ESPERA =>
						if DEC = '1' then	ST <= V_INC; end if;
						if INC = '1' then	ST <= V_DEC; end if;
				end case;
			end if;
		end process;
	VALOR <= std_logic_vector(s_val);
end a_aut_control;