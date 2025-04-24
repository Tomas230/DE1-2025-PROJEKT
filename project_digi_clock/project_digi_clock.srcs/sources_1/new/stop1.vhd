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

entity stop1 is

    Port ( 
           pulse : in STD_LOGIC;
           clk : in STD_LOGIC;
           min_out: out std_logic_vector (6 downto 0);
           set : in STD_LOGIC;
           sec_out: out std_logic_vector (6 downto 0)
           );
end stop1;

architecture Behavioral of stop1 is
signal sec_count : positive range 1 to 60000;
signal sec : unsigned (6 downto 0) := (others => '0') ;
signal min : unsigned (6 downto 0) := (others => '0');
begin

    process(clk) begin
    if rising_edge(clk) then
    if set = '0' then
        if pulse = '1' then
            sec_count <= sec_count+1;
            if sec_count = 60 then
                sec <= sec+1;
                sec_count <= 0;
            end if;
            if sec = 60 then
                min <= min+1;
                sec <= (others => '0');
            end if;
            --if min = 60 then
            --min = 0;
            --end if
            end if;
        end if;
        end if;
    end process;
    
    min_out <= std_logic_vector(min);
    sec_out <= std_logic_vector(sec);
end Behavioral;

