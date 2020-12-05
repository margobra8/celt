--------------------------------------------------------------------------------
-- Test_bench del autómata de control
--
-- Departamento de Ingeniería Electrónica 2020
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY tb_aut_control IS
END tb_aut_control;
 
ARCHITECTURE behavior OF tb_aut_control IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT aut_control
    PORT(
         CLK : IN  std_logic;
         INC : IN  std_logic;
         DEC : IN  std_logic;
         VALOR : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal INC : std_logic := '0';
   signal DEC : std_logic := '0';

 	--Outputs
   signal VALOR : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: aut_control PORT MAP (
          CLK => CLK,
          INC => INC,
          DEC => DEC,
          VALOR => VALOR
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
     wait for 60 ns;
	  INC<='1';
	  wait for 100 ns;
	  INC<='0';
	  wait for 100 ns;
	  INC<='1';
	  wait for 1600 ns;
	  INC<='0';
	  wait for 100 ns;
	  
	  DEC<='1';
	  wait for 100 ns;
	  DEC<='0';
	  wait for 100 ns;
	  DEC<='1';
	  wait for 1600 ns;
	  DEC<='0';
	  wait for 100 ns;
   end process;

END;
