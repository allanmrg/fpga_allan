----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.11.2015 20:26:26
-- Design Name: 
-- Module Name: toplevel - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
    Port ( clk : in STD_LOGIC;
           btnCpuReset : in STD_LOGIC;
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end toplevel;

architecture Behavioral of toplevel is

-- declarando componente do microprocessador
component microblazer_wrapper is
  port (
    clk_in1 : in STD_LOGIC;
     gpio_led_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_sw_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC
  );
end component;

component debounce is
    port(
        clk     : in STD_LOGIC;
        btn_in  : in STD_LOGIC;
        btn_out : out STD_LOGIC
    );
end component;

signal rst_interno  : std_logic := '0';
signal sw_internal  : std_logic_vector(15 downto 0);

begin

-- Rst interno é borda de subida, rst externo é borda de descida!
rst_interno <= not btnCpuReset;


u1 : microblazer_wrapper 
    port map(
        clk_in1          => clk,
        gpio_led_tri_o   => led,
        gpio_sw_tri_i    => sw,
        reset            => rst_interno    
    );
    
gen_deb : for n in 0 to 15 generate
    debx : debounce
        port map(
            clk     => clk,
            btn_in  => sw(n),
            btn_out => sw_internal(n)
        );
end generate gen_deb;

end Behavioral;
