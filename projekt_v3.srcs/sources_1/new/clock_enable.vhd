----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2025 09:53:35 AM
-- Design Name: 
-- Module Name: clock_enable - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clock_enable is
    generic (
        N_PERIODS : integer := 10
    );
    Port ( clk : in STD_LOGIC;
           rst : in STD_LOGIC;
           pulse : out STD_LOGIC);
end clock_enable;


architecture Behavioral of clock_enable is
    signal sig_count : positive range 1 to N_PERIODS;
begin

    p_clk_enable : process(clk) begin
        if rising_edge(clk) then
            pulse <= '0';
            if rst = '1' then
                sig_count <= 1;
            else
                if sig_count = N_PERIODS then
                    pulse <= '1';
                    sig_count <= 1;
                else
                    sig_count <= sig_count+1;
                end if;
            end if;
        end if;
    end process;
    
    
end Behavioral;

