----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/24/2025 10:37:30 AM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( BTNL : in STD_LOGIC; --rst
           CLK100MHZ : in STD_LOGIC; --clk
           BTNC : in STD_LOGIC; --hour_adder
           BTNU : in STD_LOGIC; --minute_adder
           --set : in STD_LOGIC; --set
           SW : in STD_LOGIC_VECTOR(2-1 downto 0);  --al_enable
             -- set SW[0]
             -- al_enable SW[1]
           --segment : out STD_LOGIC_VECTOR (7 downto 0);
           --anode : out STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR(1-1 downto 0); --alarmd
           
           hour_out : out std_logic_vector(6 downto 0);
           min_out : out std_logic_vector(6 downto 0);
           hour_al : out std_logic_vector(6 downto 0);
           min_al : out std_logic_vector(6 downto 0);
           min_stop : out std_logic_vector(6 downto 0);
           sec_stop : out std_logic_vector(6 downto 0)
           );
           
           
end top_level;

architecture Behavioral of top_level is

signal pulse : STD_LOGIC;
signal hour : std_logic_vector(6 downto 0);
signal min : std_logic_vector(6 downto 0);
--signal hour_al : std_logic_vector(6 downto 0);
--signal min_al : std_logic_vector(6 downto 0);
--signal min_stop : std_logic_vector(6 downto 0);
--signal sec_stop : std_logic_vector(6 downto 0);

begin

clock_enable : entity work.clock_enable
port map( Clk => CLK100MHZ,
          rst => BTNL,
          pulse => pulse
           );

clock_counter : entity work.clock_counter
    port map ( houradd => BTNC,
           minadd =>BTNU,
           pulse => pulse,
           set => SW(1),
           clk => CLK100MHZ,
           hour_out => hour,
           min_out => min
           );
           
alarm : entity work.alarm

    port map ( houradd => BTNC,
           minadd => BTNU,
           set => SW(1),
           al_enable => SW(0),
           clk => CLK100MHZ,
           min_in => min,
           hour_in => hour,
           hour_al => hour_al,
           min_al => min_al,
           alarmd => LED(0)
           );

stop : entity work.stop
    port map ( 
           pulse => pulse,
           clk => CLK100MHZ,
           min_out => min_stop,
           set => SW(1),
           sec_out => sec_stop
           );
           --min_out => min
end Behavioral;