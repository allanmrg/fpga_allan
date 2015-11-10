----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09.11.2015 21:26:23
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity aula4 is
    Port ( 
    
    -- Clk e rst
           clk : in STD_LOGIC;          -- 100Mhz
           btnCpuReset : in STD_LOGIC;  -- RST em '0'
           
       -- IOs    
           sw : in STD_LOGIC_VECTOR(15 DOWNTO 0);
           led : out STD_LOGIC_VECTOR(15 DOWNTO 0)
           );
end aula4;

architecture Behavioral of aula4 is


signal in_mux :  std_logic_vector(2 downto 0);
signal ss_mux :  std_logic_vector(1 downto 0);
signal out_mux : std_logic;
signal out_mux1 : std_logic;


begin


    --Sequencial
    process(ss_mux,in_mux)
    begin
        if(ss_mux = "00") then
            out_mux <= in_mux(0);
        elsif(ss_mux = "01") then
            out_mux <= in_mux(1);
        else
            out_mux <= in_mux(2);
        end if;
    end process;
    
    
    process(ss_mux,in_mux)
    begin
        case ss_mux is
            when "00"   => out_mux1 <= in_mux(0);
            when "01"   => out_mux1 <= in_mux(1);
            when others => out_mux1 <= in_mux(2); 
        end case;
    end process;
    
    
    -- Concorrente
    ss_mux <= sw(4 downto 3);
    in_mux <= sw(2 downto 0);
    led(0) <=  out_mux;
    led(1) <=  out_mux1;
    

end Behavioral;
