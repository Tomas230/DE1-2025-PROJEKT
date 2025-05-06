----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/10/2025 09:10:18 AM
-- Design Name: 
-- Module Name: clock_counter - Behavioral
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

entity clock_counter is

    Port ( houradd : in STD_LOGIC;
           minadd : in STD_LOGIC;
           set : in STD_LOGIC;
           pulse : in STD_LOGIC;
           clk : in STD_LOGIC;
           hour_out: out std_logic_vector (6 downto 0);
           min_out: out std_logic_vector (6 downto 0)
           );
end clock_counter;

architecture Behavioral of clock_counter is
signal min_count : integer range 0 to 60;
signal min : unsigned (6 downto 0) := (others => '0') ;
signal hour : unsigned (6 downto 0) := (others => '0');
begin

    process(clk) begin
    if rising_edge(clk) then
        if pulse = '1' then
            min_count <= min_count+1;
            if min_count = 60 then
                min <= min+1;
                min_count <= 0;
            end if;
            if min = 60 then
                hour <= hour+1;
                min <= (others => '0');
            end if;
            
        end if;
        if set = '0' then
        if minadd = '1' then
            min <= min+1;
        end if;
        if houradd = '1' then
            hour <= hour+1;
        end if;
        end if;
        end if;
    end process;
    
    hour_out <= std_logic_vector(hour);
    min_out <= std_logic_vector(min);
end Behavioral;
