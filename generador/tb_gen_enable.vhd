--------------------------------------------------------------------------------
-- Test bench para probar el generador de enable
-- 
-- Departamento de Ingeniería Electrónica 2020
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_gen_enable IS
END tb_gen_enable;
 
ARCHITECTURE behavior OF tb_gen_enable IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gen_enable
    PORT(
         CLK : IN  std_logic;
         VALOR : IN  std_logic_vector(31 downto 0);
         EN : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal VALOR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal EN : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gen_enable PORT MAP (
          CLK => CLK,
          VALOR => VALOR,
          EN => EN
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		VALOR<="00000000000000000000000000011110"; -- 30
		wait for 2000 ns;
      VALOR<="00000000000000000000000001010000"; -- 80
		wait for 8000 ns;
      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
