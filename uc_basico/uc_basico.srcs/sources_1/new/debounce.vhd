LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;
	
entity debounce is
generic(
	fclk : natural := 100_000_000; -- frequencia do clk 
	tdb  : natural := 100   -- debounce time (ms)
);
port(
	clk     : in STD_LOGIC;
	btn_in  : in STD_LOGIC;
	btn_out : out STD_LOGIC
);
end debounce;
	
ARCHITECTURE rtl OF debounce IS

    constant cnt_ms : integer   := fclk*tdb/1000;
    signal   trans  : std_logic := '0';
    signal   cnt    : integer range 0 to cnt_ms; 

BEGIN

    process(clk)
    begin

        if(trans = '0') then           
            if( btn_in = '1') then      -- detecta transicao
                trans <= '1';           -- transicao detectada
            else
                trans <= '0';           -- transicao n detectada
            end if;
            
            btn_out <= '0';
            cnt <= 0;        
            
        else -- detectou transicao inicial de estado para '1'           
            if (cnt >= cnt_ms) then     -- estorou do tempo
                if ( btn_in = '1') then -- confirmado aperto do botao
                    btn_out <= '1';     -- ativa saida
                else                    -- aperto nao confirmado
                    cnt     <= 0;       -- zera contador
                    trans   <= '0';     -- volta para o estado inicial
                    btn_out <= '0';     -- zera saida
                end if;
            else                        -- inclementa cnt para gastar tempo
                cnt     <= cnt + 1;       
            end if;
            
        end if;
        
        
    
    end process;

END rtl;