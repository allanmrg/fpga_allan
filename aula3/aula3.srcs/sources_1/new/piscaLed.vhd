----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2015 19:30:21
-- Design Name: 
-- Module Name: pisca led - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity piscaLed is
    Port ( 
        -- Clk e rst
           clk : in STD_LOGIC;          -- 100Mhz
           btnCpuReset : in STD_LOGIC;  -- RST em '0'
           sw : out STD_LOGIC_VECTOR(15 DOWNTO 0);
           led : out STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
end piscaLed;

architecture Behavioral of piscaLed is

signal contador : integer range 0 to 100_000_000;
signal estadoLed : std_logic := '0';

begin
    
process(clk)
begin 
    if(rising_edge(clk)) then
        if(btnCpuReset = '0') then
           contador <= 0;
           estadoLed <= '0';
         else
            if(contador = 100_000_000) then
                estadoLed <= not estadoLed;     
                contador <= 0;  
            else
                contador <= contador + 1;
            end if;    
        end if;
     end if;
end process;


led(0) <= estadoLed;

end Behavioral;
