-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Thu, 24 Apr 2025 07:39:40 GMT
-- Request id : cfwk-fed377c2-6809eabc8b04a

library ieee;
use ieee.std_logic_1164.all;

entity tb_alarm is
end tb_alarm;

architecture tb of tb_alarm is

    component alarm
        port (houradd   : in std_logic;
              minadd    : in std_logic;
              set       : in std_logic;
              al_enable : in std_logic;
              clk       : in std_logic;
              min_in    : in std_logic_vector (6 downto 0);
              hour_in   : in std_logic_vector (6 downto 0);
              hour_al   : out std_logic_vector (6 downto 0);
              min_al    : out std_logic_vector (6 downto 0);
              alarmd     : out std_logic);
    end component;

    signal houradd   : std_logic;
    signal minadd    : std_logic;
    signal set       : std_logic;
    signal al_enable : std_logic;
    signal clk       : std_logic;
    signal min_in    : std_logic_vector (6 downto 0);
    signal hour_in   : std_logic_vector (6 downto 0);
    signal hour_al   : std_logic_vector (6 downto 0);
    signal min_al    : std_logic_vector (6 downto 0);
    signal alarmd     : std_logic;

    constant TbPeriod : time := 10 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : alarm
    port map (houradd   => houradd,
              minadd    => minadd,
              set       => set,
              al_enable => al_enable,
              clk       => clk,
              min_in    => min_in,
              hour_in   => hour_in,
              hour_al   => hour_al,
              min_al    => min_al,
              alarmd     => alarmd);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that clk is really your main clock signal
    clk <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        houradd <= '0';
        minadd <= '0';
        set <= '1';
        al_enable <= '1';
        min_in <= "0010000";
        hour_in <= "0000000";
        

        -- Reset generation
        --  ***EDIT*** Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        --YOURRESETSIGNAL <= '1';
       -- wait for 100 ns;
        --YOURRESETSIGNAL <= '0';
        --wait for 100 ns;

        -- ***EDIT*** Add stimuli here
        wait for 100 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_alarm of tb_alarm is
    for tb
    end for;
end cfg_tb_alarm;
