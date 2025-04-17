-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Thu, 10 Apr 2025 07:59:52 GMT
-- Request id : cfwk-fed377c2-67f77a78b6bfd

library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_counter is
end tb_clock_counter;

architecture tb of tb_clock_counter is

    component clock_counter
        port (houradd : in std_logic;
              minadd  : in std_logic;
              pulse   : in std_logic;
              clk   : in std_logic);
    end component;
    
    component clock_enable
        port ( clk : in STD_LOGIC;
              rst : in STD_LOGIC;
               pulse : out STD_LOGIC);
    end component;

    signal houradd : std_logic;
    signal minadd  : std_logic;
    signal pulse   : std_logic;
    signal clk : std_logic;
    signal rst : std_logic;
    

    constant TbPeriod : time := 1 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : clock_counter
    port map (houradd => houradd,
              minadd  => minadd,
              pulse   => pulse,
              
              clk   => clk);


      dut2 : clock_enable
        port map (clk =>clk,
                rst =>rst,
                pulse => pulse);       

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    --  ***EDIT*** Replace YOURCLOCKSIGNAL below by the name of your clock as I haven't guessed it
    clk <= TbClock;
    

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        houradd <= '0';
        minadd <= '0';
        

      

        -- ***EDIT*** Add stimuli here
        wait for 1000 * TbPeriod;
        --wait for 10000ms;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_clock_counter of tb_clock_counter is
    for tb
    end for;
end cfg_tb_clock_counter;
