--Copyright 1986-2014 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2014.1 (win64) Build 881834 Fri Apr  4 14:15:54 MDT 2014
--Date        : Mon Nov 23 20:19:34 2015
--Host        : J309-B3 running 64-bit Service Pack 1  (build 7601)
--Command     : generate_target microblazer_wrapper.bd
--Design      : microblazer_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity microblazer_wrapper is
  port (
    clk_in1 : in STD_LOGIC;
    gpio_led_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    gpio_sw_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    reset : in STD_LOGIC
  );
end microblazer_wrapper;

architecture STRUCTURE of microblazer_wrapper is
  component microblazer is
  port (
    clk_in1 : in STD_LOGIC;
    reset : in STD_LOGIC;
    GPIO_LED_tri_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    GPIO_SW_tri_i : in STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  end component microblazer;
begin
microblazer_i: component microblazer
    port map (
      GPIO_LED_tri_o(15 downto 0) => gpio_led_tri_o(15 downto 0),
      GPIO_SW_tri_i(15 downto 0) => gpio_sw_tri_i(15 downto 0),
      clk_in1 => clk_in1,
      reset => reset
    );
end STRUCTURE;
