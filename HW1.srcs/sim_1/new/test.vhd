----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2019 06:48:56 PM
-- Design Name: 
-- Module Name: test - Behavioral
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
use IEEE.numeric_std.ALL;
use std.env.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
    component AddSub
        Port( a, b : in unsigned (3 downto 0);
              op : in STD_LOGIC;
              s : out unsigned (3 downto 0);
              cout , ov : out STD_LOGIC);
    end component;
    signal a : unsigned (3 downto 0) := (others => '0');
    signal b : unsigned (3 downto 0) := (others => '0');
    signal op : std_logic := '0';
    signal s : unsigned (3 downto 0);
    signal ov : std_logic;
    signal cout : std_logic;
begin
    uut: AddSub PORT MAP (a, b, op, s, cout, ov);
    stim_proc: process
    begin
        wait for 1 ns;
        op<= '0'; a<= "0010"; b<= "0011"; wait for 1ns;  
        a<= "1110"; b<= "1101"; wait for 1ns;
        a<= "1000"; b<= "1000"; wait for 1ns;  
        a<= "0111"; b<= "0111"; wait for 1ns;
        op<= '1'; a<= "0010"; b<= "0011"; wait for 1ns;     
        a<= "1110"; b<= "1101"; wait for 1ns;
        a<= "1000"; b<= "1000"; wait for 1ns;
        a<= "0111"; b<= "0111"; wait for 1ns;     
        stop(0);
    end process;
end Behavioral;
