-- lab62soc_mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo.vhd

-- This file was auto-generated from altera_mm_interconnect_hw.tcl.  If you edit it your changes
-- will probably be lost.
-- 
-- Generated using ACDS version 17.1 590

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab62soc_mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo is
	generic (
		SYMBOLS_PER_BEAT    : integer := 1;
		BITS_PER_SYMBOL     : integer := 107;
		FIFO_DEPTH          : integer := 2;
		CHANNEL_WIDTH       : integer := 0;
		ERROR_WIDTH         : integer := 0;
		USE_PACKETS         : integer := 1;
		USE_FILL_LEVEL      : integer := 0;
		EMPTY_LATENCY       : integer := 1;
		USE_MEMORY_BLOCKS   : integer := 0;
		USE_STORE_FORWARD   : integer := 0;
		USE_ALMOST_FULL_IF  : integer := 0;
		USE_ALMOST_EMPTY_IF : integer := 0
	);
	port (
		clk               : in  std_logic                      := '0';             --       clk.clk
		reset             : in  std_logic                      := '0';             -- clk_reset.reset
		in_data           : in  std_logic_vector(106 downto 0) := (others => '0'); --        in.data
		in_valid          : in  std_logic                      := '0';             --          .valid
		in_ready          : out std_logic;                                         --          .ready
		in_startofpacket  : in  std_logic                      := '0';             --          .startofpacket
		in_endofpacket    : in  std_logic                      := '0';             --          .endofpacket
		out_data          : out std_logic_vector(106 downto 0);                    --       out.data
		out_valid         : out std_logic;                                         --          .valid
		out_ready         : in  std_logic                      := '0';             --          .ready
		out_startofpacket : out std_logic;                                         --          .startofpacket
		out_endofpacket   : out std_logic;                                         --          .endofpacket
		almost_empty_data : out std_logic;
		almost_full_data  : out std_logic;
		csr_address       : in  std_logic_vector(1 downto 0)   := (others => '0');
		csr_read          : in  std_logic                      := '0';
		csr_readdata      : out std_logic_vector(31 downto 0);
		csr_write         : in  std_logic                      := '0';
		csr_writedata     : in  std_logic_vector(31 downto 0)  := (others => '0');
		in_channel        : in  std_logic_vector(0 downto 0)   := (others => '0');
		in_empty          : in  std_logic_vector(0 downto 0)   := (others => '0');
		in_error          : in  std_logic_vector(0 downto 0)   := (others => '0');
		out_channel       : out std_logic_vector(0 downto 0);
		out_empty         : out std_logic_vector(0 downto 0);
		out_error         : out std_logic_vector(0 downto 0)
	);
end entity lab62soc_mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo;

