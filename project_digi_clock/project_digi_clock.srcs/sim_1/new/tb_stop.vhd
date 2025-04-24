-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Thu, 24 Apr 2025 08:10:34 GMT
-- Request id : cfwk-fed377c2-6809f1fa7b9c9

library ieee;
use ieee.std_logic_1164.all;

entity tb_clock_counter is
end tb_clock_counter;

architecture tb of tb_clock_counter is

    component clock_counter
        port (pulse   : in std_logic;
              clk     : in std_logic;
              min_out : out std_logic_vector (6 downto 0);
              set     : in std_logic;
              sec_out : out std_logic_vector (6 downto 0));
    end component;

    signal pulse   : std_logic;
    signal clk     : std_logic;
    signal min_out : std_logic_vector (6 downto 0);
    signal set     : std_logic;
    signal sec_out : std_logic_vector (6 downto 0);

    constant TbPeriod : time := 10 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : clock_counter
    port map (pulse   => pulse,
              clk     => clk,
              min_out => min_out,
              set     => set,
              sec_out => sec_out);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        pulse <= '0';
        set <= '0';

        -- Reset generation
        --  ***EDIT*** Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
       -- clk <= '1';
        --wait for 1 ns;
        --clk <= '0';
        --wait for 1 ns;

        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

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
