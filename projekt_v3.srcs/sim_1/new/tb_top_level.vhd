-- Testbench automatically generated online
-- at https://vhdl.lapinoo.net
-- Generation date : Tue, 06 May 2025 15:57:57 GMT
-- Request id : cfwk-fed377c2-681a3185a25ff

library ieee;
use ieee.std_logic_1164.all;

entity tb_top_level is
end tb_top_level;

architecture tb of tb_top_level is

    component top_level
        port (BTNL      : in std_logic;
              CLK100MHZ : in std_logic;
              BTNC      : in std_logic;
              BTNU      : in std_logic;
              SW        : in std_logic_vector (2-1 downto 0);
              LED       : out std_logic_vector (1-1 downto 0));
    end component;

    signal BTNL      : std_logic;
    signal CLK100MHZ : std_logic;
    signal BTNC      : std_logic;
    signal BTNU      : std_logic;
    signal SW        : std_logic_vector (2-1 downto 0);
    signal LED       : std_logic_vector (1-1 downto 0);

    constant TbPeriod : time := 1 ns; -- ***EDIT*** Put right period here
    signal TbClock : std_logic := '0';
    signal TbSimEnded : std_logic := '0';

begin

    dut : top_level
    port map (BTNL      => BTNL,
              CLK100MHZ => CLK100MHZ,
              BTNC      => BTNC,
              BTNU      => BTNU,
              SW        => SW,
              LED       => LED);

    -- Clock generation
    TbClock <= not TbClock after TbPeriod/2 when TbSimEnded /= '1' else '0';

    -- ***EDIT*** Check that CLK100MHZ is really your main clock signal
    CLK100MHZ <= TbClock;

    stimuli : process
    begin
        -- ***EDIT*** Adapt initialization as needed
        BTNL <= '0';
        BTNC <= '0';
        BTNU <= '0';
        --SW <= (others => '0');
        SW(0) <= '1';
        SW(1) <= '1';
        wait for 95ns;
        BTNC <= '1';
        wait for 1ns;
        BTNC <= '0';
        wait for 95ns;
        BTNU <= '1';
        wait for 1ns;
        BTNU <= '0';

        -- Reset generation
        --  ***EDIT*** Replace YOURRESETSIGNAL below by the name of your reset as I haven't guessed it
        --YOURRESETSIGNAL <= '1';
        --wait for 100 ns;
        --YOURRESETSIGNAL <= '0';
        --wait for 100 ns;

        -- ***EDIT*** Add stimuli here
        wait for 10000 * TbPeriod;

        -- Stop the clock and hence terminate the simulation
        TbSimEnded <= '1';
        wait;
    end process;

end tb;

-- Configuration block below is required by some simulators. Usually no need to edit.

configuration cfg_tb_top_level of tb_top_level is
    for tb
    end for;
end cfg_tb_top_level;

--begin


--end Behavioral;
