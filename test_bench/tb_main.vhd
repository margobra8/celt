--------------------------------------------------------------------------------
-- test_bench para el módulo principal (main)
--
-- Departamento de Ingeniería Electrónica 2020
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_main IS
END tb_main;
 
ARCHITECTURE behavior OF tb_main IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(
         CLK : IN  std_logic;
         INC : IN  std_logic;
         DEC : IN  std_logic;
         SALIDA : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal INC : std_logic := '0';
   signal DEC : std_logic := '0';

 	--Outputs
   signal SALIDA : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          CLK => CLK,
          INC => INC,
          DEC => DEC,
          SALIDA => SALIDA
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
     
      wait for 2 ms;
	   INC<='1';
		wait for 2 us;
		INC<='0';
		wait for 2 ms;
		DEC<='1';
		wait for 2 us;
		DEC<='0';
		wait for 2 ms;
		
   end process;

END;
