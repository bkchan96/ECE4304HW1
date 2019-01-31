----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/30/2019 06:23:54 PM
-- Design Name: 
-- Module Name: AddSub - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AddSub is
    Port ( a, b : in unsigned (3 downto 0);
           op : in STD_LOGIC;
           s : out unsigned (3 downto 0);
           cout, ov : out STD_LOGIC);
end AddSub;

architecture Behavioral of AddSub is
    signal sum : unsigned (4 downto 0);
begin
    with op select
        sum <= ('0' & a) + ('0' & b) when '0',
               ('0' & a) - ('0' & b) when '1',
               "-----" when others;
    s <= sum(3 downto 0);
    cout <= sum(4);
    ov <= sum(4) xor sum(3);
end Behavioral;
