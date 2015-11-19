

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_debounce is
end tb_debounce;

architecture Behavioral of tb_debounce is
    
--------------------------
-- componentes
--------------------------

    -- Declaramos aqui a utilizacao do componente
    COMPONENT debounce is
        generic(
            fclk : natural := 100_000_000; -- frequencia do clk (Hz)
            tdb  : natural := 100   -- debounce time (ms)
        );
        port(
            clk     : in STD_LOGIC;
            btn_in  : in STD_LOGIC;
            btn_out : out STD_LOGIC
        );
        end COMPONENT;
   
--------------------------
-- sinais
--------------------------
    signal clk      : std_logic := '0';
    signal btn_in   : std_logic;
    signal btn_out  : std_logic;
            
--------------------------
-- constant
-------------------------- 
--constant half_period : time := 0.005 ns;   --100 Mhz
constant half_period : time := 0.1 ms;   -- 10Khz

   
begin

    -- Aqui mapeamos o compomente

tst_clk : debounce
GENERIC map(
        fclk => 10_000,
        tdb => 20
    )
    PORT MAP(
        clk => clk ,
        btn_in => btn_in,
        btn_out => btn_out
);


            
--------------------------
-- clk
--------------------------
process
begin
    clk <= not clk;
    wait for 1 ms;  -- meio periodo
    clk <= not clk;
    wait for 1 ms; 
wait;
end process;

--------------------------
-- btn_in 
--------------------------
process
begin

wait;
end process;


end Behavioral;