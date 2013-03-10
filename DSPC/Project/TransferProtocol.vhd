library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TransferProtocol is
	generic(
		dataSize 	: natural := 32; -- bits der overføres
		);
		
	port(
		-- Avalon Interface
		csi_clockreset_clk     : in  std_logic;                     -- Avalon Clk
		csi_clockreset_reset_n : in  std_logic;                     -- Avalon Reset
		avs_s1_write           : in  std_logic;                     -- Avalon wr
		avs_s1_read            : in  std_logic;                     -- Avalon rd
		avs_s1_chipselect      : in  std_logic;                     -- Avalon cs
		avs_s1_address         : in  std_logic_vector(7 downto 0);  -- Avalon address
		avs_s1_writedata       : in  std_logic_vector(dataSize-1 downto 0);  -- Avalon wr data, previous 15 downto 0
		avs_s1_readdata        : out std_logic_vector(dataSize-1 downto 0);  -- Avalon rd data, previous 15 downto 0
	
		count		: in  std_logic_vector(8 downto 0); 	-- Value = Max 220 Hz -> 48000 Hz/220 Hz = 218.182 (highest value) -> 8 bit <=> 256
		sample		: in  std_logic_vector(23 downto 0); 	-- Sample value to store
		ack			: out std_logic; 						-- Ach send back to computer
		ramValue	: out std_logic_vector(23 downto 0) 	-- Value sent 
		);
end entity TransferProtocol;

architecture protocol of TransferProtocol is
	signal lastValue : std_logic_vector(8 downto 0);
	signal index : unsigned := 0;
	
begin

	process(clk) 
	begin	
		if count /= lastValue then
			if index /= count then 
				ramValue(index) <= sample; --Write value
				index <= index + 1; --Increment
			end if;
		end if;
	end process;
end protocol;