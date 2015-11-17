----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2015 21:17:20
-- Design Name: 
-- Module Name: aula4 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aula4 is

    generic(
        fclk : natural := 100; -- frequencia do clk (Mhz)
        f7s : natural := 100 -- frequencia de atualizacao dos displays (Hz)
    );


    Port (
        clk : in STD_LOGIC;
        btnCpuReset : in STD_LOGIC;
        led : out STD_LOGIC_VECTOR (15 downto 0);
        seg : out STD_LOGIC_VECTOR (6 downto 0) ;
        an : out STD_LOGIC_VECTOR (7 downto 0) ;
        dp : out STD_LOGIC
    );
end aula4;

architecture Behavioral of aula4 is

signal ss1_valor    : integer range 0 to 9 := 2;
signal seg_atual    : std_logic_vector(6 downto 0);   
signal counter      : integer range 0 to 100_000_000 := 0; 

begin

process(fclk)
begin
    if(rising_edge(fclk)) then
        if(btnCpuReset) then
        
        else
            if(counter>100_000_000)    
        end if;
    end if;

end process;

with ss1_valor select
    seg <=  "0111111" when 0,  --0
            "0000110" when 1,  --1
            "1101101" when 2,  --2
            "1001111" when 3,  --3
            "1100110" when 4,  --4
            "1101101" when 5,  --5
            "1111101" when 6,  --6
            "0000111" when 7,  --7
            "1111111" when 8,  --8
            "1110011" when others;  --9
     seg <= not seg_atual;
     an  <= "11111101";
      
end Behavioral;