architecture rtl of lab62soc_mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo is
	component altera_avalon_sc_fifo is
		generic (
			SYMBOLS_PER_BEAT    : integer := 1;
			BITS_PER_SYMBOL     : integer := 8;
			FIFO_DEPTH          : integer := 16;
			CHANNEL_WIDTH       : integer := 0;
			ERROR_WIDTH         : integer := 0;
			USE_PACKETS         : integer := 0;
			USE_FILL_LEVEL      : integer := 0;
			EMPTY_LATENCY       : integer := 3;
			USE_MEMORY_BLOCKS   : integer := 1;
			USE_STORE_FORWARD   : integer := 0;
			USE_ALMOST_FULL_IF  : integer := 0;
			USE_ALMOST_EMPTY_IF : integer := 0
		);
		port (
			clk               : in  std_logic                      := 'X';             -- clk
			reset             : in  std_logic                      := 'X';             -- reset
			in_data           : in  std_logic_vector(106 downto 0) := (others => 'X'); -- data
			in_valid          : in  std_logic                      := 'X';             -- valid
			in_ready          : out std_logic;                                         -- ready
			in_startofpacket  : in  std_logic                      := 'X';             -- startofpacket
			in_endofpacket    : in  std_logic                      := 'X';             -- endofpacket
			out_data          : out std_logic_vector(106 downto 0);                    -- data
			out_valid         : out std_logic;                                         -- valid
			out_ready         : in  std_logic                      := 'X';             -- ready
			out_startofpacket : out std_logic;                                         -- startofpacket
			out_endofpacket   : out std_logic;                                         -- endofpacket
			csr_address       : in  std_logic_vector(1 downto 0)   := (others => 'X'); -- address
			csr_read          : in  std_logic                      := 'X';             -- read
			csr_write         : in  std_logic                      := 'X';             -- write
			csr_readdata      : out std_logic_vector(31 downto 0);                     -- readdata
			csr_writedata     : in  std_logic_vector(31 downto 0)  := (others => 'X'); -- writedata
			almost_full_data  : out std_logic;                                         -- data
			almost_empty_data : out std_logic;                                         -- data
			in_empty          : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- empty
			out_empty         : out std_logic_vector(0 downto 0);                      -- empty
			in_error          : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- error
			out_error         : out std_logic_vector(0 downto 0);                      -- error
			in_channel        : in  std_logic_vector(0 downto 0)   := (others => 'X'); -- channel
			out_channel       : out std_logic_vector(0 downto 0)                       -- channel
		);
	end component altera_avalon_sc_fifo;

begin

	jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo : component altera_avalon_sc_fifo
		generic map (
			SYMBOLS_PER_BEAT    => SYMBOLS_PER_BEAT,
			BITS_PER_SYMBOL     => BITS_PER_SYMBOL,
			FIFO_DEPTH          => FIFO_DEPTH,
			CHANNEL_WIDTH       => CHANNEL_WIDTH,
			ERROR_WIDTH         => ERROR_WIDTH,
			USE_PACKETS         => USE_PACKETS,
			USE_FILL_LEVEL      => USE_FILL_LEVEL,
			EMPTY_LATENCY       => EMPTY_LATENCY,
			USE_MEMORY_BLOCKS   => USE_MEMORY_BLOCKS,
			USE_STORE_FORWARD   => USE_STORE_FORWARD,
			USE_ALMOST_FULL_IF  => USE_ALMOST_FULL_IF,
			USE_ALMOST_EMPTY_IF => USE_ALMOST_EMPTY_IF
		)
		port map (
			clk               => clk,                                --       clk.clk
			reset             => reset,                              -- clk_reset.reset
			in_data           => in_data,                            --        in.data
			in_valid          => in_valid,                           --          .valid
			in_ready          => in_ready,                           --          .ready
			in_startofpacket  => in_startofpacket,                   --          .startofpacket
			in_endofpacket    => in_endofpacket,                     --          .endofpacket
			out_data          => out_data,                           --       out.data
			out_valid         => out_valid,                          --          .valid
			out_ready         => out_ready,                          --          .ready
			out_startofpacket => out_startofpacket,                  --          .startofpacket
			out_endofpacket   => out_endofpacket,                    --          .endofpacket
			csr_address       => "00",                               -- (terminated)
			csr_read          => '0',                                -- (terminated)
			csr_write         => '0',                                -- (terminated)
			csr_readdata      => open,                               -- (terminated)
			csr_writedata     => "00000000000000000000000000000000", -- (terminated)
			almost_full_data  => open,                               -- (terminated)
			almost_empty_data => open,                               -- (terminated)
			in_empty          => "0",                                -- (terminated)
			out_empty         => open,                               -- (terminated)
			in_error          => "0",                                -- (terminated)
			out_error         => open,                               -- (terminated)
			in_channel        => "0",                                -- (terminated)
			out_channel       => open                                -- (terminated)
		);

end architecture rtl; -- of lab62soc_mm_interconnect_0_jtag_uart_0_avalon_jtag_slave_agent_rsp_fifo
