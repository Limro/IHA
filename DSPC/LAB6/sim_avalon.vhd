library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package sim_avalon is

  procedure avalon_mm_write (
    constant write_wait_time : in  integer;
    constant wr_addr         : in  std_logic_vector(7 downto 0);
    constant wr_data         : in  std_logic_vector(15 downto 0);
    signal avs_s1_clk        : in  std_logic;
    signal avs_s1_cs         : out std_logic;
    signal avs_s1_write      : out std_logic;
    signal avs_s1_address    : out std_logic_vector(7 downto 0);
    signal avs_s1_writedata  : out std_logic_vector(15 downto 0));

  procedure avalon_mm_read (
    constant read_wait_time : in  integer;
    constant rd_addr        : in  std_logic_vector(7 downto 0);
    signal avs_s1_clk       : in  std_logic;
    signal avs_s1_cs        : out std_logic;
    signal avs_s1_read      : out std_logic;
    signal avs_s1_address   : out std_logic_vector(7 downto 0);
    signal avs_s1_readdata  : in  std_logic_vector(15 downto 0));

end sim_avalon;

package body sim_avalon is
  
  procedure avalon_mm_write (
    constant write_wait_time : in  integer;
    constant wr_addr         : in  std_logic_vector(7 downto 0);
    constant wr_data         : in  std_logic_vector(15 downto 0);
    signal avs_s1_clk        : in  std_logic;
    signal avs_s1_cs         : out std_logic;
    signal avs_s1_write      : out std_logic;
    signal avs_s1_address    : out std_logic_vector(7 downto 0);
    signal avs_s1_writedata  : out std_logic_vector(15 downto 0)) is

  begin
    
    wait until avs_s1_clk = '1';
    avs_s1_address   <= wr_addr;
    avs_s1_writedata <= wr_data;
    avs_s1_write     <= '1';
    avs_s1_cs        <= '1';

    for i in 0 to write_wait_time-1 loop
      wait until avs_s1_clk = '1';
    end loop;  -- i

    avs_s1_address   <= (others => '0');
    avs_s1_writedata <= (others => 'Z');
    avs_s1_write     <= '0';
    avs_s1_cs        <= '0';
    
  end avalon_mm_write;
  
  
  procedure avalon_mm_read (
    constant read_wait_time : in  integer;
    constant rd_addr        : in  std_logic_vector(7 downto 0);
    signal avs_s1_clk       : in  std_logic;
    signal avs_s1_cs        : out std_logic;
    signal avs_s1_read      : out std_logic;
    signal avs_s1_address   : out std_logic_vector(7 downto 0);
    signal avs_s1_readdata  : in  std_logic_vector(15 downto 0)) is

  begin

    wait until avs_s1_clk = '1';
    avs_s1_address <= rd_addr;
    avs_s1_read    <= '1';
    avs_s1_cs      <= '1';

    for i in 0 to read_wait_time-1 loop
      wait until avs_s1_clk = '1';
    end loop;  -- i

    wait for 5 ns;

    report "Avalon Read: D= " & integer'image(to_integer(unsigned(avs_s1_readdata))) &
      " @ A= " & integer'image(to_integer(unsigned(rd_addr))) severity note;

    avs_s1_address <= (others => '0');
    avs_s1_read    <= '0';
    avs_s1_cs      <= '0';
    
  end avalon_mm_read;

end sim_avalon;
