----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2025 09:46:34 AM
-- Design Name: 
-- Module Name: alarm - Behavioral
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

entity alarm is
    Port ( houradd : in STD_LOGIC;
           minadd : in STD_LOGIC;
           set : in STD_LOGIC;
           clk : in STD_LOGIC;
           min_in : in std_logic_vector(6 downto 0);
           hour_in : in std_logic_vector(6 downto 0);
           hour_al: out std_logic_vector (6 downto 0);
           min_al: out std_logic_vector (6 downto 0);
           alarm: out std_logic
           );
end alarm;

architecture Behavioral of alarm is
signal min : unsigned (6 downto 0) := (others => '0');
signal hour : unsigned (6 downto 0) := (others => '0');
begin
    process(clk) begin
    if rising_edge(clk) then
        if minadd = '1' then
            min <= min+1;
        end if;
        if houradd = '1' then
            hour <= hour+1;
        end if;
        if min_in = min then
            alarm <= '1' ;
        end if;

   end if;

end process;

    hour_al <= std_logic_vector(hour);
    min_al <= std_logic_vector(min);
end Behavioral;
