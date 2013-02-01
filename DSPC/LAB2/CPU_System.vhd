--megafunction wizard: %Altera SOPC Builder%
--GENERATION: STANDARD
--VERSION: WM1.0


--Legal Notice: (C)2013 Altera Corporation. All rights reserved.  Your
--use of Altera Corporation's design tools, logic functions and other
--software and tools, and its AMPP partner logic functions, and any
--output files any of the foregoing (including device programming or
--simulation files), and any associated documentation or information are
--expressly subject to the terms and conditions of the Altera Program
--License Subscription Agreement or other applicable license agreement,
--including, without limitation, that your use is for the sole purpose
--of programming logic devices manufactured by Altera and sold by Altera
--or its authorized distributors.  Please refer to the applicable
--agreement for further details.


-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU_System_clock_0_in_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_0_in_endofpacket : IN STD_LOGIC;
                 signal CPU_System_clock_0_in_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal CPU_System_clock_0_in_waitrequest : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_data_master_dbs_write_8 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal cpu_0_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal CPU_System_clock_0_in_address : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_endofpacket_from_sa : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_nativeaddress : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_read : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal CPU_System_clock_0_in_reset_n : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_waitrequest_from_sa : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_write : OUT STD_LOGIC;
                 signal CPU_System_clock_0_in_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal cpu_0_data_master_byteenable_CPU_System_clock_0_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_granted_CPU_System_clock_0_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_CPU_System_clock_0_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_CPU_System_clock_0_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_CPU_System_clock_0_in : OUT STD_LOGIC;
                 signal d1_CPU_System_clock_0_in_end_xfer : OUT STD_LOGIC
              );
end entity CPU_System_clock_0_in_arbitrator;


architecture europa of CPU_System_clock_0_in_arbitrator is
                signal CPU_System_clock_0_in_allgrants :  STD_LOGIC;
                signal CPU_System_clock_0_in_allow_new_arb_cycle :  STD_LOGIC;
                signal CPU_System_clock_0_in_any_bursting_master_saved_grant :  STD_LOGIC;
                signal CPU_System_clock_0_in_any_continuerequest :  STD_LOGIC;
                signal CPU_System_clock_0_in_arb_counter_enable :  STD_LOGIC;
                signal CPU_System_clock_0_in_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_0_in_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_0_in_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_0_in_beginbursttransfer_internal :  STD_LOGIC;
                signal CPU_System_clock_0_in_begins_xfer :  STD_LOGIC;
                signal CPU_System_clock_0_in_end_xfer :  STD_LOGIC;
                signal CPU_System_clock_0_in_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_0_in_grant_vector :  STD_LOGIC;
                signal CPU_System_clock_0_in_in_a_read_cycle :  STD_LOGIC;
                signal CPU_System_clock_0_in_in_a_write_cycle :  STD_LOGIC;
                signal CPU_System_clock_0_in_master_qreq_vector :  STD_LOGIC;
                signal CPU_System_clock_0_in_non_bursting_master_requests :  STD_LOGIC;
                signal CPU_System_clock_0_in_pretend_byte_enable :  STD_LOGIC;
                signal CPU_System_clock_0_in_reg_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_0_in_slavearbiterlockenable :  STD_LOGIC;
                signal CPU_System_clock_0_in_slavearbiterlockenable2 :  STD_LOGIC;
                signal CPU_System_clock_0_in_unreg_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_0_in_waits_for_read :  STD_LOGIC;
                signal CPU_System_clock_0_in_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_0 :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_1 :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_2 :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_3 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_CPU_System_clock_0_in :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_CPU_System_clock_0_in :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_CPU_System_clock_0_in_waitrequest_from_sa :  STD_LOGIC;
                signal internal_cpu_0_data_master_byteenable_CPU_System_clock_0_in :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_CPU_System_clock_0_in :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_CPU_System_clock_0_in :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_CPU_System_clock_0_in :  STD_LOGIC;
                signal wait_for_CPU_System_clock_0_in_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT CPU_System_clock_0_in_end_xfer;
    end if;

  end process;

  CPU_System_clock_0_in_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_CPU_System_clock_0_in);
  --assign CPU_System_clock_0_in_readdata_from_sa = CPU_System_clock_0_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  CPU_System_clock_0_in_readdata_from_sa <= CPU_System_clock_0_in_readdata;
  internal_cpu_0_data_master_requests_CPU_System_clock_0_in <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 1) & A_ToStdLogicVector(std_logic'('0'))) = std_logic_vector'("100000001000010010000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --assign CPU_System_clock_0_in_waitrequest_from_sa = CPU_System_clock_0_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_CPU_System_clock_0_in_waitrequest_from_sa <= CPU_System_clock_0_in_waitrequest;
  --CPU_System_clock_0_in_arb_share_counter set values, which is an e_mux
  CPU_System_clock_0_in_arb_share_set_values <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_CPU_System_clock_0_in)) = '1'), std_logic_vector'("00000000000000000000000000000100"), std_logic_vector'("00000000000000000000000000000001")), 3);
  --CPU_System_clock_0_in_non_bursting_master_requests mux, which is an e_mux
  CPU_System_clock_0_in_non_bursting_master_requests <= internal_cpu_0_data_master_requests_CPU_System_clock_0_in;
  --CPU_System_clock_0_in_any_bursting_master_saved_grant mux, which is an e_mux
  CPU_System_clock_0_in_any_bursting_master_saved_grant <= std_logic'('0');
  --CPU_System_clock_0_in_arb_share_counter_next_value assignment, which is an e_assign
  CPU_System_clock_0_in_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(CPU_System_clock_0_in_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (CPU_System_clock_0_in_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(CPU_System_clock_0_in_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (CPU_System_clock_0_in_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --CPU_System_clock_0_in_allgrants all slave grants, which is an e_mux
  CPU_System_clock_0_in_allgrants <= CPU_System_clock_0_in_grant_vector;
  --CPU_System_clock_0_in_end_xfer assignment, which is an e_assign
  CPU_System_clock_0_in_end_xfer <= NOT ((CPU_System_clock_0_in_waits_for_read OR CPU_System_clock_0_in_waits_for_write));
  --end_xfer_arb_share_counter_term_CPU_System_clock_0_in arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_CPU_System_clock_0_in <= CPU_System_clock_0_in_end_xfer AND (((NOT CPU_System_clock_0_in_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --CPU_System_clock_0_in_arb_share_counter arbitration counter enable, which is an e_assign
  CPU_System_clock_0_in_arb_counter_enable <= ((end_xfer_arb_share_counter_term_CPU_System_clock_0_in AND CPU_System_clock_0_in_allgrants)) OR ((end_xfer_arb_share_counter_term_CPU_System_clock_0_in AND NOT CPU_System_clock_0_in_non_bursting_master_requests));
  --CPU_System_clock_0_in_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_0_in_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(CPU_System_clock_0_in_arb_counter_enable) = '1' then 
        CPU_System_clock_0_in_arb_share_counter <= CPU_System_clock_0_in_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --CPU_System_clock_0_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_0_in_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((CPU_System_clock_0_in_master_qreq_vector AND end_xfer_arb_share_counter_term_CPU_System_clock_0_in)) OR ((end_xfer_arb_share_counter_term_CPU_System_clock_0_in AND NOT CPU_System_clock_0_in_non_bursting_master_requests)))) = '1' then 
        CPU_System_clock_0_in_slavearbiterlockenable <= or_reduce(CPU_System_clock_0_in_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master CPU_System_clock_0/in arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= CPU_System_clock_0_in_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --CPU_System_clock_0_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  CPU_System_clock_0_in_slavearbiterlockenable2 <= or_reduce(CPU_System_clock_0_in_arb_share_counter_next_value);
  --cpu_0/data_master CPU_System_clock_0/in arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= CPU_System_clock_0_in_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --CPU_System_clock_0_in_any_continuerequest at least one master continues requesting, which is an e_assign
  CPU_System_clock_0_in_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_CPU_System_clock_0_in <= internal_cpu_0_data_master_requests_CPU_System_clock_0_in AND NOT ((((cpu_0_data_master_read AND (NOT cpu_0_data_master_waitrequest))) OR (((((NOT cpu_0_data_master_waitrequest OR cpu_0_data_master_no_byte_enables_and_last_term) OR NOT(internal_cpu_0_data_master_byteenable_CPU_System_clock_0_in))) AND cpu_0_data_master_write))));
  --CPU_System_clock_0_in_writedata mux, which is an e_mux
  CPU_System_clock_0_in_writedata <= cpu_0_data_master_dbs_write_8;
  --assign CPU_System_clock_0_in_endofpacket_from_sa = CPU_System_clock_0_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  CPU_System_clock_0_in_endofpacket_from_sa <= CPU_System_clock_0_in_endofpacket;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_CPU_System_clock_0_in <= internal_cpu_0_data_master_qualified_request_CPU_System_clock_0_in;
  --cpu_0/data_master saved-grant CPU_System_clock_0/in, which is an e_assign
  cpu_0_data_master_saved_grant_CPU_System_clock_0_in <= internal_cpu_0_data_master_requests_CPU_System_clock_0_in;
  --allow new arb cycle for CPU_System_clock_0/in, which is an e_assign
  CPU_System_clock_0_in_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  CPU_System_clock_0_in_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  CPU_System_clock_0_in_master_qreq_vector <= std_logic'('1');
  --CPU_System_clock_0_in_reset_n assignment, which is an e_assign
  CPU_System_clock_0_in_reset_n <= reset_n;
  --CPU_System_clock_0_in_firsttransfer first transaction, which is an e_assign
  CPU_System_clock_0_in_firsttransfer <= A_WE_StdLogic((std_logic'(CPU_System_clock_0_in_begins_xfer) = '1'), CPU_System_clock_0_in_unreg_firsttransfer, CPU_System_clock_0_in_reg_firsttransfer);
  --CPU_System_clock_0_in_unreg_firsttransfer first transaction, which is an e_assign
  CPU_System_clock_0_in_unreg_firsttransfer <= NOT ((CPU_System_clock_0_in_slavearbiterlockenable AND CPU_System_clock_0_in_any_continuerequest));
  --CPU_System_clock_0_in_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_0_in_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(CPU_System_clock_0_in_begins_xfer) = '1' then 
        CPU_System_clock_0_in_reg_firsttransfer <= CPU_System_clock_0_in_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --CPU_System_clock_0_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  CPU_System_clock_0_in_beginbursttransfer_internal <= CPU_System_clock_0_in_begins_xfer;
  --CPU_System_clock_0_in_read assignment, which is an e_mux
  CPU_System_clock_0_in_read <= internal_cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_read;
  --CPU_System_clock_0_in_write assignment, which is an e_mux
  CPU_System_clock_0_in_write <= ((internal_cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_write)) AND CPU_System_clock_0_in_pretend_byte_enable;
  --CPU_System_clock_0_in_address mux, which is an e_mux
  CPU_System_clock_0_in_address <= Vector_To_Std_Logic(Std_Logic_Vector'(A_SRL(cpu_0_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")) & cpu_0_data_master_dbs_address(1 DOWNTO 0)));
  --slaveid CPU_System_clock_0_in_nativeaddress nativeaddress mux, which is an e_mux
  CPU_System_clock_0_in_nativeaddress <= Vector_To_Std_Logic(A_SRL(cpu_0_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")));
  --d1_CPU_System_clock_0_in_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_CPU_System_clock_0_in_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_CPU_System_clock_0_in_end_xfer <= CPU_System_clock_0_in_end_xfer;
    end if;

  end process;

  --CPU_System_clock_0_in_waits_for_read in a cycle, which is an e_mux
  CPU_System_clock_0_in_waits_for_read <= CPU_System_clock_0_in_in_a_read_cycle AND internal_CPU_System_clock_0_in_waitrequest_from_sa;
  --CPU_System_clock_0_in_in_a_read_cycle assignment, which is an e_assign
  CPU_System_clock_0_in_in_a_read_cycle <= internal_cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= CPU_System_clock_0_in_in_a_read_cycle;
  --CPU_System_clock_0_in_waits_for_write in a cycle, which is an e_mux
  CPU_System_clock_0_in_waits_for_write <= CPU_System_clock_0_in_in_a_write_cycle AND internal_CPU_System_clock_0_in_waitrequest_from_sa;
  --CPU_System_clock_0_in_in_a_write_cycle assignment, which is an e_assign
  CPU_System_clock_0_in_in_a_write_cycle <= internal_cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= CPU_System_clock_0_in_in_a_write_cycle;
  wait_for_CPU_System_clock_0_in_counter <= std_logic'('0');
  --CPU_System_clock_0_in_pretend_byte_enable byte enable port mux, which is an e_mux
  CPU_System_clock_0_in_pretend_byte_enable <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_CPU_System_clock_0_in)) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(internal_cpu_0_data_master_byteenable_CPU_System_clock_0_in))), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))));
  (cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_3, cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_2, cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_1, cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_0) <= cpu_0_data_master_byteenable;
  internal_cpu_0_data_master_byteenable_CPU_System_clock_0_in <= A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000000"))), cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_0, A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000001"))), cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_1, A_WE_StdLogic((((std_logic_vector'("000000000000000000000000000000") & (cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000010"))), cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_2, cpu_0_data_master_byteenable_CPU_System_clock_0_in_segment_3)));
  --vhdl renameroo for output signals
  CPU_System_clock_0_in_waitrequest_from_sa <= internal_CPU_System_clock_0_in_waitrequest_from_sa;
  --vhdl renameroo for output signals
  cpu_0_data_master_byteenable_CPU_System_clock_0_in <= internal_cpu_0_data_master_byteenable_CPU_System_clock_0_in;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_CPU_System_clock_0_in <= internal_cpu_0_data_master_granted_CPU_System_clock_0_in;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_CPU_System_clock_0_in <= internal_cpu_0_data_master_qualified_request_CPU_System_clock_0_in;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_CPU_System_clock_0_in <= internal_cpu_0_data_master_requests_CPU_System_clock_0_in;
--synthesis translate_off
    --CPU_System_clock_0/in enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity CPU_System_clock_0_out_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_0_out_address : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_read : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_write : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal clocks_0_avalon_clocks_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal d1_clocks_0_avalon_clocks_slave_end_xfer : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal CPU_System_clock_0_out_address_to_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_0_out_readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal CPU_System_clock_0_out_reset_n : OUT STD_LOGIC;
                 signal CPU_System_clock_0_out_waitrequest : OUT STD_LOGIC
              );
end entity CPU_System_clock_0_out_arbitrator;


architecture europa of CPU_System_clock_0_out_arbitrator is
                signal CPU_System_clock_0_out_address_last_time :  STD_LOGIC;
                signal CPU_System_clock_0_out_read_last_time :  STD_LOGIC;
                signal CPU_System_clock_0_out_run :  STD_LOGIC;
                signal CPU_System_clock_0_out_write_last_time :  STD_LOGIC;
                signal CPU_System_clock_0_out_writedata_last_time :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal internal_CPU_System_clock_0_out_address_to_slave :  STD_LOGIC;
                signal internal_CPU_System_clock_0_out_waitrequest :  STD_LOGIC;
                signal r_0 :  STD_LOGIC;

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave OR CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave) OR NOT CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave OR NOT CPU_System_clock_0_out_read) OR ((CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave AND CPU_System_clock_0_out_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave OR NOT ((CPU_System_clock_0_out_read OR CPU_System_clock_0_out_write)))))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((CPU_System_clock_0_out_read OR CPU_System_clock_0_out_write)))))))))));
  --cascaded wait assignment, which is an e_assign
  CPU_System_clock_0_out_run <= r_0;
  --optimize select-logic by passing only those address bits which matter.
  internal_CPU_System_clock_0_out_address_to_slave <= CPU_System_clock_0_out_address;
  --CPU_System_clock_0/out readdata mux, which is an e_mux
  CPU_System_clock_0_out_readdata <= clocks_0_avalon_clocks_slave_readdata_from_sa;
  --actual waitrequest port, which is an e_assign
  internal_CPU_System_clock_0_out_waitrequest <= NOT CPU_System_clock_0_out_run;
  --CPU_System_clock_0_out_reset_n assignment, which is an e_assign
  CPU_System_clock_0_out_reset_n <= reset_n;
  --vhdl renameroo for output signals
  CPU_System_clock_0_out_address_to_slave <= internal_CPU_System_clock_0_out_address_to_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_0_out_waitrequest <= internal_CPU_System_clock_0_out_waitrequest;
--synthesis translate_off
    --CPU_System_clock_0_out_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_0_out_address_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        CPU_System_clock_0_out_address_last_time <= CPU_System_clock_0_out_address;
      end if;

    end process;

    --CPU_System_clock_0/out waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_CPU_System_clock_0_out_waitrequest AND ((CPU_System_clock_0_out_read OR CPU_System_clock_0_out_write));
      end if;

    end process;

    --CPU_System_clock_0_out_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(CPU_System_clock_0_out_address) /= std_logic'(CPU_System_clock_0_out_address_last_time)))))) = '1' then 
          write(write_line, now);
          write(write_line, string'(": "));
          write(write_line, string'("CPU_System_clock_0_out_address did not heed wait!!!"));
          write(output, write_line.all);
          deallocate (write_line);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_0_out_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_0_out_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        CPU_System_clock_0_out_read_last_time <= CPU_System_clock_0_out_read;
      end if;

    end process;

    --CPU_System_clock_0_out_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line1 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(CPU_System_clock_0_out_read) /= std_logic'(CPU_System_clock_0_out_read_last_time)))))) = '1' then 
          write(write_line1, now);
          write(write_line1, string'(": "));
          write(write_line1, string'("CPU_System_clock_0_out_read did not heed wait!!!"));
          write(output, write_line1.all);
          deallocate (write_line1);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_0_out_write check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_0_out_write_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        CPU_System_clock_0_out_write_last_time <= CPU_System_clock_0_out_write;
      end if;

    end process;

    --CPU_System_clock_0_out_write matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line2 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(CPU_System_clock_0_out_write) /= std_logic'(CPU_System_clock_0_out_write_last_time)))))) = '1' then 
          write(write_line2, now);
          write(write_line2, string'(": "));
          write(write_line2, string'("CPU_System_clock_0_out_write did not heed wait!!!"));
          write(output, write_line2.all);
          deallocate (write_line2);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_0_out_writedata check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_0_out_writedata_last_time <= std_logic_vector'("00000000");
      elsif clk'event and clk = '1' then
        CPU_System_clock_0_out_writedata_last_time <= CPU_System_clock_0_out_writedata;
      end if;

    end process;

    --CPU_System_clock_0_out_writedata matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line3 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(((active_and_waiting_last_time AND to_std_logic(((CPU_System_clock_0_out_writedata /= CPU_System_clock_0_out_writedata_last_time)))) AND CPU_System_clock_0_out_write)) = '1' then 
          write(write_line3, now);
          write(write_line3, string'(": "));
          write(write_line3, string'("CPU_System_clock_0_out_writedata did not heed wait!!!"));
          write(output, write_line3.all);
          deallocate (write_line3);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU_System_clock_1_in_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_1_in_endofpacket : IN STD_LOGIC;
                 signal CPU_System_clock_1_in_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal CPU_System_clock_1_in_waitrequest : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal CPU_System_clock_1_in_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal CPU_System_clock_1_in_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal CPU_System_clock_1_in_endofpacket_from_sa : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_nativeaddress : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_read : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal CPU_System_clock_1_in_reset_n : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_waitrequest_from_sa : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_write : OUT STD_LOGIC;
                 signal CPU_System_clock_1_in_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_granted_CPU_System_clock_1_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_CPU_System_clock_1_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_CPU_System_clock_1_in : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_CPU_System_clock_1_in : OUT STD_LOGIC;
                 signal d1_CPU_System_clock_1_in_end_xfer : OUT STD_LOGIC
              );
end entity CPU_System_clock_1_in_arbitrator;


architecture europa of CPU_System_clock_1_in_arbitrator is
                signal CPU_System_clock_1_in_allgrants :  STD_LOGIC;
                signal CPU_System_clock_1_in_allow_new_arb_cycle :  STD_LOGIC;
                signal CPU_System_clock_1_in_any_bursting_master_saved_grant :  STD_LOGIC;
                signal CPU_System_clock_1_in_any_continuerequest :  STD_LOGIC;
                signal CPU_System_clock_1_in_arb_counter_enable :  STD_LOGIC;
                signal CPU_System_clock_1_in_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_in_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_in_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_in_beginbursttransfer_internal :  STD_LOGIC;
                signal CPU_System_clock_1_in_begins_xfer :  STD_LOGIC;
                signal CPU_System_clock_1_in_end_xfer :  STD_LOGIC;
                signal CPU_System_clock_1_in_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_1_in_grant_vector :  STD_LOGIC;
                signal CPU_System_clock_1_in_in_a_read_cycle :  STD_LOGIC;
                signal CPU_System_clock_1_in_in_a_write_cycle :  STD_LOGIC;
                signal CPU_System_clock_1_in_master_qreq_vector :  STD_LOGIC;
                signal CPU_System_clock_1_in_non_bursting_master_requests :  STD_LOGIC;
                signal CPU_System_clock_1_in_reg_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_1_in_slavearbiterlockenable :  STD_LOGIC;
                signal CPU_System_clock_1_in_slavearbiterlockenable2 :  STD_LOGIC;
                signal CPU_System_clock_1_in_unreg_firsttransfer :  STD_LOGIC;
                signal CPU_System_clock_1_in_waits_for_read :  STD_LOGIC;
                signal CPU_System_clock_1_in_waits_for_write :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_CPU_System_clock_1_in :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_CPU_System_clock_1_in :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_CPU_System_clock_1_in_waitrequest_from_sa :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_CPU_System_clock_1_in :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_CPU_System_clock_1_in :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_CPU_System_clock_1_in :  STD_LOGIC;
                signal shifted_address_to_CPU_System_clock_1_in_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_CPU_System_clock_1_in_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT CPU_System_clock_1_in_end_xfer;
    end if;

  end process;

  CPU_System_clock_1_in_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_CPU_System_clock_1_in);
  --assign CPU_System_clock_1_in_readdata_from_sa = CPU_System_clock_1_in_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  CPU_System_clock_1_in_readdata_from_sa <= CPU_System_clock_1_in_readdata;
  internal_cpu_0_data_master_requests_CPU_System_clock_1_in <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("100000001000010000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --assign CPU_System_clock_1_in_waitrequest_from_sa = CPU_System_clock_1_in_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_CPU_System_clock_1_in_waitrequest_from_sa <= CPU_System_clock_1_in_waitrequest;
  --CPU_System_clock_1_in_arb_share_counter set values, which is an e_mux
  CPU_System_clock_1_in_arb_share_set_values <= std_logic_vector'("001");
  --CPU_System_clock_1_in_non_bursting_master_requests mux, which is an e_mux
  CPU_System_clock_1_in_non_bursting_master_requests <= internal_cpu_0_data_master_requests_CPU_System_clock_1_in;
  --CPU_System_clock_1_in_any_bursting_master_saved_grant mux, which is an e_mux
  CPU_System_clock_1_in_any_bursting_master_saved_grant <= std_logic'('0');
  --CPU_System_clock_1_in_arb_share_counter_next_value assignment, which is an e_assign
  CPU_System_clock_1_in_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(CPU_System_clock_1_in_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (CPU_System_clock_1_in_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(CPU_System_clock_1_in_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (CPU_System_clock_1_in_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --CPU_System_clock_1_in_allgrants all slave grants, which is an e_mux
  CPU_System_clock_1_in_allgrants <= CPU_System_clock_1_in_grant_vector;
  --CPU_System_clock_1_in_end_xfer assignment, which is an e_assign
  CPU_System_clock_1_in_end_xfer <= NOT ((CPU_System_clock_1_in_waits_for_read OR CPU_System_clock_1_in_waits_for_write));
  --end_xfer_arb_share_counter_term_CPU_System_clock_1_in arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_CPU_System_clock_1_in <= CPU_System_clock_1_in_end_xfer AND (((NOT CPU_System_clock_1_in_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --CPU_System_clock_1_in_arb_share_counter arbitration counter enable, which is an e_assign
  CPU_System_clock_1_in_arb_counter_enable <= ((end_xfer_arb_share_counter_term_CPU_System_clock_1_in AND CPU_System_clock_1_in_allgrants)) OR ((end_xfer_arb_share_counter_term_CPU_System_clock_1_in AND NOT CPU_System_clock_1_in_non_bursting_master_requests));
  --CPU_System_clock_1_in_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_1_in_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(CPU_System_clock_1_in_arb_counter_enable) = '1' then 
        CPU_System_clock_1_in_arb_share_counter <= CPU_System_clock_1_in_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --CPU_System_clock_1_in_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_1_in_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((CPU_System_clock_1_in_master_qreq_vector AND end_xfer_arb_share_counter_term_CPU_System_clock_1_in)) OR ((end_xfer_arb_share_counter_term_CPU_System_clock_1_in AND NOT CPU_System_clock_1_in_non_bursting_master_requests)))) = '1' then 
        CPU_System_clock_1_in_slavearbiterlockenable <= or_reduce(CPU_System_clock_1_in_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master CPU_System_clock_1/in arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= CPU_System_clock_1_in_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --CPU_System_clock_1_in_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  CPU_System_clock_1_in_slavearbiterlockenable2 <= or_reduce(CPU_System_clock_1_in_arb_share_counter_next_value);
  --cpu_0/data_master CPU_System_clock_1/in arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= CPU_System_clock_1_in_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --CPU_System_clock_1_in_any_continuerequest at least one master continues requesting, which is an e_assign
  CPU_System_clock_1_in_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_CPU_System_clock_1_in <= internal_cpu_0_data_master_requests_CPU_System_clock_1_in AND NOT ((((cpu_0_data_master_read AND (NOT cpu_0_data_master_waitrequest))) OR (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write))));
  --CPU_System_clock_1_in_writedata mux, which is an e_mux
  CPU_System_clock_1_in_writedata <= cpu_0_data_master_writedata;
  --assign CPU_System_clock_1_in_endofpacket_from_sa = CPU_System_clock_1_in_endofpacket so that symbol knows where to group signals which may go to master only, which is an e_assign
  CPU_System_clock_1_in_endofpacket_from_sa <= CPU_System_clock_1_in_endofpacket;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_CPU_System_clock_1_in <= internal_cpu_0_data_master_qualified_request_CPU_System_clock_1_in;
  --cpu_0/data_master saved-grant CPU_System_clock_1/in, which is an e_assign
  cpu_0_data_master_saved_grant_CPU_System_clock_1_in <= internal_cpu_0_data_master_requests_CPU_System_clock_1_in;
  --allow new arb cycle for CPU_System_clock_1/in, which is an e_assign
  CPU_System_clock_1_in_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  CPU_System_clock_1_in_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  CPU_System_clock_1_in_master_qreq_vector <= std_logic'('1');
  --CPU_System_clock_1_in_reset_n assignment, which is an e_assign
  CPU_System_clock_1_in_reset_n <= reset_n;
  --CPU_System_clock_1_in_firsttransfer first transaction, which is an e_assign
  CPU_System_clock_1_in_firsttransfer <= A_WE_StdLogic((std_logic'(CPU_System_clock_1_in_begins_xfer) = '1'), CPU_System_clock_1_in_unreg_firsttransfer, CPU_System_clock_1_in_reg_firsttransfer);
  --CPU_System_clock_1_in_unreg_firsttransfer first transaction, which is an e_assign
  CPU_System_clock_1_in_unreg_firsttransfer <= NOT ((CPU_System_clock_1_in_slavearbiterlockenable AND CPU_System_clock_1_in_any_continuerequest));
  --CPU_System_clock_1_in_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_1_in_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(CPU_System_clock_1_in_begins_xfer) = '1' then 
        CPU_System_clock_1_in_reg_firsttransfer <= CPU_System_clock_1_in_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --CPU_System_clock_1_in_beginbursttransfer_internal begin burst transfer, which is an e_assign
  CPU_System_clock_1_in_beginbursttransfer_internal <= CPU_System_clock_1_in_begins_xfer;
  --CPU_System_clock_1_in_read assignment, which is an e_mux
  CPU_System_clock_1_in_read <= internal_cpu_0_data_master_granted_CPU_System_clock_1_in AND cpu_0_data_master_read;
  --CPU_System_clock_1_in_write assignment, which is an e_mux
  CPU_System_clock_1_in_write <= internal_cpu_0_data_master_granted_CPU_System_clock_1_in AND cpu_0_data_master_write;
  shifted_address_to_CPU_System_clock_1_in_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --CPU_System_clock_1_in_address mux, which is an e_mux
  CPU_System_clock_1_in_address <= A_EXT (A_SRL(shifted_address_to_CPU_System_clock_1_in_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --slaveid CPU_System_clock_1_in_nativeaddress nativeaddress mux, which is an e_mux
  CPU_System_clock_1_in_nativeaddress <= Vector_To_Std_Logic(A_SRL(cpu_0_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")));
  --d1_CPU_System_clock_1_in_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_CPU_System_clock_1_in_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_CPU_System_clock_1_in_end_xfer <= CPU_System_clock_1_in_end_xfer;
    end if;

  end process;

  --CPU_System_clock_1_in_waits_for_read in a cycle, which is an e_mux
  CPU_System_clock_1_in_waits_for_read <= CPU_System_clock_1_in_in_a_read_cycle AND internal_CPU_System_clock_1_in_waitrequest_from_sa;
  --CPU_System_clock_1_in_in_a_read_cycle assignment, which is an e_assign
  CPU_System_clock_1_in_in_a_read_cycle <= internal_cpu_0_data_master_granted_CPU_System_clock_1_in AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= CPU_System_clock_1_in_in_a_read_cycle;
  --CPU_System_clock_1_in_waits_for_write in a cycle, which is an e_mux
  CPU_System_clock_1_in_waits_for_write <= CPU_System_clock_1_in_in_a_write_cycle AND internal_CPU_System_clock_1_in_waitrequest_from_sa;
  --CPU_System_clock_1_in_in_a_write_cycle assignment, which is an e_assign
  CPU_System_clock_1_in_in_a_write_cycle <= internal_cpu_0_data_master_granted_CPU_System_clock_1_in AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= CPU_System_clock_1_in_in_a_write_cycle;
  wait_for_CPU_System_clock_1_in_counter <= std_logic'('0');
  --CPU_System_clock_1_in_byteenable byte enable port mux, which is an e_mux
  CPU_System_clock_1_in_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_CPU_System_clock_1_in)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_0_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --vhdl renameroo for output signals
  CPU_System_clock_1_in_waitrequest_from_sa <= internal_CPU_System_clock_1_in_waitrequest_from_sa;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_CPU_System_clock_1_in <= internal_cpu_0_data_master_granted_CPU_System_clock_1_in;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_CPU_System_clock_1_in <= internal_cpu_0_data_master_qualified_request_CPU_System_clock_1_in;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_CPU_System_clock_1_in <= internal_cpu_0_data_master_requests_CPU_System_clock_1_in;
--synthesis translate_off
    --CPU_System_clock_1/in enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity CPU_System_clock_1_out_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_1_out_address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal CPU_System_clock_1_out_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal CPU_System_clock_1_out_granted_sysid_control_slave : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_qualified_request_sysid_control_slave : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_read : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_read_data_valid_sysid_control_slave : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_requests_sysid_control_slave : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_write : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal clk : IN STD_LOGIC;
                 signal d1_sysid_control_slave_end_xfer : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sysid_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal CPU_System_clock_1_out_address_to_slave : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal CPU_System_clock_1_out_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal CPU_System_clock_1_out_reset_n : OUT STD_LOGIC;
                 signal CPU_System_clock_1_out_waitrequest : OUT STD_LOGIC
              );
end entity CPU_System_clock_1_out_arbitrator;


architecture europa of CPU_System_clock_1_out_arbitrator is
                signal CPU_System_clock_1_out_address_last_time :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_out_byteenable_last_time :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal CPU_System_clock_1_out_read_last_time :  STD_LOGIC;
                signal CPU_System_clock_1_out_run :  STD_LOGIC;
                signal CPU_System_clock_1_out_write_last_time :  STD_LOGIC;
                signal CPU_System_clock_1_out_writedata_last_time :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal internal_CPU_System_clock_1_out_address_to_slave :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal internal_CPU_System_clock_1_out_waitrequest :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;

begin

  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic(((std_logic_vector'("00000000000000000000000000000001") AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT CPU_System_clock_1_out_qualified_request_sysid_control_slave OR NOT CPU_System_clock_1_out_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT d1_sysid_control_slave_end_xfer)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(CPU_System_clock_1_out_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT CPU_System_clock_1_out_qualified_request_sysid_control_slave OR NOT CPU_System_clock_1_out_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(CPU_System_clock_1_out_write)))))))));
  --cascaded wait assignment, which is an e_assign
  CPU_System_clock_1_out_run <= r_1;
  --optimize select-logic by passing only those address bits which matter.
  internal_CPU_System_clock_1_out_address_to_slave <= CPU_System_clock_1_out_address;
  --CPU_System_clock_1/out readdata mux, which is an e_mux
  CPU_System_clock_1_out_readdata <= sysid_control_slave_readdata_from_sa;
  --actual waitrequest port, which is an e_assign
  internal_CPU_System_clock_1_out_waitrequest <= NOT CPU_System_clock_1_out_run;
  --CPU_System_clock_1_out_reset_n assignment, which is an e_assign
  CPU_System_clock_1_out_reset_n <= reset_n;
  --vhdl renameroo for output signals
  CPU_System_clock_1_out_address_to_slave <= internal_CPU_System_clock_1_out_address_to_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_1_out_waitrequest <= internal_CPU_System_clock_1_out_waitrequest;
--synthesis translate_off
    --CPU_System_clock_1_out_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_1_out_address_last_time <= std_logic_vector'("000");
      elsif clk'event and clk = '1' then
        CPU_System_clock_1_out_address_last_time <= CPU_System_clock_1_out_address;
      end if;

    end process;

    --CPU_System_clock_1/out waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_CPU_System_clock_1_out_waitrequest AND ((CPU_System_clock_1_out_read OR CPU_System_clock_1_out_write));
      end if;

    end process;

    --CPU_System_clock_1_out_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line4 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((CPU_System_clock_1_out_address /= CPU_System_clock_1_out_address_last_time))))) = '1' then 
          write(write_line4, now);
          write(write_line4, string'(": "));
          write(write_line4, string'("CPU_System_clock_1_out_address did not heed wait!!!"));
          write(output, write_line4.all);
          deallocate (write_line4);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_1_out_byteenable check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_1_out_byteenable_last_time <= std_logic_vector'("0000");
      elsif clk'event and clk = '1' then
        CPU_System_clock_1_out_byteenable_last_time <= CPU_System_clock_1_out_byteenable;
      end if;

    end process;

    --CPU_System_clock_1_out_byteenable matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line5 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((CPU_System_clock_1_out_byteenable /= CPU_System_clock_1_out_byteenable_last_time))))) = '1' then 
          write(write_line5, now);
          write(write_line5, string'(": "));
          write(write_line5, string'("CPU_System_clock_1_out_byteenable did not heed wait!!!"));
          write(output, write_line5.all);
          deallocate (write_line5);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_1_out_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_1_out_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        CPU_System_clock_1_out_read_last_time <= CPU_System_clock_1_out_read;
      end if;

    end process;

    --CPU_System_clock_1_out_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line6 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(CPU_System_clock_1_out_read) /= std_logic'(CPU_System_clock_1_out_read_last_time)))))) = '1' then 
          write(write_line6, now);
          write(write_line6, string'(": "));
          write(write_line6, string'("CPU_System_clock_1_out_read did not heed wait!!!"));
          write(output, write_line6.all);
          deallocate (write_line6);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_1_out_write check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_1_out_write_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        CPU_System_clock_1_out_write_last_time <= CPU_System_clock_1_out_write;
      end if;

    end process;

    --CPU_System_clock_1_out_write matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line7 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(CPU_System_clock_1_out_write) /= std_logic'(CPU_System_clock_1_out_write_last_time)))))) = '1' then 
          write(write_line7, now);
          write(write_line7, string'(": "));
          write(write_line7, string'("CPU_System_clock_1_out_write did not heed wait!!!"));
          write(output, write_line7.all);
          deallocate (write_line7);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --CPU_System_clock_1_out_writedata check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        CPU_System_clock_1_out_writedata_last_time <= std_logic_vector'("00000000000000000000000000000000");
      elsif clk'event and clk = '1' then
        CPU_System_clock_1_out_writedata_last_time <= CPU_System_clock_1_out_writedata;
      end if;

    end process;

    --CPU_System_clock_1_out_writedata matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line8 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'(((active_and_waiting_last_time AND to_std_logic(((CPU_System_clock_1_out_writedata /= CPU_System_clock_1_out_writedata_last_time)))) AND CPU_System_clock_1_out_write)) = '1' then 
          write(write_line8, now);
          write(write_line8, string'(": "));
          write(write_line8, string'("CPU_System_clock_1_out_writedata did not heed wait!!!"));
          write(output, write_line8.all);
          deallocate (write_line8);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clocks_0_avalon_clocks_slave_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_0_out_address_to_slave : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_read : IN STD_LOGIC;
                 signal CPU_System_clock_0_out_write : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal clocks_0_avalon_clocks_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                 signal clocks_0_avalon_clocks_slave_address : OUT STD_LOGIC;
                 signal clocks_0_avalon_clocks_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal d1_clocks_0_avalon_clocks_slave_end_xfer : OUT STD_LOGIC
              );
end entity clocks_0_avalon_clocks_slave_arbitrator;


architecture europa of clocks_0_avalon_clocks_slave_arbitrator is
                signal CPU_System_clock_0_out_arbiterlock :  STD_LOGIC;
                signal CPU_System_clock_0_out_arbiterlock2 :  STD_LOGIC;
                signal CPU_System_clock_0_out_continuerequest :  STD_LOGIC;
                signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register :  STD_LOGIC;
                signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in :  STD_LOGIC;
                signal CPU_System_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_allgrants :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_any_continuerequest :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_arb_counter_enable :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_arb_share_counter :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_arb_share_counter_next_value :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_arb_share_set_values :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_begins_xfer :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_end_xfer :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_firsttransfer :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_grant_vector :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_in_a_read_cycle :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_in_a_write_cycle :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_master_qreq_vector :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_non_bursting_master_requests :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_reg_firsttransfer :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_slavearbiterlockenable :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_unreg_firsttransfer :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_waits_for_read :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_waits_for_write :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal internal_CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal p1_CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register :  STD_LOGIC;
                signal wait_for_clocks_0_avalon_clocks_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT clocks_0_avalon_clocks_slave_end_xfer;
    end if;

  end process;

  clocks_0_avalon_clocks_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave);
  --assign clocks_0_avalon_clocks_slave_readdata_from_sa = clocks_0_avalon_clocks_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  clocks_0_avalon_clocks_slave_readdata_from_sa <= clocks_0_avalon_clocks_slave_readdata;
  internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave <= Vector_To_Std_Logic(((((std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((CPU_System_clock_0_out_read OR CPU_System_clock_0_out_write))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(CPU_System_clock_0_out_read)))));
  --clocks_0_avalon_clocks_slave_arb_share_counter set values, which is an e_mux
  clocks_0_avalon_clocks_slave_arb_share_set_values <= std_logic'('1');
  --clocks_0_avalon_clocks_slave_non_bursting_master_requests mux, which is an e_mux
  clocks_0_avalon_clocks_slave_non_bursting_master_requests <= internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  --clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant mux, which is an e_mux
  clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --clocks_0_avalon_clocks_slave_arb_share_counter_next_value assignment, which is an e_assign
  clocks_0_avalon_clocks_slave_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(clocks_0_avalon_clocks_slave_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(clocks_0_avalon_clocks_slave_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(clocks_0_avalon_clocks_slave_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(clocks_0_avalon_clocks_slave_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --clocks_0_avalon_clocks_slave_allgrants all slave grants, which is an e_mux
  clocks_0_avalon_clocks_slave_allgrants <= clocks_0_avalon_clocks_slave_grant_vector;
  --clocks_0_avalon_clocks_slave_end_xfer assignment, which is an e_assign
  clocks_0_avalon_clocks_slave_end_xfer <= NOT ((clocks_0_avalon_clocks_slave_waits_for_read OR clocks_0_avalon_clocks_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave <= clocks_0_avalon_clocks_slave_end_xfer AND (((NOT clocks_0_avalon_clocks_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --clocks_0_avalon_clocks_slave_arb_share_counter arbitration counter enable, which is an e_assign
  clocks_0_avalon_clocks_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave AND clocks_0_avalon_clocks_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave AND NOT clocks_0_avalon_clocks_slave_non_bursting_master_requests));
  --clocks_0_avalon_clocks_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      clocks_0_avalon_clocks_slave_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(clocks_0_avalon_clocks_slave_arb_counter_enable) = '1' then 
        clocks_0_avalon_clocks_slave_arb_share_counter <= clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --clocks_0_avalon_clocks_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      clocks_0_avalon_clocks_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clocks_0_avalon_clocks_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave)) OR ((end_xfer_arb_share_counter_term_clocks_0_avalon_clocks_slave AND NOT clocks_0_avalon_clocks_slave_non_bursting_master_requests)))) = '1' then 
        clocks_0_avalon_clocks_slave_slavearbiterlockenable <= clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --CPU_System_clock_0/out clocks_0/avalon_clocks_slave arbiterlock, which is an e_assign
  CPU_System_clock_0_out_arbiterlock <= clocks_0_avalon_clocks_slave_slavearbiterlockenable AND CPU_System_clock_0_out_continuerequest;
  --clocks_0_avalon_clocks_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  clocks_0_avalon_clocks_slave_slavearbiterlockenable2 <= clocks_0_avalon_clocks_slave_arb_share_counter_next_value;
  --CPU_System_clock_0/out clocks_0/avalon_clocks_slave arbiterlock2, which is an e_assign
  CPU_System_clock_0_out_arbiterlock2 <= clocks_0_avalon_clocks_slave_slavearbiterlockenable2 AND CPU_System_clock_0_out_continuerequest;
  --clocks_0_avalon_clocks_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  clocks_0_avalon_clocks_slave_any_continuerequest <= std_logic'('1');
  --CPU_System_clock_0_out_continuerequest continued request, which is an e_assign
  CPU_System_clock_0_out_continuerequest <= std_logic'('1');
  internal_CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave AND NOT ((CPU_System_clock_0_out_read AND (CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register)));
  --CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in mux for readlatency shift register, which is an e_mux
  CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in <= ((internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave AND CPU_System_clock_0_out_read) AND NOT clocks_0_avalon_clocks_slave_waits_for_read) AND NOT (CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register);
  --shift register p1 CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register in if flush, otherwise shift left, which is an e_mux
  p1_CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= Vector_To_Std_Logic(Std_Logic_Vector'(A_ToStdLogicVector(CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register) & A_ToStdLogicVector(CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register_in)));
  --CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register for remembering which master asked for a fixed latency read, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= std_logic'('0');
    elsif clk'event and clk = '1' then
      CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register <= p1_CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
    end if;

  end process;

  --local readdatavalid CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave, which is an e_mux
  CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave <= CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave_shift_register;
  --master is always granted when requested
  internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  --CPU_System_clock_0/out saved-grant clocks_0/avalon_clocks_slave, which is an e_assign
  CPU_System_clock_0_out_saved_grant_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave;
  --allow new arb cycle for clocks_0/avalon_clocks_slave, which is an e_assign
  clocks_0_avalon_clocks_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  clocks_0_avalon_clocks_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  clocks_0_avalon_clocks_slave_master_qreq_vector <= std_logic'('1');
  --clocks_0_avalon_clocks_slave_firsttransfer first transaction, which is an e_assign
  clocks_0_avalon_clocks_slave_firsttransfer <= A_WE_StdLogic((std_logic'(clocks_0_avalon_clocks_slave_begins_xfer) = '1'), clocks_0_avalon_clocks_slave_unreg_firsttransfer, clocks_0_avalon_clocks_slave_reg_firsttransfer);
  --clocks_0_avalon_clocks_slave_unreg_firsttransfer first transaction, which is an e_assign
  clocks_0_avalon_clocks_slave_unreg_firsttransfer <= NOT ((clocks_0_avalon_clocks_slave_slavearbiterlockenable AND clocks_0_avalon_clocks_slave_any_continuerequest));
  --clocks_0_avalon_clocks_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      clocks_0_avalon_clocks_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(clocks_0_avalon_clocks_slave_begins_xfer) = '1' then 
        clocks_0_avalon_clocks_slave_reg_firsttransfer <= clocks_0_avalon_clocks_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --clocks_0_avalon_clocks_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  clocks_0_avalon_clocks_slave_beginbursttransfer_internal <= clocks_0_avalon_clocks_slave_begins_xfer;
  --clocks_0_avalon_clocks_slave_address mux, which is an e_mux
  clocks_0_avalon_clocks_slave_address <= CPU_System_clock_0_out_address_to_slave;
  --d1_clocks_0_avalon_clocks_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_clocks_0_avalon_clocks_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_clocks_0_avalon_clocks_slave_end_xfer <= clocks_0_avalon_clocks_slave_end_xfer;
    end if;

  end process;

  --clocks_0_avalon_clocks_slave_waits_for_read in a cycle, which is an e_mux
  clocks_0_avalon_clocks_slave_waits_for_read <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(clocks_0_avalon_clocks_slave_in_a_read_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --clocks_0_avalon_clocks_slave_in_a_read_cycle assignment, which is an e_assign
  clocks_0_avalon_clocks_slave_in_a_read_cycle <= internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave AND CPU_System_clock_0_out_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= clocks_0_avalon_clocks_slave_in_a_read_cycle;
  --clocks_0_avalon_clocks_slave_waits_for_write in a cycle, which is an e_mux
  clocks_0_avalon_clocks_slave_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(clocks_0_avalon_clocks_slave_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --clocks_0_avalon_clocks_slave_in_a_write_cycle assignment, which is an e_assign
  clocks_0_avalon_clocks_slave_in_a_write_cycle <= internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave AND CPU_System_clock_0_out_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= clocks_0_avalon_clocks_slave_in_a_write_cycle;
  wait_for_clocks_0_avalon_clocks_slave_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave <= internal_CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave;
--synthesis translate_off
    --clocks_0/avalon_clocks_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_0_jtag_debug_module_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_debugaccess : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_resetrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_chipselect : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_reset_n : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_write : OUT STD_LOGIC;
                 signal cpu_0_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_0_jtag_debug_module_end_xfer : OUT STD_LOGIC
              );
end entity cpu_0_jtag_debug_module_arbitrator;


architecture europa of cpu_0_jtag_debug_module_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_allgrants :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_allow_new_arb_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_any_bursting_master_saved_grant :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_any_continuerequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arb_counter_enable :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_arbitration_holdoff_internal :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_beginbursttransfer_internal :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_begins_xfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_jtag_debug_module_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_in_a_read_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_in_a_write_cycle :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_non_bursting_master_requests :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_reg_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_jtag_debug_module_slavearbiterlockenable :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_slavearbiterlockenable2 :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_unreg_firsttransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_waits_for_read :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_waits_for_write :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_cpu_0_jtag_debug_module_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT cpu_0_jtag_debug_module_end_xfer;
    end if;

  end process;

  cpu_0_jtag_debug_module_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module));
  --assign cpu_0_jtag_debug_module_readdata_from_sa = cpu_0_jtag_debug_module_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_0_jtag_debug_module_readdata_from_sa <= cpu_0_jtag_debug_module_readdata;
  internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("100000000100000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --cpu_0_jtag_debug_module_arb_share_counter set values, which is an e_mux
  cpu_0_jtag_debug_module_arb_share_set_values <= std_logic_vector'("001");
  --cpu_0_jtag_debug_module_non_bursting_master_requests mux, which is an e_mux
  cpu_0_jtag_debug_module_non_bursting_master_requests <= ((internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module) OR internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module) OR internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_any_bursting_master_saved_grant mux, which is an e_mux
  cpu_0_jtag_debug_module_any_bursting_master_saved_grant <= std_logic'('0');
  --cpu_0_jtag_debug_module_arb_share_counter_next_value assignment, which is an e_assign
  cpu_0_jtag_debug_module_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(cpu_0_jtag_debug_module_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (cpu_0_jtag_debug_module_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(cpu_0_jtag_debug_module_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (cpu_0_jtag_debug_module_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --cpu_0_jtag_debug_module_allgrants all slave grants, which is an e_mux
  cpu_0_jtag_debug_module_allgrants <= (((or_reduce(cpu_0_jtag_debug_module_grant_vector)) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector))) OR (or_reduce(cpu_0_jtag_debug_module_grant_vector));
  --cpu_0_jtag_debug_module_end_xfer assignment, which is an e_assign
  cpu_0_jtag_debug_module_end_xfer <= NOT ((cpu_0_jtag_debug_module_waits_for_read OR cpu_0_jtag_debug_module_waits_for_write));
  --end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_end_xfer AND (((NOT cpu_0_jtag_debug_module_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --cpu_0_jtag_debug_module_arb_share_counter arbitration counter enable, which is an e_assign
  cpu_0_jtag_debug_module_arb_counter_enable <= ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND cpu_0_jtag_debug_module_allgrants)) OR ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND NOT cpu_0_jtag_debug_module_non_bursting_master_requests));
  --cpu_0_jtag_debug_module_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_arb_counter_enable) = '1' then 
        cpu_0_jtag_debug_module_arb_share_counter <= cpu_0_jtag_debug_module_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --cpu_0_jtag_debug_module_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(cpu_0_jtag_debug_module_master_qreq_vector) AND end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module)) OR ((end_xfer_arb_share_counter_term_cpu_0_jtag_debug_module AND NOT cpu_0_jtag_debug_module_non_bursting_master_requests)))) = '1' then 
        cpu_0_jtag_debug_module_slavearbiterlockenable <= or_reduce(cpu_0_jtag_debug_module_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --cpu_0_jtag_debug_module_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  cpu_0_jtag_debug_module_slavearbiterlockenable2 <= or_reduce(cpu_0_jtag_debug_module_arb_share_counter_next_value);
  --cpu_0/data_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= cpu_0_jtag_debug_module_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock, which is an e_assign
  cpu_0_instruction_master_arbiterlock <= cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master cpu_0/jtag_debug_module arbiterlock2, which is an e_assign
  cpu_0_instruction_master_arbiterlock2 <= cpu_0_jtag_debug_module_slavearbiterlockenable2 AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master granted cpu_0/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module))))));
    end if;

  end process;

  --cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  cpu_0_instruction_master_continuerequest <= last_cycle_cpu_0_instruction_master_granted_slave_cpu_0_jtag_debug_module AND internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_any_continuerequest at least one master continues requesting, which is an e_mux
  cpu_0_jtag_debug_module_any_continuerequest <= cpu_0_instruction_master_continuerequest OR cpu_0_data_master_continuerequest;
  internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module AND NOT (((((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write)) OR cpu_0_instruction_master_arbiterlock));
  --cpu_0_jtag_debug_module_writedata mux, which is an e_mux
  cpu_0_jtag_debug_module_writedata <= cpu_0_data_master_writedata;
  internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_instruction_master_address_to_slave(20 DOWNTO 11) & std_logic_vector'("00000000000")) = std_logic_vector'("100000000100000000000")))) AND (cpu_0_instruction_master_read))) AND cpu_0_instruction_master_read;
  --cpu_0/data_master granted cpu_0/jtag_debug_module last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_arbitration_holdoff_internal OR NOT internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module))))));
    end if;

  end process;

  --cpu_0_data_master_continuerequest continued request, which is an e_mux
  cpu_0_data_master_continuerequest <= last_cycle_cpu_0_data_master_granted_slave_cpu_0_jtag_debug_module AND internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module AND NOT (cpu_0_data_master_arbiterlock);
  --allow new arb cycle for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_allow_new_arb_cycle <= NOT cpu_0_data_master_arbiterlock AND NOT cpu_0_instruction_master_arbiterlock;
  --cpu_0/instruction_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_master_qreq_vector(0) <= internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  --cpu_0/instruction_master grant cpu_0/jtag_debug_module, which is an e_assign
  internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_grant_vector(0);
  --cpu_0/instruction_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_arb_winner(0) AND internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
  --cpu_0/data_master assignment into master qualified-requests vector for cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_jtag_debug_module_master_qreq_vector(1) <= internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  --cpu_0/data_master grant cpu_0/jtag_debug_module, which is an e_assign
  internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_grant_vector(1);
  --cpu_0/data_master saved-grant cpu_0/jtag_debug_module, which is an e_assign
  cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module <= cpu_0_jtag_debug_module_arb_winner(1) AND internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  --cpu_0/jtag_debug_module chosen-master double-vector, which is an e_assign
  cpu_0_jtag_debug_module_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((cpu_0_jtag_debug_module_master_qreq_vector & cpu_0_jtag_debug_module_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT cpu_0_jtag_debug_module_master_qreq_vector & NOT cpu_0_jtag_debug_module_master_qreq_vector))) + (std_logic_vector'("000") & (cpu_0_jtag_debug_module_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  cpu_0_jtag_debug_module_arb_winner <= A_WE_StdLogicVector((std_logic'(((cpu_0_jtag_debug_module_allow_new_arb_cycle AND or_reduce(cpu_0_jtag_debug_module_grant_vector)))) = '1'), cpu_0_jtag_debug_module_grant_vector, cpu_0_jtag_debug_module_saved_chosen_master_vector);
  --saved cpu_0_jtag_debug_module_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_allow_new_arb_cycle) = '1' then 
        cpu_0_jtag_debug_module_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(cpu_0_jtag_debug_module_grant_vector)) = '1'), cpu_0_jtag_debug_module_grant_vector, cpu_0_jtag_debug_module_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  cpu_0_jtag_debug_module_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((cpu_0_jtag_debug_module_chosen_master_double_vector(1) OR cpu_0_jtag_debug_module_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((cpu_0_jtag_debug_module_chosen_master_double_vector(0) OR cpu_0_jtag_debug_module_chosen_master_double_vector(2)))));
  --cpu_0/jtag_debug_module chosen master rotated left, which is an e_assign
  cpu_0_jtag_debug_module_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(cpu_0_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(cpu_0_jtag_debug_module_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --cpu_0/jtag_debug_module's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(cpu_0_jtag_debug_module_grant_vector)) = '1' then 
        cpu_0_jtag_debug_module_arb_addend <= A_WE_StdLogicVector((std_logic'(cpu_0_jtag_debug_module_end_xfer) = '1'), cpu_0_jtag_debug_module_chosen_master_rot_left, cpu_0_jtag_debug_module_grant_vector);
      end if;
    end if;

  end process;

  cpu_0_jtag_debug_module_begintransfer <= cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_reset_n assignment, which is an e_assign
  cpu_0_jtag_debug_module_reset_n <= reset_n;
  --assign cpu_0_jtag_debug_module_resetrequest_from_sa = cpu_0_jtag_debug_module_resetrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  cpu_0_jtag_debug_module_resetrequest_from_sa <= cpu_0_jtag_debug_module_resetrequest;
  cpu_0_jtag_debug_module_chipselect <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module OR internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  --cpu_0_jtag_debug_module_firsttransfer first transaction, which is an e_assign
  cpu_0_jtag_debug_module_firsttransfer <= A_WE_StdLogic((std_logic'(cpu_0_jtag_debug_module_begins_xfer) = '1'), cpu_0_jtag_debug_module_unreg_firsttransfer, cpu_0_jtag_debug_module_reg_firsttransfer);
  --cpu_0_jtag_debug_module_unreg_firsttransfer first transaction, which is an e_assign
  cpu_0_jtag_debug_module_unreg_firsttransfer <= NOT ((cpu_0_jtag_debug_module_slavearbiterlockenable AND cpu_0_jtag_debug_module_any_continuerequest));
  --cpu_0_jtag_debug_module_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      cpu_0_jtag_debug_module_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(cpu_0_jtag_debug_module_begins_xfer) = '1' then 
        cpu_0_jtag_debug_module_reg_firsttransfer <= cpu_0_jtag_debug_module_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --cpu_0_jtag_debug_module_beginbursttransfer_internal begin burst transfer, which is an e_assign
  cpu_0_jtag_debug_module_beginbursttransfer_internal <= cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  cpu_0_jtag_debug_module_arbitration_holdoff_internal <= cpu_0_jtag_debug_module_begins_xfer AND cpu_0_jtag_debug_module_firsttransfer;
  --cpu_0_jtag_debug_module_write assignment, which is an e_mux
  cpu_0_jtag_debug_module_write <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_write;
  shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --cpu_0_jtag_debug_module_address mux, which is an e_mux
  cpu_0_jtag_debug_module_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (A_SRL(shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010"))), (A_SRL(shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master,std_logic_vector'("00000000000000000000000000000010")))), 9);
  shifted_address_to_cpu_0_jtag_debug_module_from_cpu_0_instruction_master <= cpu_0_instruction_master_address_to_slave;
  --d1_cpu_0_jtag_debug_module_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_cpu_0_jtag_debug_module_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_cpu_0_jtag_debug_module_end_xfer <= cpu_0_jtag_debug_module_end_xfer;
    end if;

  end process;

  --cpu_0_jtag_debug_module_waits_for_read in a cycle, which is an e_mux
  cpu_0_jtag_debug_module_waits_for_read <= cpu_0_jtag_debug_module_in_a_read_cycle AND cpu_0_jtag_debug_module_begins_xfer;
  --cpu_0_jtag_debug_module_in_a_read_cycle assignment, which is an e_assign
  cpu_0_jtag_debug_module_in_a_read_cycle <= ((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_read)) OR ((internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module AND cpu_0_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= cpu_0_jtag_debug_module_in_a_read_cycle;
  --cpu_0_jtag_debug_module_waits_for_write in a cycle, which is an e_mux
  cpu_0_jtag_debug_module_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --cpu_0_jtag_debug_module_in_a_write_cycle assignment, which is an e_assign
  cpu_0_jtag_debug_module_in_a_write_cycle <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= cpu_0_jtag_debug_module_in_a_write_cycle;
  wait_for_cpu_0_jtag_debug_module_counter <= std_logic'('0');
  --cpu_0_jtag_debug_module_byteenable byte enable port mux, which is an e_mux
  cpu_0_jtag_debug_module_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_0_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 4);
  --debugaccess mux, which is an e_mux
  cpu_0_jtag_debug_module_debugaccess <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module)) = '1'), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_debugaccess))), std_logic_vector'("00000000000000000000000000000000")));
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_cpu_0_jtag_debug_module <= internal_cpu_0_data_master_requests_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_granted_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_requests_cpu_0_jtag_debug_module <= internal_cpu_0_instruction_master_requests_cpu_0_jtag_debug_module;
--synthesis translate_off
    --cpu_0/jtag_debug_module enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line9 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_data_master_granted_cpu_0_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_instruction_master_granted_cpu_0_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line9, now);
          write(write_line9, string'(": "));
          write(write_line9, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line9.all);
          deallocate (write_line9);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line10 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_saved_grant_cpu_0_jtag_debug_module))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_saved_grant_cpu_0_jtag_debug_module))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line10, now);
          write(write_line10, string'(": "));
          write(write_line10, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line10.all);
          deallocate (write_line10);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cpu_0_data_master_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_0_in_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal CPU_System_clock_0_in_waitrequest_from_sa : IN STD_LOGIC;
                 signal CPU_System_clock_1_in_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal CPU_System_clock_1_in_waitrequest_from_sa : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable_CPU_System_clock_0_in : IN STD_LOGIC;
                 signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_data_master_granted_CPU_System_clock_0_in : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_CPU_System_clock_1_in : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_lcd_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_pio_input_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_pio_output_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_pio_output_1_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_timer_system_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_granted_timer_timestamp_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_CPU_System_clock_0_in : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_CPU_System_clock_1_in : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_lcd_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_input_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_output_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_output_1_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_timer_system_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_timer_timestamp_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_CPU_System_clock_0_in : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_CPU_System_clock_1_in : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_lcd_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_input_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_output_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_output_1_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_timer_system_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_timer_timestamp_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_CPU_System_clock_0_in : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_CPU_System_clock_1_in : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_lcd_0_control_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_input_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_output_0_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_output_1_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_timer_system_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_requests_timer_timestamp_s1 : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_CPU_System_clock_0_in_end_xfer : IN STD_LOGIC;
                 signal d1_CPU_System_clock_1_in_end_xfer : IN STD_LOGIC;
                 signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                 signal d1_lcd_0_control_slave_end_xfer : IN STD_LOGIC;
                 signal d1_pio_input_0_s1_end_xfer : IN STD_LOGIC;
                 signal d1_pio_output_0_s1_end_xfer : IN STD_LOGIC;
                 signal d1_pio_output_1_s1_end_xfer : IN STD_LOGIC;
                 signal d1_sram_0_avalon_sram_slave_end_xfer : IN STD_LOGIC;
                 signal d1_timer_system_s1_end_xfer : IN STD_LOGIC;
                 signal d1_timer_timestamp_s1_end_xfer : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                 signal lcd_0_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal lcd_0_control_slave_wait_counter_eq_0 : IN STD_LOGIC;
                 signal lcd_0_control_slave_wait_counter_eq_1 : IN STD_LOGIC;
                 signal pio_input_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_1_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal sram_0_avalon_sram_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal timer_system_s1_irq_from_sa : IN STD_LOGIC;
                 signal timer_system_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal timer_timestamp_s1_irq_from_sa : IN STD_LOGIC;
                 signal timer_timestamp_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_0_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_data_master_dbs_write_16 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal cpu_0_data_master_dbs_write_8 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal cpu_0_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_no_byte_enables_and_last_term : OUT STD_LOGIC;
                 signal cpu_0_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_data_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_0_data_master_arbitrator;


architecture europa of cpu_0_data_master_arbitrator is
                signal cpu_0_data_master_dbs_increment :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_data_master_run :  STD_LOGIC;
                signal dbs_16_reg_segment_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal dbs_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal dbs_count_enable :  STD_LOGIC;
                signal dbs_counter_overflow :  STD_LOGIC;
                signal internal_cpu_0_data_master_address_to_slave :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal internal_cpu_0_data_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_0_data_master_no_byte_enables_and_last_term :  STD_LOGIC;
                signal internal_cpu_0_data_master_waitrequest :  STD_LOGIC;
                signal last_dbs_term_and_run :  STD_LOGIC;
                signal next_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_dbs_16_reg_segment_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal p1_dbs_8_reg_segment_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_8_reg_segment_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_dbs_8_reg_segment_2 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal p1_registered_cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pre_dbs_count_enable :  STD_LOGIC;
                signal r_0 :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;
                signal r_2 :  STD_LOGIC;
                signal registered_cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((((((((((((((((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_0_data_master_qualified_request_CPU_System_clock_0_in OR ((((cpu_0_data_master_write AND NOT(cpu_0_data_master_byteenable_CPU_System_clock_0_in)) AND internal_cpu_0_data_master_dbs_address(1)) AND internal_cpu_0_data_master_dbs_address(0)))) OR NOT cpu_0_data_master_requests_CPU_System_clock_0_in)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_CPU_System_clock_0_in OR NOT cpu_0_data_master_read)))) OR ((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_0_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((internal_cpu_0_data_master_dbs_address(1) AND internal_cpu_0_data_master_dbs_address(0))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_CPU_System_clock_0_in OR NOT cpu_0_data_master_write)))) OR ((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_0_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((internal_cpu_0_data_master_dbs_address(1) AND internal_cpu_0_data_master_dbs_address(0))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_CPU_System_clock_1_in OR NOT cpu_0_data_master_requests_CPU_System_clock_1_in)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_CPU_System_clock_1_in OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_1_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_CPU_System_clock_1_in OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_1_in_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_requests_cpu_0_jtag_debug_module)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_granted_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave OR NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_read OR cpu_0_data_master_write)))))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_lcd_0_control_slave OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(lcd_0_control_slave_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_lcd_0_control_slave OR NOT cpu_0_data_master_write)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(lcd_0_control_slave_wait_counter_eq_1)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))));
  --cascaded wait assignment, which is an e_assign
  cpu_0_data_master_run <= (r_0 AND r_1) AND r_2;
  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic((((((((((((((((((((std_logic_vector'("00000000000000000000000000000001") AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_input_0_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_input_0_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_pio_output_0_s1 OR NOT cpu_0_data_master_requests_pio_output_0_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_output_0_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_output_0_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_pio_output_1_s1 OR NOT cpu_0_data_master_requests_pio_output_1_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_output_1_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_pio_output_1_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((((cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave OR ((cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave AND internal_cpu_0_data_master_dbs_address(1)))) OR (((cpu_0_data_master_write AND NOT(or_reduce(cpu_0_data_master_byteenable_sram_0_avalon_sram_slave))) AND internal_cpu_0_data_master_dbs_address(1)))) OR NOT cpu_0_data_master_requests_sram_0_avalon_sram_slave)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_granted_sram_0_avalon_sram_slave OR NOT cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave OR NOT cpu_0_data_master_read) OR (((cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave AND (internal_cpu_0_data_master_dbs_address(1))) AND cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave OR NOT cpu_0_data_master_write)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((internal_cpu_0_data_master_dbs_address(1)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_timer_system_s1 OR NOT cpu_0_data_master_requests_timer_system_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_timer_system_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_timer_system_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))));
  --r_2 master_run cascaded wait assignment, which is an e_assign
  r_2 <= Vector_To_Std_Logic((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_qualified_request_timer_timestamp_s1 OR NOT cpu_0_data_master_requests_timer_timestamp_s1)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_timer_timestamp_s1 OR NOT cpu_0_data_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read)))))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_data_master_qualified_request_timer_timestamp_s1 OR NOT cpu_0_data_master_write)))) OR ((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_write)))))))));
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_0_data_master_address_to_slave <= cpu_0_data_master_address(20 DOWNTO 0);
  --no_byte_enables_and_last_term, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_0_data_master_no_byte_enables_and_last_term <= std_logic'('0');
    elsif clk'event and clk = '1' then
      internal_cpu_0_data_master_no_byte_enables_and_last_term <= last_dbs_term_and_run;
    end if;

  end process;

  --compute the last dbs term, which is an e_mux
  last_dbs_term_and_run <= A_WE_StdLogic((std_logic'((cpu_0_data_master_requests_CPU_System_clock_0_in)) = '1'), (((to_std_logic(((internal_cpu_0_data_master_dbs_address = std_logic_vector'("11")))) AND cpu_0_data_master_write) AND NOT(cpu_0_data_master_byteenable_CPU_System_clock_0_in))), (((to_std_logic(((internal_cpu_0_data_master_dbs_address = std_logic_vector'("10")))) AND cpu_0_data_master_write) AND NOT(or_reduce(cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)))));
  --pre dbs count enable, which is an e_mux
  pre_dbs_count_enable <= Vector_To_Std_Logic(((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((((NOT internal_cpu_0_data_master_no_byte_enables_and_last_term) AND cpu_0_data_master_requests_CPU_System_clock_0_in) AND cpu_0_data_master_write) AND NOT(cpu_0_data_master_byteenable_CPU_System_clock_0_in)))))) OR (((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_read)))) AND std_logic_vector'("00000000000000000000000000000001")) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_0_in_waitrequest_from_sa)))))) OR (((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((cpu_0_data_master_granted_CPU_System_clock_0_in AND cpu_0_data_master_write)))) AND std_logic_vector'("00000000000000000000000000000001")) AND std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT CPU_System_clock_0_in_waitrequest_from_sa)))))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((((NOT internal_cpu_0_data_master_no_byte_enables_and_last_term) AND cpu_0_data_master_requests_sram_0_avalon_sram_slave) AND cpu_0_data_master_write) AND NOT(or_reduce(cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)))))))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave)))) OR ((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((cpu_0_data_master_granted_sram_0_avalon_sram_slave AND cpu_0_data_master_write)))) AND std_logic_vector'("00000000000000000000000000000001")) AND std_logic_vector'("00000000000000000000000000000001")))));
  --input to dbs-8 stored 0, which is an e_mux
  p1_dbs_8_reg_segment_0 <= CPU_System_clock_0_in_readdata_from_sa;
  --dbs register for dbs-8 segment 0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_0 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_0_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        dbs_8_reg_segment_0 <= p1_dbs_8_reg_segment_0;
      end if;
    end if;

  end process;

  --input to dbs-8 stored 1, which is an e_mux
  p1_dbs_8_reg_segment_1 <= CPU_System_clock_0_in_readdata_from_sa;
  --dbs register for dbs-8 segment 1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_1 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_0_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000001")))))) = '1' then 
        dbs_8_reg_segment_1 <= p1_dbs_8_reg_segment_1;
      end if;
    end if;

  end process;

  --input to dbs-8 stored 2, which is an e_mux
  p1_dbs_8_reg_segment_2 <= CPU_System_clock_0_in_readdata_from_sa;
  --dbs register for dbs-8 segment 2, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_8_reg_segment_2 <= std_logic_vector'("00000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("000000000000000000000000000000") & ((internal_cpu_0_data_master_dbs_address(1 DOWNTO 0)))) = std_logic_vector'("00000000000000000000000000000010")))))) = '1' then 
        dbs_8_reg_segment_2 <= p1_dbs_8_reg_segment_2;
      end if;
    end if;

  end process;

  --unpredictable registered wait state incoming data, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      registered_cpu_0_data_master_readdata <= std_logic_vector'("00000000000000000000000000000000");
    elsif clk'event and clk = '1' then
      registered_cpu_0_data_master_readdata <= p1_registered_cpu_0_data_master_readdata;
    end if;

  end process;

  --registered readdata mux, which is an e_mux
  p1_registered_cpu_0_data_master_readdata <= ((((A_REP(NOT cpu_0_data_master_requests_CPU_System_clock_0_in, 32) OR Std_Logic_Vector'(CPU_System_clock_0_in_readdata_from_sa(7 DOWNTO 0) & dbs_8_reg_segment_2 & dbs_8_reg_segment_1 & dbs_8_reg_segment_0))) AND ((A_REP(NOT cpu_0_data_master_requests_CPU_System_clock_1_in, 32) OR CPU_System_clock_1_in_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave, 32) OR jtag_uart_0_avalon_jtag_slave_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_sram_0_avalon_sram_slave, 32) OR Std_Logic_Vector'(sram_0_avalon_sram_slave_readdata_from_sa(15 DOWNTO 0) & dbs_16_reg_segment_0)));
  --cpu_0/data_master readdata mux, which is an e_mux
  cpu_0_data_master_readdata <= (((((((((((A_REP(NOT cpu_0_data_master_requests_CPU_System_clock_0_in, 32) OR registered_cpu_0_data_master_readdata)) AND ((A_REP(NOT cpu_0_data_master_requests_CPU_System_clock_1_in, 32) OR registered_cpu_0_data_master_readdata))) AND ((A_REP(NOT cpu_0_data_master_requests_cpu_0_jtag_debug_module, 32) OR cpu_0_jtag_debug_module_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave, 32) OR registered_cpu_0_data_master_readdata))) AND ((A_REP(NOT cpu_0_data_master_requests_lcd_0_control_slave, 32) OR (std_logic_vector'("000000000000000000000000") & (lcd_0_control_slave_readdata_from_sa))))) AND ((A_REP(NOT cpu_0_data_master_requests_pio_input_0_s1, 32) OR pio_input_0_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_pio_output_0_s1, 32) OR pio_output_0_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_pio_output_1_s1, 32) OR pio_output_1_s1_readdata_from_sa))) AND ((A_REP(NOT cpu_0_data_master_requests_sram_0_avalon_sram_slave, 32) OR registered_cpu_0_data_master_readdata))) AND ((A_REP(NOT cpu_0_data_master_requests_timer_system_s1, 32) OR (std_logic_vector'("0000000000000000") & (timer_system_s1_readdata_from_sa))))) AND ((A_REP(NOT cpu_0_data_master_requests_timer_timestamp_s1, 32) OR (std_logic_vector'("0000000000000000") & (timer_timestamp_s1_readdata_from_sa))));
  --mux write dbs 2, which is an e_mux
  cpu_0_data_master_dbs_write_8 <= A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000000"))), cpu_0_data_master_writedata(7 DOWNTO 0), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000001"))), cpu_0_data_master_writedata(15 DOWNTO 8), A_WE_StdLogicVector((((std_logic_vector'("000000000000000000000000000000") & (internal_cpu_0_data_master_dbs_address(1 DOWNTO 0))) = std_logic_vector'("00000000000000000000000000000010"))), cpu_0_data_master_writedata(23 DOWNTO 16), cpu_0_data_master_writedata(31 DOWNTO 24))));
  --actual waitrequest port, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_0_data_master_waitrequest <= Vector_To_Std_Logic(NOT std_logic_vector'("00000000000000000000000000000000"));
    elsif clk'event and clk = '1' then
      internal_cpu_0_data_master_waitrequest <= Vector_To_Std_Logic(NOT (A_WE_StdLogicVector((std_logic'((NOT ((cpu_0_data_master_read OR cpu_0_data_master_write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_data_master_run AND internal_cpu_0_data_master_waitrequest))))))));
    end if;

  end process;

  --dbs count increment, which is an e_mux
  cpu_0_data_master_dbs_increment <= A_EXT (A_WE_StdLogicVector((std_logic'((cpu_0_data_master_requests_CPU_System_clock_0_in)) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'((cpu_0_data_master_requests_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), std_logic_vector'("00000000000000000000000000000000"))), 2);
  --dbs counter overflow, which is an e_assign
  dbs_counter_overflow <= internal_cpu_0_data_master_dbs_address(1) AND NOT((next_dbs_address(1)));
  --next master address, which is an e_assign
  next_dbs_address <= A_EXT (((std_logic_vector'("0") & (internal_cpu_0_data_master_dbs_address)) + (std_logic_vector'("0") & (cpu_0_data_master_dbs_increment))), 2);
  --dbs count enable, which is an e_mux
  dbs_count_enable <= (pre_dbs_count_enable AND (NOT ((cpu_0_data_master_requests_CPU_System_clock_0_in AND NOT internal_cpu_0_data_master_waitrequest)))) AND (NOT ((cpu_0_data_master_requests_sram_0_avalon_sram_slave AND NOT internal_cpu_0_data_master_waitrequest)));
  --dbs counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_0_data_master_dbs_address <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(dbs_count_enable) = '1' then 
        internal_cpu_0_data_master_dbs_address <= next_dbs_address;
      end if;
    end if;

  end process;

  --irq assign, which is an e_assign
  cpu_0_data_master_irq <= Std_Logic_Vector'(A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(std_logic'('0')) & A_ToStdLogicVector(timer_system_s1_irq_from_sa) & A_ToStdLogicVector(timer_timestamp_s1_irq_from_sa) & A_ToStdLogicVector(jtag_uart_0_avalon_jtag_slave_irq_from_sa));
  --input to dbs-16 stored 0, which is an e_mux
  p1_dbs_16_reg_segment_0 <= sram_0_avalon_sram_slave_readdata_from_sa;
  --dbs register for dbs-16 segment 0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_16_reg_segment_0 <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((internal_cpu_0_data_master_dbs_address(1))))) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
      end if;
    end if;

  end process;

  --mux write dbs 1, which is an e_mux
  cpu_0_data_master_dbs_write_16 <= A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_dbs_address(1))) = '1'), cpu_0_data_master_writedata(31 DOWNTO 16), cpu_0_data_master_writedata(15 DOWNTO 0));
  --vhdl renameroo for output signals
  cpu_0_data_master_address_to_slave <= internal_cpu_0_data_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_dbs_address <= internal_cpu_0_data_master_dbs_address;
  --vhdl renameroo for output signals
  cpu_0_data_master_no_byte_enables_and_last_term <= internal_cpu_0_data_master_no_byte_enables_and_last_term;
  --vhdl renameroo for output signals
  cpu_0_data_master_waitrequest <= internal_cpu_0_data_master_waitrequest;

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity cpu_0_instruction_master_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_instruction_master_address : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_granted_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : IN STD_LOGIC;
                 signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                 signal cpu_0_instruction_master_requests_sram_0_avalon_sram_slave : IN STD_LOGIC;
                 signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                 signal d1_sram_0_avalon_sram_slave_end_xfer : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sram_0_avalon_sram_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_0_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_instruction_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal cpu_0_instruction_master_waitrequest : OUT STD_LOGIC
              );
end entity cpu_0_instruction_master_arbitrator;


architecture europa of cpu_0_instruction_master_arbitrator is
                signal active_and_waiting_last_time :  STD_LOGIC;
                signal cpu_0_instruction_master_address_last_time :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal cpu_0_instruction_master_dbs_increment :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_instruction_master_read_last_time :  STD_LOGIC;
                signal cpu_0_instruction_master_run :  STD_LOGIC;
                signal dbs_16_reg_segment_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal dbs_count_enable :  STD_LOGIC;
                signal dbs_counter_overflow :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal internal_cpu_0_instruction_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_0_instruction_master_waitrequest :  STD_LOGIC;
                signal next_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal p1_dbs_16_reg_segment_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal pre_dbs_count_enable :  STD_LOGIC;
                signal r_0 :  STD_LOGIC;
                signal r_1 :  STD_LOGIC;

begin

  --r_0 master_run cascaded wait assignment, which is an e_assign
  r_0 <= Vector_To_Std_Logic((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_requests_cpu_0_jtag_debug_module)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_granted_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module)))))) AND (((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((NOT cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module OR NOT cpu_0_instruction_master_read)))) OR (((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT d1_cpu_0_jtag_debug_module_end_xfer)))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_read)))))))));
  --cascaded wait assignment, which is an e_assign
  cpu_0_instruction_master_run <= r_0 AND r_1;
  --r_1 master_run cascaded wait assignment, which is an e_assign
  r_1 <= Vector_To_Std_Logic((((std_logic_vector'("00000000000000000000000000000001") AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave OR ((cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave AND internal_cpu_0_instruction_master_dbs_address(1)))) OR NOT cpu_0_instruction_master_requests_sram_0_avalon_sram_slave)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((cpu_0_instruction_master_granted_sram_0_avalon_sram_slave OR NOT cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave)))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((((NOT cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave OR NOT cpu_0_instruction_master_read) OR (((cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave AND (internal_cpu_0_instruction_master_dbs_address(1))) AND cpu_0_instruction_master_read)))))))));
  --optimize select-logic by passing only those address bits which matter.
  internal_cpu_0_instruction_master_address_to_slave <= cpu_0_instruction_master_address(20 DOWNTO 0);
  --cpu_0/instruction_master readdata mux, which is an e_mux
  cpu_0_instruction_master_readdata <= ((A_REP(NOT cpu_0_instruction_master_requests_cpu_0_jtag_debug_module, 32) OR cpu_0_jtag_debug_module_readdata_from_sa)) AND ((A_REP(NOT cpu_0_instruction_master_requests_sram_0_avalon_sram_slave, 32) OR Std_Logic_Vector'(sram_0_avalon_sram_slave_readdata_from_sa(15 DOWNTO 0) & dbs_16_reg_segment_0)));
  --actual waitrequest port, which is an e_assign
  internal_cpu_0_instruction_master_waitrequest <= NOT cpu_0_instruction_master_run;
  --input to dbs-16 stored 0, which is an e_mux
  p1_dbs_16_reg_segment_0 <= sram_0_avalon_sram_slave_readdata_from_sa;
  --dbs register for dbs-16 segment 0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      dbs_16_reg_segment_0 <= std_logic_vector'("0000000000000000");
    elsif clk'event and clk = '1' then
      if std_logic'((dbs_count_enable AND to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR((internal_cpu_0_instruction_master_dbs_address(1))))) = std_logic_vector'("00000000000000000000000000000000")))))) = '1' then 
        dbs_16_reg_segment_0 <= p1_dbs_16_reg_segment_0;
      end if;
    end if;

  end process;

  --dbs count increment, which is an e_mux
  cpu_0_instruction_master_dbs_increment <= A_EXT (A_WE_StdLogicVector((std_logic'((cpu_0_instruction_master_requests_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), std_logic_vector'("00000000000000000000000000000000")), 2);
  --dbs counter overflow, which is an e_assign
  dbs_counter_overflow <= internal_cpu_0_instruction_master_dbs_address(1) AND NOT((next_dbs_address(1)));
  --next master address, which is an e_assign
  next_dbs_address <= A_EXT (((std_logic_vector'("0") & (internal_cpu_0_instruction_master_dbs_address)) + (std_logic_vector'("0") & (cpu_0_instruction_master_dbs_increment))), 2);
  --dbs count enable, which is an e_mux
  dbs_count_enable <= pre_dbs_count_enable;
  --dbs counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      internal_cpu_0_instruction_master_dbs_address <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(dbs_count_enable) = '1' then 
        internal_cpu_0_instruction_master_dbs_address <= next_dbs_address;
      end if;
    end if;

  end process;

  --pre dbs count enable, which is an e_mux
  pre_dbs_count_enable <= cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_address_to_slave <= internal_cpu_0_instruction_master_address_to_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_dbs_address <= internal_cpu_0_instruction_master_dbs_address;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_waitrequest <= internal_cpu_0_instruction_master_waitrequest;
--synthesis translate_off
    --cpu_0_instruction_master_address check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_0_instruction_master_address_last_time <= std_logic_vector'("000000000000000000000");
      elsif clk'event and clk = '1' then
        cpu_0_instruction_master_address_last_time <= cpu_0_instruction_master_address;
      end if;

    end process;

    --cpu_0/instruction_master waited last time, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        active_and_waiting_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        active_and_waiting_last_time <= internal_cpu_0_instruction_master_waitrequest AND (cpu_0_instruction_master_read);
      end if;

    end process;

    --cpu_0_instruction_master_address matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line11 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((cpu_0_instruction_master_address /= cpu_0_instruction_master_address_last_time))))) = '1' then 
          write(write_line11, now);
          write(write_line11, string'(": "));
          write(write_line11, string'("cpu_0_instruction_master_address did not heed wait!!!"));
          write(output, write_line11.all);
          deallocate (write_line11);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --cpu_0_instruction_master_read check against wait, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        cpu_0_instruction_master_read_last_time <= std_logic'('0');
      elsif clk'event and clk = '1' then
        cpu_0_instruction_master_read_last_time <= cpu_0_instruction_master_read;
      end if;

    end process;

    --cpu_0_instruction_master_read matches last port_name, which is an e_process
    process (clk)
    VARIABLE write_line12 : line;
    begin
      if clk'event and clk = '1' then
        if std_logic'((active_and_waiting_last_time AND to_std_logic(((std_logic'(cpu_0_instruction_master_read) /= std_logic'(cpu_0_instruction_master_read_last_time)))))) = '1' then 
          write(write_line12, now);
          write(write_line12, string'(": "));
          write(write_line12, string'("cpu_0_instruction_master_read did not heed wait!!!"));
          write(output, write_line12.all);
          deallocate (write_line12);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity jtag_uart_0_avalon_jtag_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                 signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_address : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                 signal jtag_uart_0_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity jtag_uart_0_avalon_jtag_slave_arbitrator;


architecture europa of jtag_uart_0_avalon_jtag_slave_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_allgrants :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_any_continuerequest :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_counter_enable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_begins_xfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_grant_vector :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_in_a_read_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_in_a_write_cycle :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_master_qreq_vector :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_reg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waits_for_read :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_jtag_uart_0_avalon_jtag_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT jtag_uart_0_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  jtag_uart_0_avalon_jtag_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave);
  --assign jtag_uart_0_avalon_jtag_slave_readdata_from_sa = jtag_uart_0_avalon_jtag_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_readdata_from_sa <= jtag_uart_0_avalon_jtag_slave_readdata;
  internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 3) & std_logic_vector'("000")) = std_logic_vector'("100000001000010001000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --assign jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa = jtag_uart_0_avalon_jtag_slave_dataavailable so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa <= jtag_uart_0_avalon_jtag_slave_dataavailable;
  --assign jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa = jtag_uart_0_avalon_jtag_slave_readyfordata so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa <= jtag_uart_0_avalon_jtag_slave_readyfordata;
  --assign jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa = jtag_uart_0_avalon_jtag_slave_waitrequest so that symbol knows where to group signals which may go to master only, which is an e_assign
  internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa <= jtag_uart_0_avalon_jtag_slave_waitrequest;
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter set values, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_arb_share_set_values <= std_logic_vector'("001");
  --jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(jtag_uart_0_avalon_jtag_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (jtag_uart_0_avalon_jtag_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(jtag_uart_0_avalon_jtag_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (jtag_uart_0_avalon_jtag_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --jtag_uart_0_avalon_jtag_slave_allgrants all slave grants, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_allgrants <= jtag_uart_0_avalon_jtag_slave_grant_vector;
  --jtag_uart_0_avalon_jtag_slave_end_xfer assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_end_xfer <= NOT ((jtag_uart_0_avalon_jtag_slave_waits_for_read OR jtag_uart_0_avalon_jtag_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave <= jtag_uart_0_avalon_jtag_slave_end_xfer AND (((NOT jtag_uart_0_avalon_jtag_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter arbitration counter enable, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND jtag_uart_0_avalon_jtag_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND NOT jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests));
  --jtag_uart_0_avalon_jtag_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_0_avalon_jtag_slave_arb_counter_enable) = '1' then 
        jtag_uart_0_avalon_jtag_slave_arb_share_counter <= jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((jtag_uart_0_avalon_jtag_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave)) OR ((end_xfer_arb_share_counter_term_jtag_uart_0_avalon_jtag_slave AND NOT jtag_uart_0_avalon_jtag_slave_non_bursting_master_requests)))) = '1' then 
        jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable <= or_reduce(jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 <= or_reduce(jtag_uart_0_avalon_jtag_slave_arb_share_counter_next_value);
  --cpu_0/data_master jtag_uart_0/avalon_jtag_slave arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --jtag_uart_0_avalon_jtag_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave AND NOT ((((cpu_0_data_master_read AND (NOT cpu_0_data_master_waitrequest))) OR (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write))));
  --jtag_uart_0_avalon_jtag_slave_writedata mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  --cpu_0/data_master saved-grant jtag_uart_0/avalon_jtag_slave, which is an e_assign
  cpu_0_data_master_saved_grant_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --allow new arb cycle for jtag_uart_0/avalon_jtag_slave, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  jtag_uart_0_avalon_jtag_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  jtag_uart_0_avalon_jtag_slave_master_qreq_vector <= std_logic'('1');
  --jtag_uart_0_avalon_jtag_slave_reset_n assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_reset_n <= reset_n;
  jtag_uart_0_avalon_jtag_slave_chipselect <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  --jtag_uart_0_avalon_jtag_slave_firsttransfer first transaction, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_firsttransfer <= A_WE_StdLogic((std_logic'(jtag_uart_0_avalon_jtag_slave_begins_xfer) = '1'), jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer, jtag_uart_0_avalon_jtag_slave_reg_firsttransfer);
  --jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer first transaction, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer <= NOT ((jtag_uart_0_avalon_jtag_slave_slavearbiterlockenable AND jtag_uart_0_avalon_jtag_slave_any_continuerequest));
  --jtag_uart_0_avalon_jtag_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(jtag_uart_0_avalon_jtag_slave_begins_xfer) = '1' then 
        jtag_uart_0_avalon_jtag_slave_reg_firsttransfer <= jtag_uart_0_avalon_jtag_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_beginbursttransfer_internal <= jtag_uart_0_avalon_jtag_slave_begins_xfer;
  --~jtag_uart_0_avalon_jtag_slave_read_n assignment, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_read_n <= NOT ((internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_read));
  --~jtag_uart_0_avalon_jtag_slave_write_n assignment, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_write_n <= NOT ((internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_write));
  shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --jtag_uart_0_avalon_jtag_slave_address mux, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_address <= Vector_To_Std_Logic(A_SRL(shifted_address_to_jtag_uart_0_avalon_jtag_slave_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")));
  --d1_jtag_uart_0_avalon_jtag_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer <= jtag_uart_0_avalon_jtag_slave_end_xfer;
    end if;

  end process;

  --jtag_uart_0_avalon_jtag_slave_waits_for_read in a cycle, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_waits_for_read <= jtag_uart_0_avalon_jtag_slave_in_a_read_cycle AND internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_0_avalon_jtag_slave_in_a_read_cycle assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_in_a_read_cycle <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= jtag_uart_0_avalon_jtag_slave_in_a_read_cycle;
  --jtag_uart_0_avalon_jtag_slave_waits_for_write in a cycle, which is an e_mux
  jtag_uart_0_avalon_jtag_slave_waits_for_write <= jtag_uart_0_avalon_jtag_slave_in_a_write_cycle AND internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
  --jtag_uart_0_avalon_jtag_slave_in_a_write_cycle assignment, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_in_a_write_cycle <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= jtag_uart_0_avalon_jtag_slave_in_a_write_cycle;
  wait_for_jtag_uart_0_avalon_jtag_slave_counter <= std_logic'('0');
  --assign jtag_uart_0_avalon_jtag_slave_irq_from_sa = jtag_uart_0_avalon_jtag_slave_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  jtag_uart_0_avalon_jtag_slave_irq_from_sa <= jtag_uart_0_avalon_jtag_slave_irq;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave <= internal_cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave;
  --vhdl renameroo for output signals
  jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa <= internal_jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa;
--synthesis translate_off
    --jtag_uart_0/avalon_jtag_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity lcd_0_control_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal lcd_0_control_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_lcd_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_lcd_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_lcd_0_control_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_lcd_0_control_slave : OUT STD_LOGIC;
                 signal d1_lcd_0_control_slave_end_xfer : OUT STD_LOGIC;
                 signal lcd_0_control_slave_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal lcd_0_control_slave_begintransfer : OUT STD_LOGIC;
                 signal lcd_0_control_slave_read : OUT STD_LOGIC;
                 signal lcd_0_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                 signal lcd_0_control_slave_reset_n : OUT STD_LOGIC;
                 signal lcd_0_control_slave_wait_counter_eq_0 : OUT STD_LOGIC;
                 signal lcd_0_control_slave_wait_counter_eq_1 : OUT STD_LOGIC;
                 signal lcd_0_control_slave_write : OUT STD_LOGIC;
                 signal lcd_0_control_slave_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
              );
end entity lcd_0_control_slave_arbitrator;


architecture europa of lcd_0_control_slave_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_lcd_0_control_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_lcd_0_control_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_lcd_0_control_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_lcd_0_control_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_lcd_0_control_slave :  STD_LOGIC;
                signal internal_lcd_0_control_slave_wait_counter_eq_0 :  STD_LOGIC;
                signal lcd_0_control_slave_allgrants :  STD_LOGIC;
                signal lcd_0_control_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal lcd_0_control_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal lcd_0_control_slave_any_continuerequest :  STD_LOGIC;
                signal lcd_0_control_slave_arb_counter_enable :  STD_LOGIC;
                signal lcd_0_control_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_0_control_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_0_control_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal lcd_0_control_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal lcd_0_control_slave_begins_xfer :  STD_LOGIC;
                signal lcd_0_control_slave_counter_load_value :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal lcd_0_control_slave_end_xfer :  STD_LOGIC;
                signal lcd_0_control_slave_firsttransfer :  STD_LOGIC;
                signal lcd_0_control_slave_grant_vector :  STD_LOGIC;
                signal lcd_0_control_slave_in_a_read_cycle :  STD_LOGIC;
                signal lcd_0_control_slave_in_a_write_cycle :  STD_LOGIC;
                signal lcd_0_control_slave_master_qreq_vector :  STD_LOGIC;
                signal lcd_0_control_slave_non_bursting_master_requests :  STD_LOGIC;
                signal lcd_0_control_slave_pretend_byte_enable :  STD_LOGIC;
                signal lcd_0_control_slave_reg_firsttransfer :  STD_LOGIC;
                signal lcd_0_control_slave_slavearbiterlockenable :  STD_LOGIC;
                signal lcd_0_control_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal lcd_0_control_slave_unreg_firsttransfer :  STD_LOGIC;
                signal lcd_0_control_slave_wait_counter :  STD_LOGIC_VECTOR (5 DOWNTO 0);
                signal lcd_0_control_slave_waits_for_read :  STD_LOGIC;
                signal lcd_0_control_slave_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_lcd_0_control_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT lcd_0_control_slave_end_xfer;
    end if;

  end process;

  lcd_0_control_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_lcd_0_control_slave);
  --assign lcd_0_control_slave_readdata_from_sa = lcd_0_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  lcd_0_control_slave_readdata_from_sa <= lcd_0_control_slave_readdata;
  internal_cpu_0_data_master_requests_lcd_0_control_slave <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("100000001000001000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --lcd_0_control_slave_arb_share_counter set values, which is an e_mux
  lcd_0_control_slave_arb_share_set_values <= std_logic_vector'("001");
  --lcd_0_control_slave_non_bursting_master_requests mux, which is an e_mux
  lcd_0_control_slave_non_bursting_master_requests <= internal_cpu_0_data_master_requests_lcd_0_control_slave;
  --lcd_0_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  lcd_0_control_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --lcd_0_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  lcd_0_control_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(lcd_0_control_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (lcd_0_control_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(lcd_0_control_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (lcd_0_control_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --lcd_0_control_slave_allgrants all slave grants, which is an e_mux
  lcd_0_control_slave_allgrants <= lcd_0_control_slave_grant_vector;
  --lcd_0_control_slave_end_xfer assignment, which is an e_assign
  lcd_0_control_slave_end_xfer <= NOT ((lcd_0_control_slave_waits_for_read OR lcd_0_control_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_lcd_0_control_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_lcd_0_control_slave <= lcd_0_control_slave_end_xfer AND (((NOT lcd_0_control_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --lcd_0_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  lcd_0_control_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_lcd_0_control_slave AND lcd_0_control_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_lcd_0_control_slave AND NOT lcd_0_control_slave_non_bursting_master_requests));
  --lcd_0_control_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_0_control_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(lcd_0_control_slave_arb_counter_enable) = '1' then 
        lcd_0_control_slave_arb_share_counter <= lcd_0_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --lcd_0_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_0_control_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((lcd_0_control_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_lcd_0_control_slave)) OR ((end_xfer_arb_share_counter_term_lcd_0_control_slave AND NOT lcd_0_control_slave_non_bursting_master_requests)))) = '1' then 
        lcd_0_control_slave_slavearbiterlockenable <= or_reduce(lcd_0_control_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master lcd_0/control_slave arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= lcd_0_control_slave_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --lcd_0_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  lcd_0_control_slave_slavearbiterlockenable2 <= or_reduce(lcd_0_control_slave_arb_share_counter_next_value);
  --cpu_0/data_master lcd_0/control_slave arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= lcd_0_control_slave_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --lcd_0_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  lcd_0_control_slave_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_lcd_0_control_slave <= internal_cpu_0_data_master_requests_lcd_0_control_slave;
  --lcd_0_control_slave_writedata mux, which is an e_mux
  lcd_0_control_slave_writedata <= cpu_0_data_master_writedata (7 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_0_data_master_granted_lcd_0_control_slave <= internal_cpu_0_data_master_qualified_request_lcd_0_control_slave;
  --cpu_0/data_master saved-grant lcd_0/control_slave, which is an e_assign
  cpu_0_data_master_saved_grant_lcd_0_control_slave <= internal_cpu_0_data_master_requests_lcd_0_control_slave;
  --allow new arb cycle for lcd_0/control_slave, which is an e_assign
  lcd_0_control_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  lcd_0_control_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  lcd_0_control_slave_master_qreq_vector <= std_logic'('1');
  lcd_0_control_slave_begintransfer <= lcd_0_control_slave_begins_xfer;
  --lcd_0_control_slave_reset_n assignment, which is an e_assign
  lcd_0_control_slave_reset_n <= reset_n;
  --lcd_0_control_slave_firsttransfer first transaction, which is an e_assign
  lcd_0_control_slave_firsttransfer <= A_WE_StdLogic((std_logic'(lcd_0_control_slave_begins_xfer) = '1'), lcd_0_control_slave_unreg_firsttransfer, lcd_0_control_slave_reg_firsttransfer);
  --lcd_0_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  lcd_0_control_slave_unreg_firsttransfer <= NOT ((lcd_0_control_slave_slavearbiterlockenable AND lcd_0_control_slave_any_continuerequest));
  --lcd_0_control_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_0_control_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(lcd_0_control_slave_begins_xfer) = '1' then 
        lcd_0_control_slave_reg_firsttransfer <= lcd_0_control_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --lcd_0_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  lcd_0_control_slave_beginbursttransfer_internal <= lcd_0_control_slave_begins_xfer;
  --lcd_0_control_slave_read assignment, which is an e_mux
  lcd_0_control_slave_read <= (((internal_cpu_0_data_master_granted_lcd_0_control_slave AND cpu_0_data_master_read)) AND NOT lcd_0_control_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_0_control_slave_wait_counter))<std_logic_vector'("00000000000000000000000000001101"))));
  --lcd_0_control_slave_write assignment, which is an e_mux
  lcd_0_control_slave_write <= (((((internal_cpu_0_data_master_granted_lcd_0_control_slave AND cpu_0_data_master_write)) AND NOT lcd_0_control_slave_begins_xfer) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_0_control_slave_wait_counter))>=std_logic_vector'("00000000000000000000000000001101"))))) AND to_std_logic((((std_logic_vector'("00000000000000000000000000") & (lcd_0_control_slave_wait_counter))<std_logic_vector'("00000000000000000000000000011010"))))) AND lcd_0_control_slave_pretend_byte_enable;
  shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --lcd_0_control_slave_address mux, which is an e_mux
  lcd_0_control_slave_address <= A_EXT (A_SRL(shifted_address_to_lcd_0_control_slave_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_lcd_0_control_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_lcd_0_control_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_lcd_0_control_slave_end_xfer <= lcd_0_control_slave_end_xfer;
    end if;

  end process;

  --lcd_0_control_slave_wait_counter_eq_1 assignment, which is an e_assign
  lcd_0_control_slave_wait_counter_eq_1 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (lcd_0_control_slave_wait_counter)) = std_logic_vector'("00000000000000000000000000000001")));
  --lcd_0_control_slave_waits_for_read in a cycle, which is an e_mux
  lcd_0_control_slave_waits_for_read <= lcd_0_control_slave_in_a_read_cycle AND wait_for_lcd_0_control_slave_counter;
  --lcd_0_control_slave_in_a_read_cycle assignment, which is an e_assign
  lcd_0_control_slave_in_a_read_cycle <= internal_cpu_0_data_master_granted_lcd_0_control_slave AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= lcd_0_control_slave_in_a_read_cycle;
  --lcd_0_control_slave_waits_for_write in a cycle, which is an e_mux
  lcd_0_control_slave_waits_for_write <= lcd_0_control_slave_in_a_write_cycle AND wait_for_lcd_0_control_slave_counter;
  --lcd_0_control_slave_in_a_write_cycle assignment, which is an e_assign
  lcd_0_control_slave_in_a_write_cycle <= internal_cpu_0_data_master_granted_lcd_0_control_slave AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= lcd_0_control_slave_in_a_write_cycle;
  internal_lcd_0_control_slave_wait_counter_eq_0 <= to_std_logic(((std_logic_vector'("00000000000000000000000000") & (lcd_0_control_slave_wait_counter)) = std_logic_vector'("00000000000000000000000000000000")));
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      lcd_0_control_slave_wait_counter <= std_logic_vector'("000000");
    elsif clk'event and clk = '1' then
      lcd_0_control_slave_wait_counter <= lcd_0_control_slave_counter_load_value;
    end if;

  end process;

  lcd_0_control_slave_counter_load_value <= A_EXT (A_WE_StdLogicVector((std_logic'(((lcd_0_control_slave_in_a_read_cycle AND lcd_0_control_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000011000"), A_WE_StdLogicVector((std_logic'(((lcd_0_control_slave_in_a_write_cycle AND lcd_0_control_slave_begins_xfer))) = '1'), std_logic_vector'("000000000000000000000000000100101"), A_WE_StdLogicVector((std_logic'((NOT internal_lcd_0_control_slave_wait_counter_eq_0)) = '1'), ((std_logic_vector'("000000000000000000000000000") & (lcd_0_control_slave_wait_counter)) - std_logic_vector'("000000000000000000000000000000001")), std_logic_vector'("000000000000000000000000000000000")))), 6);
  wait_for_lcd_0_control_slave_counter <= lcd_0_control_slave_begins_xfer OR NOT internal_lcd_0_control_slave_wait_counter_eq_0;
  --lcd_0_control_slave_pretend_byte_enable byte enable port mux, which is an e_mux
  lcd_0_control_slave_pretend_byte_enable <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_lcd_0_control_slave)) = '1'), (std_logic_vector'("0000000000000000000000000000") & (cpu_0_data_master_byteenable)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))));
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_lcd_0_control_slave <= internal_cpu_0_data_master_granted_lcd_0_control_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_lcd_0_control_slave <= internal_cpu_0_data_master_qualified_request_lcd_0_control_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_lcd_0_control_slave <= internal_cpu_0_data_master_requests_lcd_0_control_slave;
  --vhdl renameroo for output signals
  lcd_0_control_slave_wait_counter_eq_0 <= internal_lcd_0_control_slave_wait_counter_eq_0;
--synthesis translate_off
    --lcd_0/control_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pio_input_0_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal pio_input_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_pio_input_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_input_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_input_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_input_0_s1 : OUT STD_LOGIC;
                 signal d1_pio_input_0_s1_end_xfer : OUT STD_LOGIC;
                 signal pio_input_0_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal pio_input_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_input_0_s1_reset_n : OUT STD_LOGIC
              );
end entity pio_input_0_s1_arbitrator;


architecture europa of pio_input_0_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_pio_input_0_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_pio_input_0_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_pio_input_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_pio_input_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_pio_input_0_s1 :  STD_LOGIC;
                signal pio_input_0_s1_allgrants :  STD_LOGIC;
                signal pio_input_0_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal pio_input_0_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal pio_input_0_s1_any_continuerequest :  STD_LOGIC;
                signal pio_input_0_s1_arb_counter_enable :  STD_LOGIC;
                signal pio_input_0_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_input_0_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_input_0_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_input_0_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal pio_input_0_s1_begins_xfer :  STD_LOGIC;
                signal pio_input_0_s1_end_xfer :  STD_LOGIC;
                signal pio_input_0_s1_firsttransfer :  STD_LOGIC;
                signal pio_input_0_s1_grant_vector :  STD_LOGIC;
                signal pio_input_0_s1_in_a_read_cycle :  STD_LOGIC;
                signal pio_input_0_s1_in_a_write_cycle :  STD_LOGIC;
                signal pio_input_0_s1_master_qreq_vector :  STD_LOGIC;
                signal pio_input_0_s1_non_bursting_master_requests :  STD_LOGIC;
                signal pio_input_0_s1_reg_firsttransfer :  STD_LOGIC;
                signal pio_input_0_s1_slavearbiterlockenable :  STD_LOGIC;
                signal pio_input_0_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal pio_input_0_s1_unreg_firsttransfer :  STD_LOGIC;
                signal pio_input_0_s1_waits_for_read :  STD_LOGIC;
                signal pio_input_0_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_pio_input_0_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_pio_input_0_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT pio_input_0_s1_end_xfer;
    end if;

  end process;

  pio_input_0_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_pio_input_0_s1);
  --assign pio_input_0_s1_readdata_from_sa = pio_input_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  pio_input_0_s1_readdata_from_sa <= pio_input_0_s1_readdata;
  internal_cpu_0_data_master_requests_pio_input_0_s1 <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("100000001000001010000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write)))) AND cpu_0_data_master_read;
  --pio_input_0_s1_arb_share_counter set values, which is an e_mux
  pio_input_0_s1_arb_share_set_values <= std_logic_vector'("001");
  --pio_input_0_s1_non_bursting_master_requests mux, which is an e_mux
  pio_input_0_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_pio_input_0_s1;
  --pio_input_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  pio_input_0_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --pio_input_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  pio_input_0_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(pio_input_0_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_input_0_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(pio_input_0_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_input_0_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --pio_input_0_s1_allgrants all slave grants, which is an e_mux
  pio_input_0_s1_allgrants <= pio_input_0_s1_grant_vector;
  --pio_input_0_s1_end_xfer assignment, which is an e_assign
  pio_input_0_s1_end_xfer <= NOT ((pio_input_0_s1_waits_for_read OR pio_input_0_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_pio_input_0_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_pio_input_0_s1 <= pio_input_0_s1_end_xfer AND (((NOT pio_input_0_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --pio_input_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  pio_input_0_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_pio_input_0_s1 AND pio_input_0_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_pio_input_0_s1 AND NOT pio_input_0_s1_non_bursting_master_requests));
  --pio_input_0_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_input_0_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(pio_input_0_s1_arb_counter_enable) = '1' then 
        pio_input_0_s1_arb_share_counter <= pio_input_0_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --pio_input_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_input_0_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((pio_input_0_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_pio_input_0_s1)) OR ((end_xfer_arb_share_counter_term_pio_input_0_s1 AND NOT pio_input_0_s1_non_bursting_master_requests)))) = '1' then 
        pio_input_0_s1_slavearbiterlockenable <= or_reduce(pio_input_0_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master pio_input_0/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= pio_input_0_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --pio_input_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  pio_input_0_s1_slavearbiterlockenable2 <= or_reduce(pio_input_0_s1_arb_share_counter_next_value);
  --cpu_0/data_master pio_input_0/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= pio_input_0_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --pio_input_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  pio_input_0_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_pio_input_0_s1 <= internal_cpu_0_data_master_requests_pio_input_0_s1;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_pio_input_0_s1 <= internal_cpu_0_data_master_qualified_request_pio_input_0_s1;
  --cpu_0/data_master saved-grant pio_input_0/s1, which is an e_assign
  cpu_0_data_master_saved_grant_pio_input_0_s1 <= internal_cpu_0_data_master_requests_pio_input_0_s1;
  --allow new arb cycle for pio_input_0/s1, which is an e_assign
  pio_input_0_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  pio_input_0_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  pio_input_0_s1_master_qreq_vector <= std_logic'('1');
  --pio_input_0_s1_reset_n assignment, which is an e_assign
  pio_input_0_s1_reset_n <= reset_n;
  --pio_input_0_s1_firsttransfer first transaction, which is an e_assign
  pio_input_0_s1_firsttransfer <= A_WE_StdLogic((std_logic'(pio_input_0_s1_begins_xfer) = '1'), pio_input_0_s1_unreg_firsttransfer, pio_input_0_s1_reg_firsttransfer);
  --pio_input_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  pio_input_0_s1_unreg_firsttransfer <= NOT ((pio_input_0_s1_slavearbiterlockenable AND pio_input_0_s1_any_continuerequest));
  --pio_input_0_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_input_0_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(pio_input_0_s1_begins_xfer) = '1' then 
        pio_input_0_s1_reg_firsttransfer <= pio_input_0_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --pio_input_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  pio_input_0_s1_beginbursttransfer_internal <= pio_input_0_s1_begins_xfer;
  shifted_address_to_pio_input_0_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --pio_input_0_s1_address mux, which is an e_mux
  pio_input_0_s1_address <= A_EXT (A_SRL(shifted_address_to_pio_input_0_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_pio_input_0_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_pio_input_0_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_pio_input_0_s1_end_xfer <= pio_input_0_s1_end_xfer;
    end if;

  end process;

  --pio_input_0_s1_waits_for_read in a cycle, which is an e_mux
  pio_input_0_s1_waits_for_read <= pio_input_0_s1_in_a_read_cycle AND pio_input_0_s1_begins_xfer;
  --pio_input_0_s1_in_a_read_cycle assignment, which is an e_assign
  pio_input_0_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_pio_input_0_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= pio_input_0_s1_in_a_read_cycle;
  --pio_input_0_s1_waits_for_write in a cycle, which is an e_mux
  pio_input_0_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pio_input_0_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --pio_input_0_s1_in_a_write_cycle assignment, which is an e_assign
  pio_input_0_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_pio_input_0_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= pio_input_0_s1_in_a_write_cycle;
  wait_for_pio_input_0_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_pio_input_0_s1 <= internal_cpu_0_data_master_granted_pio_input_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_pio_input_0_s1 <= internal_cpu_0_data_master_qualified_request_pio_input_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_pio_input_0_s1 <= internal_cpu_0_data_master_requests_pio_input_0_s1;
--synthesis translate_off
    --pio_input_0/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pio_output_0_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_pio_output_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_output_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_output_0_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_output_0_s1 : OUT STD_LOGIC;
                 signal d1_pio_output_0_s1_end_xfer : OUT STD_LOGIC;
                 signal pio_output_0_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal pio_output_0_s1_chipselect : OUT STD_LOGIC;
                 signal pio_output_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_0_s1_reset_n : OUT STD_LOGIC;
                 signal pio_output_0_s1_write_n : OUT STD_LOGIC;
                 signal pio_output_0_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity pio_output_0_s1_arbitrator;


architecture europa of pio_output_0_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_pio_output_0_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_pio_output_0_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_pio_output_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_pio_output_0_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_pio_output_0_s1 :  STD_LOGIC;
                signal pio_output_0_s1_allgrants :  STD_LOGIC;
                signal pio_output_0_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal pio_output_0_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal pio_output_0_s1_any_continuerequest :  STD_LOGIC;
                signal pio_output_0_s1_arb_counter_enable :  STD_LOGIC;
                signal pio_output_0_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_0_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_0_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_0_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal pio_output_0_s1_begins_xfer :  STD_LOGIC;
                signal pio_output_0_s1_end_xfer :  STD_LOGIC;
                signal pio_output_0_s1_firsttransfer :  STD_LOGIC;
                signal pio_output_0_s1_grant_vector :  STD_LOGIC;
                signal pio_output_0_s1_in_a_read_cycle :  STD_LOGIC;
                signal pio_output_0_s1_in_a_write_cycle :  STD_LOGIC;
                signal pio_output_0_s1_master_qreq_vector :  STD_LOGIC;
                signal pio_output_0_s1_non_bursting_master_requests :  STD_LOGIC;
                signal pio_output_0_s1_reg_firsttransfer :  STD_LOGIC;
                signal pio_output_0_s1_slavearbiterlockenable :  STD_LOGIC;
                signal pio_output_0_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal pio_output_0_s1_unreg_firsttransfer :  STD_LOGIC;
                signal pio_output_0_s1_waits_for_read :  STD_LOGIC;
                signal pio_output_0_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_pio_output_0_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_pio_output_0_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT pio_output_0_s1_end_xfer;
    end if;

  end process;

  pio_output_0_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_pio_output_0_s1);
  --assign pio_output_0_s1_readdata_from_sa = pio_output_0_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  pio_output_0_s1_readdata_from_sa <= pio_output_0_s1_readdata;
  internal_cpu_0_data_master_requests_pio_output_0_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("100000001000001110000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --pio_output_0_s1_arb_share_counter set values, which is an e_mux
  pio_output_0_s1_arb_share_set_values <= std_logic_vector'("001");
  --pio_output_0_s1_non_bursting_master_requests mux, which is an e_mux
  pio_output_0_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_pio_output_0_s1;
  --pio_output_0_s1_any_bursting_master_saved_grant mux, which is an e_mux
  pio_output_0_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --pio_output_0_s1_arb_share_counter_next_value assignment, which is an e_assign
  pio_output_0_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(pio_output_0_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_output_0_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(pio_output_0_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_output_0_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --pio_output_0_s1_allgrants all slave grants, which is an e_mux
  pio_output_0_s1_allgrants <= pio_output_0_s1_grant_vector;
  --pio_output_0_s1_end_xfer assignment, which is an e_assign
  pio_output_0_s1_end_xfer <= NOT ((pio_output_0_s1_waits_for_read OR pio_output_0_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_pio_output_0_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_pio_output_0_s1 <= pio_output_0_s1_end_xfer AND (((NOT pio_output_0_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --pio_output_0_s1_arb_share_counter arbitration counter enable, which is an e_assign
  pio_output_0_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_pio_output_0_s1 AND pio_output_0_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_pio_output_0_s1 AND NOT pio_output_0_s1_non_bursting_master_requests));
  --pio_output_0_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_0_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(pio_output_0_s1_arb_counter_enable) = '1' then 
        pio_output_0_s1_arb_share_counter <= pio_output_0_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --pio_output_0_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_0_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((pio_output_0_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_pio_output_0_s1)) OR ((end_xfer_arb_share_counter_term_pio_output_0_s1 AND NOT pio_output_0_s1_non_bursting_master_requests)))) = '1' then 
        pio_output_0_s1_slavearbiterlockenable <= or_reduce(pio_output_0_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master pio_output_0/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= pio_output_0_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --pio_output_0_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  pio_output_0_s1_slavearbiterlockenable2 <= or_reduce(pio_output_0_s1_arb_share_counter_next_value);
  --cpu_0/data_master pio_output_0/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= pio_output_0_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --pio_output_0_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  pio_output_0_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_pio_output_0_s1 <= internal_cpu_0_data_master_requests_pio_output_0_s1 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --pio_output_0_s1_writedata mux, which is an e_mux
  pio_output_0_s1_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_pio_output_0_s1 <= internal_cpu_0_data_master_qualified_request_pio_output_0_s1;
  --cpu_0/data_master saved-grant pio_output_0/s1, which is an e_assign
  cpu_0_data_master_saved_grant_pio_output_0_s1 <= internal_cpu_0_data_master_requests_pio_output_0_s1;
  --allow new arb cycle for pio_output_0/s1, which is an e_assign
  pio_output_0_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  pio_output_0_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  pio_output_0_s1_master_qreq_vector <= std_logic'('1');
  --pio_output_0_s1_reset_n assignment, which is an e_assign
  pio_output_0_s1_reset_n <= reset_n;
  pio_output_0_s1_chipselect <= internal_cpu_0_data_master_granted_pio_output_0_s1;
  --pio_output_0_s1_firsttransfer first transaction, which is an e_assign
  pio_output_0_s1_firsttransfer <= A_WE_StdLogic((std_logic'(pio_output_0_s1_begins_xfer) = '1'), pio_output_0_s1_unreg_firsttransfer, pio_output_0_s1_reg_firsttransfer);
  --pio_output_0_s1_unreg_firsttransfer first transaction, which is an e_assign
  pio_output_0_s1_unreg_firsttransfer <= NOT ((pio_output_0_s1_slavearbiterlockenable AND pio_output_0_s1_any_continuerequest));
  --pio_output_0_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_0_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(pio_output_0_s1_begins_xfer) = '1' then 
        pio_output_0_s1_reg_firsttransfer <= pio_output_0_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --pio_output_0_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  pio_output_0_s1_beginbursttransfer_internal <= pio_output_0_s1_begins_xfer;
  --~pio_output_0_s1_write_n assignment, which is an e_mux
  pio_output_0_s1_write_n <= NOT ((internal_cpu_0_data_master_granted_pio_output_0_s1 AND cpu_0_data_master_write));
  shifted_address_to_pio_output_0_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --pio_output_0_s1_address mux, which is an e_mux
  pio_output_0_s1_address <= A_EXT (A_SRL(shifted_address_to_pio_output_0_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_pio_output_0_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_pio_output_0_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_pio_output_0_s1_end_xfer <= pio_output_0_s1_end_xfer;
    end if;

  end process;

  --pio_output_0_s1_waits_for_read in a cycle, which is an e_mux
  pio_output_0_s1_waits_for_read <= pio_output_0_s1_in_a_read_cycle AND pio_output_0_s1_begins_xfer;
  --pio_output_0_s1_in_a_read_cycle assignment, which is an e_assign
  pio_output_0_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_pio_output_0_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= pio_output_0_s1_in_a_read_cycle;
  --pio_output_0_s1_waits_for_write in a cycle, which is an e_mux
  pio_output_0_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pio_output_0_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --pio_output_0_s1_in_a_write_cycle assignment, which is an e_assign
  pio_output_0_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_pio_output_0_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= pio_output_0_s1_in_a_write_cycle;
  wait_for_pio_output_0_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_pio_output_0_s1 <= internal_cpu_0_data_master_granted_pio_output_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_pio_output_0_s1 <= internal_cpu_0_data_master_qualified_request_pio_output_0_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_pio_output_0_s1 <= internal_cpu_0_data_master_requests_pio_output_0_s1;
--synthesis translate_off
    --pio_output_0/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity pio_output_1_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_1_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_granted_pio_output_1_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_pio_output_1_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_pio_output_1_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_pio_output_1_s1 : OUT STD_LOGIC;
                 signal d1_pio_output_1_s1_end_xfer : OUT STD_LOGIC;
                 signal pio_output_1_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal pio_output_1_s1_chipselect : OUT STD_LOGIC;
                 signal pio_output_1_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal pio_output_1_s1_reset_n : OUT STD_LOGIC;
                 signal pio_output_1_s1_write_n : OUT STD_LOGIC;
                 signal pio_output_1_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
              );
end entity pio_output_1_s1_arbitrator;


architecture europa of pio_output_1_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_pio_output_1_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_pio_output_1_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_pio_output_1_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_pio_output_1_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_pio_output_1_s1 :  STD_LOGIC;
                signal pio_output_1_s1_allgrants :  STD_LOGIC;
                signal pio_output_1_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal pio_output_1_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal pio_output_1_s1_any_continuerequest :  STD_LOGIC;
                signal pio_output_1_s1_arb_counter_enable :  STD_LOGIC;
                signal pio_output_1_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_1_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_1_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal pio_output_1_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal pio_output_1_s1_begins_xfer :  STD_LOGIC;
                signal pio_output_1_s1_end_xfer :  STD_LOGIC;
                signal pio_output_1_s1_firsttransfer :  STD_LOGIC;
                signal pio_output_1_s1_grant_vector :  STD_LOGIC;
                signal pio_output_1_s1_in_a_read_cycle :  STD_LOGIC;
                signal pio_output_1_s1_in_a_write_cycle :  STD_LOGIC;
                signal pio_output_1_s1_master_qreq_vector :  STD_LOGIC;
                signal pio_output_1_s1_non_bursting_master_requests :  STD_LOGIC;
                signal pio_output_1_s1_reg_firsttransfer :  STD_LOGIC;
                signal pio_output_1_s1_slavearbiterlockenable :  STD_LOGIC;
                signal pio_output_1_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal pio_output_1_s1_unreg_firsttransfer :  STD_LOGIC;
                signal pio_output_1_s1_waits_for_read :  STD_LOGIC;
                signal pio_output_1_s1_waits_for_write :  STD_LOGIC;
                signal shifted_address_to_pio_output_1_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal wait_for_pio_output_1_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT pio_output_1_s1_end_xfer;
    end if;

  end process;

  pio_output_1_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_pio_output_1_s1);
  --assign pio_output_1_s1_readdata_from_sa = pio_output_1_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  pio_output_1_s1_readdata_from_sa <= pio_output_1_s1_readdata;
  internal_cpu_0_data_master_requests_pio_output_1_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 4) & std_logic_vector'("0000")) = std_logic_vector'("100000001000001100000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --pio_output_1_s1_arb_share_counter set values, which is an e_mux
  pio_output_1_s1_arb_share_set_values <= std_logic_vector'("001");
  --pio_output_1_s1_non_bursting_master_requests mux, which is an e_mux
  pio_output_1_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_pio_output_1_s1;
  --pio_output_1_s1_any_bursting_master_saved_grant mux, which is an e_mux
  pio_output_1_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --pio_output_1_s1_arb_share_counter_next_value assignment, which is an e_assign
  pio_output_1_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(pio_output_1_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_output_1_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(pio_output_1_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (pio_output_1_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --pio_output_1_s1_allgrants all slave grants, which is an e_mux
  pio_output_1_s1_allgrants <= pio_output_1_s1_grant_vector;
  --pio_output_1_s1_end_xfer assignment, which is an e_assign
  pio_output_1_s1_end_xfer <= NOT ((pio_output_1_s1_waits_for_read OR pio_output_1_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_pio_output_1_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_pio_output_1_s1 <= pio_output_1_s1_end_xfer AND (((NOT pio_output_1_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --pio_output_1_s1_arb_share_counter arbitration counter enable, which is an e_assign
  pio_output_1_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_pio_output_1_s1 AND pio_output_1_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_pio_output_1_s1 AND NOT pio_output_1_s1_non_bursting_master_requests));
  --pio_output_1_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_1_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(pio_output_1_s1_arb_counter_enable) = '1' then 
        pio_output_1_s1_arb_share_counter <= pio_output_1_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --pio_output_1_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_1_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((pio_output_1_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_pio_output_1_s1)) OR ((end_xfer_arb_share_counter_term_pio_output_1_s1 AND NOT pio_output_1_s1_non_bursting_master_requests)))) = '1' then 
        pio_output_1_s1_slavearbiterlockenable <= or_reduce(pio_output_1_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master pio_output_1/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= pio_output_1_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --pio_output_1_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  pio_output_1_s1_slavearbiterlockenable2 <= or_reduce(pio_output_1_s1_arb_share_counter_next_value);
  --cpu_0/data_master pio_output_1/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= pio_output_1_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --pio_output_1_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  pio_output_1_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_pio_output_1_s1 <= internal_cpu_0_data_master_requests_pio_output_1_s1 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --pio_output_1_s1_writedata mux, which is an e_mux
  pio_output_1_s1_writedata <= cpu_0_data_master_writedata;
  --master is always granted when requested
  internal_cpu_0_data_master_granted_pio_output_1_s1 <= internal_cpu_0_data_master_qualified_request_pio_output_1_s1;
  --cpu_0/data_master saved-grant pio_output_1/s1, which is an e_assign
  cpu_0_data_master_saved_grant_pio_output_1_s1 <= internal_cpu_0_data_master_requests_pio_output_1_s1;
  --allow new arb cycle for pio_output_1/s1, which is an e_assign
  pio_output_1_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  pio_output_1_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  pio_output_1_s1_master_qreq_vector <= std_logic'('1');
  --pio_output_1_s1_reset_n assignment, which is an e_assign
  pio_output_1_s1_reset_n <= reset_n;
  pio_output_1_s1_chipselect <= internal_cpu_0_data_master_granted_pio_output_1_s1;
  --pio_output_1_s1_firsttransfer first transaction, which is an e_assign
  pio_output_1_s1_firsttransfer <= A_WE_StdLogic((std_logic'(pio_output_1_s1_begins_xfer) = '1'), pio_output_1_s1_unreg_firsttransfer, pio_output_1_s1_reg_firsttransfer);
  --pio_output_1_s1_unreg_firsttransfer first transaction, which is an e_assign
  pio_output_1_s1_unreg_firsttransfer <= NOT ((pio_output_1_s1_slavearbiterlockenable AND pio_output_1_s1_any_continuerequest));
  --pio_output_1_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      pio_output_1_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(pio_output_1_s1_begins_xfer) = '1' then 
        pio_output_1_s1_reg_firsttransfer <= pio_output_1_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --pio_output_1_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  pio_output_1_s1_beginbursttransfer_internal <= pio_output_1_s1_begins_xfer;
  --~pio_output_1_s1_write_n assignment, which is an e_mux
  pio_output_1_s1_write_n <= NOT ((internal_cpu_0_data_master_granted_pio_output_1_s1 AND cpu_0_data_master_write));
  shifted_address_to_pio_output_1_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --pio_output_1_s1_address mux, which is an e_mux
  pio_output_1_s1_address <= A_EXT (A_SRL(shifted_address_to_pio_output_1_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 2);
  --d1_pio_output_1_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_pio_output_1_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_pio_output_1_s1_end_xfer <= pio_output_1_s1_end_xfer;
    end if;

  end process;

  --pio_output_1_s1_waits_for_read in a cycle, which is an e_mux
  pio_output_1_s1_waits_for_read <= pio_output_1_s1_in_a_read_cycle AND pio_output_1_s1_begins_xfer;
  --pio_output_1_s1_in_a_read_cycle assignment, which is an e_assign
  pio_output_1_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_pio_output_1_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= pio_output_1_s1_in_a_read_cycle;
  --pio_output_1_s1_waits_for_write in a cycle, which is an e_mux
  pio_output_1_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(pio_output_1_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --pio_output_1_s1_in_a_write_cycle assignment, which is an e_assign
  pio_output_1_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_pio_output_1_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= pio_output_1_s1_in_a_write_cycle;
  wait_for_pio_output_1_s1_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_pio_output_1_s1 <= internal_cpu_0_data_master_granted_pio_output_1_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_pio_output_1_s1 <= internal_cpu_0_data_master_qualified_request_pio_output_1_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_pio_output_1_s1 <= internal_cpu_0_data_master_requests_pio_output_1_s1;
--synthesis translate_off
    --pio_output_1/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module is 
        port (
              -- inputs:
                 signal clear_fifo : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sync_reset : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC;
                 signal empty : OUT STD_LOGIC;
                 signal fifo_contains_ones_n : OUT STD_LOGIC;
                 signal full : OUT STD_LOGIC
              );
end entity rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module;


architecture europa of rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module is
                signal full_0 :  STD_LOGIC;
                signal full_1 :  STD_LOGIC;
                signal full_2 :  STD_LOGIC;
                signal how_many_ones :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal one_count_minus_one :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal one_count_plus_one :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal p0_full_0 :  STD_LOGIC;
                signal p0_stage_0 :  STD_LOGIC;
                signal p1_full_1 :  STD_LOGIC;
                signal p1_stage_1 :  STD_LOGIC;
                signal stage_0 :  STD_LOGIC;
                signal stage_1 :  STD_LOGIC;
                signal updated_one_count :  STD_LOGIC_VECTOR (2 DOWNTO 0);

begin

  data_out <= stage_0;
  full <= full_1;
  empty <= NOT(full_0);
  full_2 <= std_logic'('0');
  --data_1, which is an e_mux
  p1_stage_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_2 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, data_in);
  --data_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_1))))) = '1' then 
        if std_logic'(((sync_reset AND full_1) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_2))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_1 <= std_logic'('0');
        else
          stage_1 <= p1_stage_1;
        end if;
      end if;
    end if;

  end process;

  --control_1, which is an e_mux
  p1_full_1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_0))), std_logic_vector'("00000000000000000000000000000000")));
  --control_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_1 <= std_logic'('0');
        else
          full_1 <= p1_full_1;
        end if;
      end if;
    end if;

  end process;

  --data_0, which is an e_mux
  p0_stage_0 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_1 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_1);
  --data_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(((sync_reset AND full_0) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_0 <= std_logic'('0');
        else
          stage_0 <= p0_stage_0;
        end if;
      end if;
    end if;

  end process;

  --control_0, which is an e_mux
  p0_full_0 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), std_logic_vector'("00000000000000000000000000000001"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1)))));
  --control_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'((clear_fifo AND NOT write)) = '1' then 
          full_0 <= std_logic'('0');
        else
          full_0 <= p0_full_0;
        end if;
      end if;
    end if;

  end process;

  one_count_plus_one <= A_EXT (((std_logic_vector'("000000000000000000000000000000") & (how_many_ones)) + std_logic_vector'("000000000000000000000000000000001")), 3);
  one_count_minus_one <= A_EXT (((std_logic_vector'("000000000000000000000000000000") & (how_many_ones)) - std_logic_vector'("000000000000000000000000000000001")), 3);
  --updated_one_count, which is an e_mux
  updated_one_count <= A_EXT (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND NOT(write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("00000000000000000000000000000") & (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND write))) = '1'), (std_logic_vector'("00") & (A_TOSTDLOGICVECTOR(data_in))), A_WE_StdLogicVector((std_logic'(((((read AND (data_in)) AND write) AND (stage_0)))) = '1'), how_many_ones, A_WE_StdLogicVector((std_logic'(((write AND (data_in)))) = '1'), one_count_plus_one, A_WE_StdLogicVector((std_logic'(((read AND (stage_0)))) = '1'), one_count_minus_one, how_many_ones))))))), 3);
  --counts how many ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      how_many_ones <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        how_many_ones <= updated_one_count;
      end if;
    end if;

  end process;

  --this fifo contains ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_contains_ones_n <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        fifo_contains_ones_n <= NOT (or_reduce(updated_one_count));
      end if;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module is 
        port (
              -- inputs:
                 signal clear_fifo : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sync_reset : IN STD_LOGIC;
                 signal write : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC;
                 signal empty : OUT STD_LOGIC;
                 signal fifo_contains_ones_n : OUT STD_LOGIC;
                 signal full : OUT STD_LOGIC
              );
end entity rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module;


architecture europa of rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module is
                signal full_0 :  STD_LOGIC;
                signal full_1 :  STD_LOGIC;
                signal full_2 :  STD_LOGIC;
                signal how_many_ones :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal one_count_minus_one :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal one_count_plus_one :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal p0_full_0 :  STD_LOGIC;
                signal p0_stage_0 :  STD_LOGIC;
                signal p1_full_1 :  STD_LOGIC;
                signal p1_stage_1 :  STD_LOGIC;
                signal stage_0 :  STD_LOGIC;
                signal stage_1 :  STD_LOGIC;
                signal updated_one_count :  STD_LOGIC_VECTOR (2 DOWNTO 0);

begin

  data_out <= stage_0;
  full <= full_1;
  empty <= NOT(full_0);
  full_2 <= std_logic'('0');
  --data_1, which is an e_mux
  p1_stage_1 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_2 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, data_in);
  --data_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_1))))) = '1' then 
        if std_logic'(((sync_reset AND full_1) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_2))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_1 <= std_logic'('0');
        else
          stage_1 <= p1_stage_1;
        end if;
      end if;
    end if;

  end process;

  --control_1, which is an e_mux
  p1_full_1 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_0))), std_logic_vector'("00000000000000000000000000000000")));
  --control_reg_1, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(clear_fifo) = '1' then 
          full_1 <= std_logic'('0');
        else
          full_1 <= p1_full_1;
        end if;
      end if;
    end if;

  end process;

  --data_0, which is an e_mux
  p0_stage_0 <= A_WE_StdLogic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((full_1 AND NOT clear_fifo))))) = std_logic_vector'("00000000000000000000000000000000"))), data_in, stage_1);
  --data_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      stage_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'(((sync_reset AND full_0) AND NOT((((to_std_logic((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1))) = std_logic_vector'("00000000000000000000000000000000")))) AND read) AND write))))) = '1' then 
          stage_0 <= std_logic'('0');
        else
          stage_0 <= p0_stage_0;
        end if;
      end if;
    end if;

  end process;

  --control_0, which is an e_mux
  p0_full_0 <= Vector_To_Std_Logic(A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((read AND NOT(write)))))) = std_logic_vector'("00000000000000000000000000000000"))), std_logic_vector'("00000000000000000000000000000001"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(full_1)))));
  --control_reg_0, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      full_0 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(((clear_fifo OR ((read XOR write))) OR ((write AND NOT(full_0))))) = '1' then 
        if std_logic'((clear_fifo AND NOT write)) = '1' then 
          full_0 <= std_logic'('0');
        else
          full_0 <= p0_full_0;
        end if;
      end if;
    end if;

  end process;

  one_count_plus_one <= A_EXT (((std_logic_vector'("000000000000000000000000000000") & (how_many_ones)) + std_logic_vector'("000000000000000000000000000000001")), 3);
  one_count_minus_one <= A_EXT (((std_logic_vector'("000000000000000000000000000000") & (how_many_ones)) - std_logic_vector'("000000000000000000000000000000001")), 3);
  --updated_one_count, which is an e_mux
  updated_one_count <= A_EXT (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND NOT(write)))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("00000000000000000000000000000") & (A_WE_StdLogicVector((std_logic'(((((clear_fifo OR sync_reset)) AND write))) = '1'), (std_logic_vector'("00") & (A_TOSTDLOGICVECTOR(data_in))), A_WE_StdLogicVector((std_logic'(((((read AND (data_in)) AND write) AND (stage_0)))) = '1'), how_many_ones, A_WE_StdLogicVector((std_logic'(((write AND (data_in)))) = '1'), one_count_plus_one, A_WE_StdLogicVector((std_logic'(((read AND (stage_0)))) = '1'), one_count_minus_one, how_many_ones))))))), 3);
  --counts how many ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      how_many_ones <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        how_many_ones <= updated_one_count;
      end if;
    end if;

  end process;

  --this fifo contains ones in the data pipeline, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      fifo_contains_ones_n <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'((((clear_fifo OR sync_reset) OR read) OR write)) = '1' then 
        fifo_contains_ones_n <= NOT (or_reduce(updated_one_count));
      end if;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library std;
use std.textio.all;

entity sram_0_avalon_sram_slave_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                 signal cpu_0_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_data_master_dbs_write_16 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal cpu_0_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_instruction_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_instruction_master_read : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sram_0_avalon_sram_slave_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal sram_0_avalon_sram_slave_readdatavalid : IN STD_LOGIC;

              -- outputs:
                 signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal cpu_0_data_master_granted_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_granted_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : OUT STD_LOGIC;
                 signal cpu_0_instruction_master_requests_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                 signal d1_sram_0_avalon_sram_slave_end_xfer : OUT STD_LOGIC;
                 signal sram_0_avalon_sram_slave_address : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal sram_0_avalon_sram_slave_byteenable : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                 signal sram_0_avalon_sram_slave_read : OUT STD_LOGIC;
                 signal sram_0_avalon_sram_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal sram_0_avalon_sram_slave_reset : OUT STD_LOGIC;
                 signal sram_0_avalon_sram_slave_write : OUT STD_LOGIC;
                 signal sram_0_avalon_sram_slave_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity sram_0_avalon_sram_slave_arbitrator;


architecture europa of sram_0_avalon_sram_slave_arbitrator is
component rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module is 
           port (
                 -- inputs:
                    signal clear_fifo : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sync_reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC;
                    signal empty : OUT STD_LOGIC;
                    signal fifo_contains_ones_n : OUT STD_LOGIC;
                    signal full : OUT STD_LOGIC
                 );
end component rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module;

component rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module is 
           port (
                 -- inputs:
                    signal clear_fifo : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sync_reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC;
                    signal empty : OUT STD_LOGIC;
                    signal fifo_contains_ones_n : OUT STD_LOGIC;
                    signal full : OUT STD_LOGIC
                 );
end component rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module;

                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0 :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1 :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_instruction_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_instruction_master_continuerequest :  STD_LOGIC;
                signal cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_byteenable_sram_0_avalon_sram_slave :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal internal_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register :  STD_LOGIC;
                signal internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal module_input :  STD_LOGIC;
                signal module_input1 :  STD_LOGIC;
                signal module_input2 :  STD_LOGIC;
                signal module_input3 :  STD_LOGIC;
                signal module_input4 :  STD_LOGIC;
                signal module_input5 :  STD_LOGIC;
                signal shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal sram_0_avalon_sram_slave_allgrants :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_any_continuerequest :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_arb_addend :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_arb_counter_enable :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sram_0_avalon_sram_slave_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sram_0_avalon_sram_slave_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal sram_0_avalon_sram_slave_arb_winner :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_arbitration_holdoff_internal :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_begins_xfer :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_chosen_master_double_vector :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal sram_0_avalon_sram_slave_chosen_master_rot_left :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_end_xfer :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_firsttransfer :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_grant_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_in_a_read_cycle :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_in_a_write_cycle :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_master_qreq_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_move_on_to_next_transaction :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_non_bursting_master_requests :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_readdatavalid_from_sa :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_reg_firsttransfer :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_saved_chosen_master_vector :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_slavearbiterlockenable :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_unreg_firsttransfer :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_waits_for_read :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_waits_for_write :  STD_LOGIC;
                signal wait_for_sram_0_avalon_sram_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sram_0_avalon_sram_slave_end_xfer;
    end if;

  end process;

  sram_0_avalon_sram_slave_begins_xfer <= NOT d1_reasons_to_wait AND ((internal_cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave OR internal_cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave));
  --assign sram_0_avalon_sram_slave_readdata_from_sa = sram_0_avalon_sram_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sram_0_avalon_sram_slave_readdata_from_sa <= sram_0_avalon_sram_slave_readdata;
  internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 19) & std_logic_vector'("0000000000000000000")) = std_logic_vector'("010000000000000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --assign sram_0_avalon_sram_slave_readdatavalid_from_sa = sram_0_avalon_sram_slave_readdatavalid so that symbol knows where to group signals which may go to master only, which is an e_assign
  sram_0_avalon_sram_slave_readdatavalid_from_sa <= sram_0_avalon_sram_slave_readdatavalid;
  --sram_0_avalon_sram_slave_arb_share_counter set values, which is an e_mux
  sram_0_avalon_sram_slave_arb_share_set_values <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), A_WE_StdLogicVector((std_logic'((internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), A_WE_StdLogicVector((std_logic'((internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave)) = '1'), std_logic_vector'("00000000000000000000000000000010"), std_logic_vector'("00000000000000000000000000000001"))))), 3);
  --sram_0_avalon_sram_slave_non_bursting_master_requests mux, which is an e_mux
  sram_0_avalon_sram_slave_non_bursting_master_requests <= ((internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave OR internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave) OR internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave) OR internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  --sram_0_avalon_sram_slave_any_bursting_master_saved_grant mux, which is an e_mux
  sram_0_avalon_sram_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --sram_0_avalon_sram_slave_arb_share_counter_next_value assignment, which is an e_assign
  sram_0_avalon_sram_slave_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(sram_0_avalon_sram_slave_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sram_0_avalon_sram_slave_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(sram_0_avalon_sram_slave_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (sram_0_avalon_sram_slave_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --sram_0_avalon_sram_slave_allgrants all slave grants, which is an e_mux
  sram_0_avalon_sram_slave_allgrants <= (((or_reduce(sram_0_avalon_sram_slave_grant_vector)) OR (or_reduce(sram_0_avalon_sram_slave_grant_vector))) OR (or_reduce(sram_0_avalon_sram_slave_grant_vector))) OR (or_reduce(sram_0_avalon_sram_slave_grant_vector));
  --sram_0_avalon_sram_slave_end_xfer assignment, which is an e_assign
  sram_0_avalon_sram_slave_end_xfer <= NOT ((sram_0_avalon_sram_slave_waits_for_read OR sram_0_avalon_sram_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave <= sram_0_avalon_sram_slave_end_xfer AND (((NOT sram_0_avalon_sram_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sram_0_avalon_sram_slave_arb_share_counter arbitration counter enable, which is an e_assign
  sram_0_avalon_sram_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave AND sram_0_avalon_sram_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave AND NOT sram_0_avalon_sram_slave_non_bursting_master_requests));
  --sram_0_avalon_sram_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sram_0_avalon_sram_slave_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(sram_0_avalon_sram_slave_arb_counter_enable) = '1' then 
        sram_0_avalon_sram_slave_arb_share_counter <= sram_0_avalon_sram_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sram_0_avalon_sram_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sram_0_avalon_sram_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((or_reduce(sram_0_avalon_sram_slave_master_qreq_vector) AND end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave)) OR ((end_xfer_arb_share_counter_term_sram_0_avalon_sram_slave AND NOT sram_0_avalon_sram_slave_non_bursting_master_requests)))) = '1' then 
        sram_0_avalon_sram_slave_slavearbiterlockenable <= or_reduce(sram_0_avalon_sram_slave_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= sram_0_avalon_sram_slave_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --sram_0_avalon_sram_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sram_0_avalon_sram_slave_slavearbiterlockenable2 <= or_reduce(sram_0_avalon_sram_slave_arb_share_counter_next_value);
  --cpu_0/data_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= sram_0_avalon_sram_slave_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock, which is an e_assign
  cpu_0_instruction_master_arbiterlock <= sram_0_avalon_sram_slave_slavearbiterlockenable AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master sram_0/avalon_sram_slave arbiterlock2, which is an e_assign
  cpu_0_instruction_master_arbiterlock2 <= sram_0_avalon_sram_slave_slavearbiterlockenable2 AND cpu_0_instruction_master_continuerequest;
  --cpu_0/instruction_master granted sram_0/avalon_sram_slave last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((sram_0_avalon_sram_slave_arbitration_holdoff_internal OR NOT internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave))))));
    end if;

  end process;

  --cpu_0_instruction_master_continuerequest continued request, which is an e_mux
  cpu_0_instruction_master_continuerequest <= last_cycle_cpu_0_instruction_master_granted_slave_sram_0_avalon_sram_slave AND internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  --sram_0_avalon_sram_slave_any_continuerequest at least one master continues requesting, which is an e_mux
  sram_0_avalon_sram_slave_any_continuerequest <= cpu_0_instruction_master_continuerequest OR cpu_0_data_master_continuerequest;
  internal_cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave <= internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave AND NOT (((((cpu_0_data_master_read AND ((NOT cpu_0_data_master_waitrequest OR (internal_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register))))) OR (((((NOT cpu_0_data_master_waitrequest OR cpu_0_data_master_no_byte_enables_and_last_term) OR NOT(or_reduce(internal_cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)))) AND cpu_0_data_master_write))) OR cpu_0_instruction_master_arbiterlock));
  --unique name for sram_0_avalon_sram_slave_move_on_to_next_transaction, which is an e_assign
  sram_0_avalon_sram_slave_move_on_to_next_transaction <= sram_0_avalon_sram_slave_readdatavalid_from_sa;
  --rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave : rdv_fifo_for_cpu_0_data_master_to_sram_0_avalon_sram_slave_module
    port map(
      data_out => cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave,
      empty => open,
      fifo_contains_ones_n => cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave,
      full => open,
      clear_fifo => module_input,
      clk => clk,
      data_in => internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave,
      read => sram_0_avalon_sram_slave_move_on_to_next_transaction,
      reset_n => reset_n,
      sync_reset => module_input1,
      write => module_input2
    );

  module_input <= std_logic'('0');
  module_input1 <= std_logic'('0');
  module_input2 <= in_a_read_cycle AND NOT sram_0_avalon_sram_slave_waits_for_read;

  internal_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= NOT cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  --local readdatavalid cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave <= ((sram_0_avalon_sram_slave_readdatavalid_from_sa AND cpu_0_data_master_rdv_fifo_output_from_sram_0_avalon_sram_slave)) AND NOT cpu_0_data_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  --sram_0_avalon_sram_slave_writedata mux, which is an e_mux
  sram_0_avalon_sram_slave_writedata <= cpu_0_data_master_dbs_write_16;
  internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave <= ((to_std_logic(((Std_Logic_Vector'(cpu_0_instruction_master_address_to_slave(20 DOWNTO 19) & std_logic_vector'("0000000000000000000")) = std_logic_vector'("010000000000000000000")))) AND (cpu_0_instruction_master_read))) AND cpu_0_instruction_master_read;
  --cpu_0/data_master granted sram_0/avalon_sram_slave last time, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= std_logic'('0');
    elsif clk'event and clk = '1' then
      last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave) = '1'), std_logic_vector'("00000000000000000000000000000001"), A_WE_StdLogicVector((std_logic'(((sram_0_avalon_sram_slave_arbitration_holdoff_internal OR NOT internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave))) = '1'), std_logic_vector'("00000000000000000000000000000000"), (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave))))));
    end if;

  end process;

  --cpu_0_data_master_continuerequest continued request, which is an e_mux
  cpu_0_data_master_continuerequest <= last_cycle_cpu_0_data_master_granted_slave_sram_0_avalon_sram_slave AND internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  internal_cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave <= internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave AND NOT ((((cpu_0_instruction_master_read AND (internal_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register))) OR cpu_0_data_master_arbiterlock));
  --rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave, which is an e_fifo_with_registered_outputs
  rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave : rdv_fifo_for_cpu_0_instruction_master_to_sram_0_avalon_sram_slave_module
    port map(
      data_out => cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave,
      empty => open,
      fifo_contains_ones_n => cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave,
      full => open,
      clear_fifo => module_input3,
      clk => clk,
      data_in => internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
      read => sram_0_avalon_sram_slave_move_on_to_next_transaction,
      reset_n => reset_n,
      sync_reset => module_input4,
      write => module_input5
    );

  module_input3 <= std_logic'('0');
  module_input4 <= std_logic'('0');
  module_input5 <= in_a_read_cycle AND NOT sram_0_avalon_sram_slave_waits_for_read;

  internal_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= NOT cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  --local readdatavalid cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave, which is an e_mux
  cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave <= ((sram_0_avalon_sram_slave_readdatavalid_from_sa AND cpu_0_instruction_master_rdv_fifo_output_from_sram_0_avalon_sram_slave)) AND NOT cpu_0_instruction_master_rdv_fifo_empty_sram_0_avalon_sram_slave;
  --allow new arb cycle for sram_0/avalon_sram_slave, which is an e_assign
  sram_0_avalon_sram_slave_allow_new_arb_cycle <= NOT cpu_0_data_master_arbiterlock AND NOT cpu_0_instruction_master_arbiterlock;
  --cpu_0/instruction_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  sram_0_avalon_sram_slave_master_qreq_vector(0) <= internal_cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  --cpu_0/instruction_master grant sram_0/avalon_sram_slave, which is an e_assign
  internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave <= sram_0_avalon_sram_slave_grant_vector(0);
  --cpu_0/instruction_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave <= sram_0_avalon_sram_slave_arb_winner(0) AND internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
  --cpu_0/data_master assignment into master qualified-requests vector for sram_0/avalon_sram_slave, which is an e_assign
  sram_0_avalon_sram_slave_master_qreq_vector(1) <= internal_cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  --cpu_0/data_master grant sram_0/avalon_sram_slave, which is an e_assign
  internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave <= sram_0_avalon_sram_slave_grant_vector(1);
  --cpu_0/data_master saved-grant sram_0/avalon_sram_slave, which is an e_assign
  cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave <= sram_0_avalon_sram_slave_arb_winner(1) AND internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  --sram_0/avalon_sram_slave chosen-master double-vector, which is an e_assign
  sram_0_avalon_sram_slave_chosen_master_double_vector <= A_EXT (((std_logic_vector'("0") & ((sram_0_avalon_sram_slave_master_qreq_vector & sram_0_avalon_sram_slave_master_qreq_vector))) AND (((std_logic_vector'("0") & (Std_Logic_Vector'(NOT sram_0_avalon_sram_slave_master_qreq_vector & NOT sram_0_avalon_sram_slave_master_qreq_vector))) + (std_logic_vector'("000") & (sram_0_avalon_sram_slave_arb_addend))))), 4);
  --stable onehot encoding of arb winner
  sram_0_avalon_sram_slave_arb_winner <= A_WE_StdLogicVector((std_logic'(((sram_0_avalon_sram_slave_allow_new_arb_cycle AND or_reduce(sram_0_avalon_sram_slave_grant_vector)))) = '1'), sram_0_avalon_sram_slave_grant_vector, sram_0_avalon_sram_slave_saved_chosen_master_vector);
  --saved sram_0_avalon_sram_slave_grant_vector, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sram_0_avalon_sram_slave_saved_chosen_master_vector <= std_logic_vector'("00");
    elsif clk'event and clk = '1' then
      if std_logic'(sram_0_avalon_sram_slave_allow_new_arb_cycle) = '1' then 
        sram_0_avalon_sram_slave_saved_chosen_master_vector <= A_WE_StdLogicVector((std_logic'(or_reduce(sram_0_avalon_sram_slave_grant_vector)) = '1'), sram_0_avalon_sram_slave_grant_vector, sram_0_avalon_sram_slave_saved_chosen_master_vector);
      end if;
    end if;

  end process;

  --onehot encoding of chosen master
  sram_0_avalon_sram_slave_grant_vector <= Std_Logic_Vector'(A_ToStdLogicVector(((sram_0_avalon_sram_slave_chosen_master_double_vector(1) OR sram_0_avalon_sram_slave_chosen_master_double_vector(3)))) & A_ToStdLogicVector(((sram_0_avalon_sram_slave_chosen_master_double_vector(0) OR sram_0_avalon_sram_slave_chosen_master_double_vector(2)))));
  --sram_0/avalon_sram_slave chosen master rotated left, which is an e_assign
  sram_0_avalon_sram_slave_chosen_master_rot_left <= A_EXT (A_WE_StdLogicVector((((A_SLL(sram_0_avalon_sram_slave_arb_winner,std_logic_vector'("00000000000000000000000000000001")))) /= std_logic_vector'("00")), (std_logic_vector'("000000000000000000000000000000") & ((A_SLL(sram_0_avalon_sram_slave_arb_winner,std_logic_vector'("00000000000000000000000000000001"))))), std_logic_vector'("00000000000000000000000000000001")), 2);
  --sram_0/avalon_sram_slave's addend for next-master-grant
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sram_0_avalon_sram_slave_arb_addend <= std_logic_vector'("01");
    elsif clk'event and clk = '1' then
      if std_logic'(or_reduce(sram_0_avalon_sram_slave_grant_vector)) = '1' then 
        sram_0_avalon_sram_slave_arb_addend <= A_WE_StdLogicVector((std_logic'(sram_0_avalon_sram_slave_end_xfer) = '1'), sram_0_avalon_sram_slave_chosen_master_rot_left, sram_0_avalon_sram_slave_grant_vector);
      end if;
    end if;

  end process;

  --~sram_0_avalon_sram_slave_reset assignment, which is an e_assign
  sram_0_avalon_sram_slave_reset <= NOT reset_n;
  --sram_0_avalon_sram_slave_firsttransfer first transaction, which is an e_assign
  sram_0_avalon_sram_slave_firsttransfer <= A_WE_StdLogic((std_logic'(sram_0_avalon_sram_slave_begins_xfer) = '1'), sram_0_avalon_sram_slave_unreg_firsttransfer, sram_0_avalon_sram_slave_reg_firsttransfer);
  --sram_0_avalon_sram_slave_unreg_firsttransfer first transaction, which is an e_assign
  sram_0_avalon_sram_slave_unreg_firsttransfer <= NOT ((sram_0_avalon_sram_slave_slavearbiterlockenable AND sram_0_avalon_sram_slave_any_continuerequest));
  --sram_0_avalon_sram_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sram_0_avalon_sram_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sram_0_avalon_sram_slave_begins_xfer) = '1' then 
        sram_0_avalon_sram_slave_reg_firsttransfer <= sram_0_avalon_sram_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sram_0_avalon_sram_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sram_0_avalon_sram_slave_beginbursttransfer_internal <= sram_0_avalon_sram_slave_begins_xfer;
  --sram_0_avalon_sram_slave_arbitration_holdoff_internal arbitration_holdoff, which is an e_assign
  sram_0_avalon_sram_slave_arbitration_holdoff_internal <= sram_0_avalon_sram_slave_begins_xfer AND sram_0_avalon_sram_slave_firsttransfer;
  --sram_0_avalon_sram_slave_read assignment, which is an e_mux
  sram_0_avalon_sram_slave_read <= ((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave AND cpu_0_data_master_read)) OR ((internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave AND cpu_0_instruction_master_read));
  --sram_0_avalon_sram_slave_write assignment, which is an e_mux
  sram_0_avalon_sram_slave_write <= internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave AND cpu_0_data_master_write;
  shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master <= A_EXT (Std_Logic_Vector'(A_SRL(cpu_0_data_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")) & A_ToStdLogicVector(cpu_0_data_master_dbs_address(1)) & A_ToStdLogicVector(std_logic'('0'))), 21);
  --sram_0_avalon_sram_slave_address mux, which is an e_mux
  sram_0_avalon_sram_slave_address <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave)) = '1'), (A_SRL(shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000001"))), (A_SRL(shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master,std_logic_vector'("00000000000000000000000000000001")))), 18);
  shifted_address_to_sram_0_avalon_sram_slave_from_cpu_0_instruction_master <= A_EXT (Std_Logic_Vector'(A_SRL(cpu_0_instruction_master_address_to_slave,std_logic_vector'("00000000000000000000000000000010")) & A_ToStdLogicVector(cpu_0_instruction_master_dbs_address(1)) & A_ToStdLogicVector(std_logic'('0'))), 21);
  --d1_sram_0_avalon_sram_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sram_0_avalon_sram_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sram_0_avalon_sram_slave_end_xfer <= sram_0_avalon_sram_slave_end_xfer;
    end if;

  end process;

  --sram_0_avalon_sram_slave_waits_for_read in a cycle, which is an e_mux
  sram_0_avalon_sram_slave_waits_for_read <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sram_0_avalon_sram_slave_in_a_read_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sram_0_avalon_sram_slave_in_a_read_cycle assignment, which is an e_assign
  sram_0_avalon_sram_slave_in_a_read_cycle <= ((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave AND cpu_0_data_master_read)) OR ((internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave AND cpu_0_instruction_master_read));
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sram_0_avalon_sram_slave_in_a_read_cycle;
  --sram_0_avalon_sram_slave_waits_for_write in a cycle, which is an e_mux
  sram_0_avalon_sram_slave_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sram_0_avalon_sram_slave_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sram_0_avalon_sram_slave_in_a_write_cycle assignment, which is an e_assign
  sram_0_avalon_sram_slave_in_a_write_cycle <= internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sram_0_avalon_sram_slave_in_a_write_cycle;
  wait_for_sram_0_avalon_sram_slave_counter <= std_logic'('0');
  --sram_0_avalon_sram_slave_byteenable byte enable port mux, which is an e_mux
  sram_0_avalon_sram_slave_byteenable <= A_EXT (A_WE_StdLogicVector((std_logic'((internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave)) = '1'), (std_logic_vector'("000000000000000000000000000000") & (internal_cpu_0_data_master_byteenable_sram_0_avalon_sram_slave)), -SIGNED(std_logic_vector'("00000000000000000000000000000001"))), 2);
  (cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1(1), cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1(0), cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0(1), cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0(0)) <= cpu_0_data_master_byteenable;
  internal_cpu_0_data_master_byteenable_sram_0_avalon_sram_slave <= A_WE_StdLogicVector((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_dbs_address(1)))) = std_logic_vector'("00000000000000000000000000000000"))), cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_0, cpu_0_data_master_byteenable_sram_0_avalon_sram_slave_segment_1);
  --vhdl renameroo for output signals
  cpu_0_data_master_byteenable_sram_0_avalon_sram_slave <= internal_cpu_0_data_master_byteenable_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_sram_0_avalon_sram_slave <= internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave <= internal_cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= internal_cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_sram_0_avalon_sram_slave <= internal_cpu_0_data_master_requests_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_granted_sram_0_avalon_sram_slave <= internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave <= internal_cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register <= internal_cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register;
  --vhdl renameroo for output signals
  cpu_0_instruction_master_requests_sram_0_avalon_sram_slave <= internal_cpu_0_instruction_master_requests_sram_0_avalon_sram_slave;
--synthesis translate_off
    --sram_0/avalon_sram_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

    --grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line13 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_data_master_granted_sram_0_avalon_sram_slave))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(internal_cpu_0_instruction_master_granted_sram_0_avalon_sram_slave))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line13, now);
          write(write_line13, string'(": "));
          write(write_line13, string'("> 1 of grant signals are active simultaneously"));
          write(output, write_line13.all);
          deallocate (write_line13);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

    --saved_grant signals are active simultaneously, which is an e_process
    process (clk)
    VARIABLE write_line14 : line;
    begin
      if clk'event and clk = '1' then
        if (std_logic_vector'("000000000000000000000000000000") & (((std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_data_master_saved_grant_sram_0_avalon_sram_slave))) + (std_logic_vector'("0") & (A_TOSTDLOGICVECTOR(cpu_0_instruction_master_saved_grant_sram_0_avalon_sram_slave))))))>std_logic_vector'("00000000000000000000000000000001") then 
          write(write_line14, now);
          write(write_line14, string'(": "));
          write(write_line14, string'("> 1 of saved_grant signals are active simultaneously"));
          write(output, write_line14.all);
          deallocate (write_line14);
          assert false report "VHDL STOP" severity failure;
        end if;
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity sysid_control_slave_arbitrator is 
        port (
              -- inputs:
                 signal CPU_System_clock_1_out_address_to_slave : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal CPU_System_clock_1_out_nativeaddress : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_read : IN STD_LOGIC;
                 signal CPU_System_clock_1_out_write : IN STD_LOGIC;
                 signal clk : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;
                 signal sysid_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

              -- outputs:
                 signal CPU_System_clock_1_out_granted_sysid_control_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_1_out_qualified_request_sysid_control_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_1_out_read_data_valid_sysid_control_slave : OUT STD_LOGIC;
                 signal CPU_System_clock_1_out_requests_sysid_control_slave : OUT STD_LOGIC;
                 signal d1_sysid_control_slave_end_xfer : OUT STD_LOGIC;
                 signal sysid_control_slave_address : OUT STD_LOGIC;
                 signal sysid_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal sysid_control_slave_reset_n : OUT STD_LOGIC
              );
end entity sysid_control_slave_arbitrator;


architecture europa of sysid_control_slave_arbitrator is
                signal CPU_System_clock_1_out_arbiterlock :  STD_LOGIC;
                signal CPU_System_clock_1_out_arbiterlock2 :  STD_LOGIC;
                signal CPU_System_clock_1_out_continuerequest :  STD_LOGIC;
                signal CPU_System_clock_1_out_saved_grant_sysid_control_slave :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_sysid_control_slave :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_CPU_System_clock_1_out_granted_sysid_control_slave :  STD_LOGIC;
                signal internal_CPU_System_clock_1_out_qualified_request_sysid_control_slave :  STD_LOGIC;
                signal internal_CPU_System_clock_1_out_requests_sysid_control_slave :  STD_LOGIC;
                signal sysid_control_slave_allgrants :  STD_LOGIC;
                signal sysid_control_slave_allow_new_arb_cycle :  STD_LOGIC;
                signal sysid_control_slave_any_bursting_master_saved_grant :  STD_LOGIC;
                signal sysid_control_slave_any_continuerequest :  STD_LOGIC;
                signal sysid_control_slave_arb_counter_enable :  STD_LOGIC;
                signal sysid_control_slave_arb_share_counter :  STD_LOGIC;
                signal sysid_control_slave_arb_share_counter_next_value :  STD_LOGIC;
                signal sysid_control_slave_arb_share_set_values :  STD_LOGIC;
                signal sysid_control_slave_beginbursttransfer_internal :  STD_LOGIC;
                signal sysid_control_slave_begins_xfer :  STD_LOGIC;
                signal sysid_control_slave_end_xfer :  STD_LOGIC;
                signal sysid_control_slave_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_grant_vector :  STD_LOGIC;
                signal sysid_control_slave_in_a_read_cycle :  STD_LOGIC;
                signal sysid_control_slave_in_a_write_cycle :  STD_LOGIC;
                signal sysid_control_slave_master_qreq_vector :  STD_LOGIC;
                signal sysid_control_slave_non_bursting_master_requests :  STD_LOGIC;
                signal sysid_control_slave_reg_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_slavearbiterlockenable :  STD_LOGIC;
                signal sysid_control_slave_slavearbiterlockenable2 :  STD_LOGIC;
                signal sysid_control_slave_unreg_firsttransfer :  STD_LOGIC;
                signal sysid_control_slave_waits_for_read :  STD_LOGIC;
                signal sysid_control_slave_waits_for_write :  STD_LOGIC;
                signal wait_for_sysid_control_slave_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT sysid_control_slave_end_xfer;
    end if;

  end process;

  sysid_control_slave_begins_xfer <= NOT d1_reasons_to_wait AND (internal_CPU_System_clock_1_out_qualified_request_sysid_control_slave);
  --assign sysid_control_slave_readdata_from_sa = sysid_control_slave_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  sysid_control_slave_readdata_from_sa <= sysid_control_slave_readdata;
  internal_CPU_System_clock_1_out_requests_sysid_control_slave <= Vector_To_Std_Logic(((((std_logic_vector'("00000000000000000000000000000001")) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(((CPU_System_clock_1_out_read OR CPU_System_clock_1_out_write))))))) AND (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(CPU_System_clock_1_out_read)))));
  --sysid_control_slave_arb_share_counter set values, which is an e_mux
  sysid_control_slave_arb_share_set_values <= std_logic'('1');
  --sysid_control_slave_non_bursting_master_requests mux, which is an e_mux
  sysid_control_slave_non_bursting_master_requests <= internal_CPU_System_clock_1_out_requests_sysid_control_slave;
  --sysid_control_slave_any_bursting_master_saved_grant mux, which is an e_mux
  sysid_control_slave_any_bursting_master_saved_grant <= std_logic'('0');
  --sysid_control_slave_arb_share_counter_next_value assignment, which is an e_assign
  sysid_control_slave_arb_share_counter_next_value <= Vector_To_Std_Logic(A_WE_StdLogicVector((std_logic'(sysid_control_slave_firsttransfer) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_control_slave_arb_share_set_values))) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(sysid_control_slave_arb_share_counter) = '1'), (((std_logic_vector'("00000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_control_slave_arb_share_counter))) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))));
  --sysid_control_slave_allgrants all slave grants, which is an e_mux
  sysid_control_slave_allgrants <= sysid_control_slave_grant_vector;
  --sysid_control_slave_end_xfer assignment, which is an e_assign
  sysid_control_slave_end_xfer <= NOT ((sysid_control_slave_waits_for_read OR sysid_control_slave_waits_for_write));
  --end_xfer_arb_share_counter_term_sysid_control_slave arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_sysid_control_slave <= sysid_control_slave_end_xfer AND (((NOT sysid_control_slave_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --sysid_control_slave_arb_share_counter arbitration counter enable, which is an e_assign
  sysid_control_slave_arb_counter_enable <= ((end_xfer_arb_share_counter_term_sysid_control_slave AND sysid_control_slave_allgrants)) OR ((end_xfer_arb_share_counter_term_sysid_control_slave AND NOT sysid_control_slave_non_bursting_master_requests));
  --sysid_control_slave_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_arb_share_counter <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_control_slave_arb_counter_enable) = '1' then 
        sysid_control_slave_arb_share_counter <= sysid_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --sysid_control_slave_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((sysid_control_slave_master_qreq_vector AND end_xfer_arb_share_counter_term_sysid_control_slave)) OR ((end_xfer_arb_share_counter_term_sysid_control_slave AND NOT sysid_control_slave_non_bursting_master_requests)))) = '1' then 
        sysid_control_slave_slavearbiterlockenable <= sysid_control_slave_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --CPU_System_clock_1/out sysid/control_slave arbiterlock, which is an e_assign
  CPU_System_clock_1_out_arbiterlock <= sysid_control_slave_slavearbiterlockenable AND CPU_System_clock_1_out_continuerequest;
  --sysid_control_slave_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  sysid_control_slave_slavearbiterlockenable2 <= sysid_control_slave_arb_share_counter_next_value;
  --CPU_System_clock_1/out sysid/control_slave arbiterlock2, which is an e_assign
  CPU_System_clock_1_out_arbiterlock2 <= sysid_control_slave_slavearbiterlockenable2 AND CPU_System_clock_1_out_continuerequest;
  --sysid_control_slave_any_continuerequest at least one master continues requesting, which is an e_assign
  sysid_control_slave_any_continuerequest <= std_logic'('1');
  --CPU_System_clock_1_out_continuerequest continued request, which is an e_assign
  CPU_System_clock_1_out_continuerequest <= std_logic'('1');
  internal_CPU_System_clock_1_out_qualified_request_sysid_control_slave <= internal_CPU_System_clock_1_out_requests_sysid_control_slave;
  --master is always granted when requested
  internal_CPU_System_clock_1_out_granted_sysid_control_slave <= internal_CPU_System_clock_1_out_qualified_request_sysid_control_slave;
  --CPU_System_clock_1/out saved-grant sysid/control_slave, which is an e_assign
  CPU_System_clock_1_out_saved_grant_sysid_control_slave <= internal_CPU_System_clock_1_out_requests_sysid_control_slave;
  --allow new arb cycle for sysid/control_slave, which is an e_assign
  sysid_control_slave_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  sysid_control_slave_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  sysid_control_slave_master_qreq_vector <= std_logic'('1');
  --sysid_control_slave_reset_n assignment, which is an e_assign
  sysid_control_slave_reset_n <= reset_n;
  --sysid_control_slave_firsttransfer first transaction, which is an e_assign
  sysid_control_slave_firsttransfer <= A_WE_StdLogic((std_logic'(sysid_control_slave_begins_xfer) = '1'), sysid_control_slave_unreg_firsttransfer, sysid_control_slave_reg_firsttransfer);
  --sysid_control_slave_unreg_firsttransfer first transaction, which is an e_assign
  sysid_control_slave_unreg_firsttransfer <= NOT ((sysid_control_slave_slavearbiterlockenable AND sysid_control_slave_any_continuerequest));
  --sysid_control_slave_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      sysid_control_slave_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(sysid_control_slave_begins_xfer) = '1' then 
        sysid_control_slave_reg_firsttransfer <= sysid_control_slave_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --sysid_control_slave_beginbursttransfer_internal begin burst transfer, which is an e_assign
  sysid_control_slave_beginbursttransfer_internal <= sysid_control_slave_begins_xfer;
  --sysid_control_slave_address mux, which is an e_mux
  sysid_control_slave_address <= CPU_System_clock_1_out_nativeaddress;
  --d1_sysid_control_slave_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_sysid_control_slave_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_sysid_control_slave_end_xfer <= sysid_control_slave_end_xfer;
    end if;

  end process;

  --sysid_control_slave_waits_for_read in a cycle, which is an e_mux
  sysid_control_slave_waits_for_read <= sysid_control_slave_in_a_read_cycle AND sysid_control_slave_begins_xfer;
  --sysid_control_slave_in_a_read_cycle assignment, which is an e_assign
  sysid_control_slave_in_a_read_cycle <= internal_CPU_System_clock_1_out_granted_sysid_control_slave AND CPU_System_clock_1_out_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= sysid_control_slave_in_a_read_cycle;
  --sysid_control_slave_waits_for_write in a cycle, which is an e_mux
  sysid_control_slave_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(sysid_control_slave_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --sysid_control_slave_in_a_write_cycle assignment, which is an e_assign
  sysid_control_slave_in_a_write_cycle <= internal_CPU_System_clock_1_out_granted_sysid_control_slave AND CPU_System_clock_1_out_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= sysid_control_slave_in_a_write_cycle;
  wait_for_sysid_control_slave_counter <= std_logic'('0');
  --vhdl renameroo for output signals
  CPU_System_clock_1_out_granted_sysid_control_slave <= internal_CPU_System_clock_1_out_granted_sysid_control_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_1_out_qualified_request_sysid_control_slave <= internal_CPU_System_clock_1_out_qualified_request_sysid_control_slave;
  --vhdl renameroo for output signals
  CPU_System_clock_1_out_requests_sysid_control_slave <= internal_CPU_System_clock_1_out_requests_sysid_control_slave;
--synthesis translate_off
    --sysid/control_slave enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity timer_system_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal timer_system_s1_irq : IN STD_LOGIC;
                 signal timer_system_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_0_data_master_granted_timer_system_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_timer_system_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_timer_system_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_timer_system_s1 : OUT STD_LOGIC;
                 signal d1_timer_system_s1_end_xfer : OUT STD_LOGIC;
                 signal timer_system_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal timer_system_s1_chipselect : OUT STD_LOGIC;
                 signal timer_system_s1_irq_from_sa : OUT STD_LOGIC;
                 signal timer_system_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal timer_system_s1_reset_n : OUT STD_LOGIC;
                 signal timer_system_s1_write_n : OUT STD_LOGIC;
                 signal timer_system_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity timer_system_s1_arbitrator;


architecture europa of timer_system_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_timer_system_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_timer_system_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_timer_system_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_timer_system_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_timer_system_s1 :  STD_LOGIC;
                signal shifted_address_to_timer_system_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal timer_system_s1_allgrants :  STD_LOGIC;
                signal timer_system_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal timer_system_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal timer_system_s1_any_continuerequest :  STD_LOGIC;
                signal timer_system_s1_arb_counter_enable :  STD_LOGIC;
                signal timer_system_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_system_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_system_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_system_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal timer_system_s1_begins_xfer :  STD_LOGIC;
                signal timer_system_s1_end_xfer :  STD_LOGIC;
                signal timer_system_s1_firsttransfer :  STD_LOGIC;
                signal timer_system_s1_grant_vector :  STD_LOGIC;
                signal timer_system_s1_in_a_read_cycle :  STD_LOGIC;
                signal timer_system_s1_in_a_write_cycle :  STD_LOGIC;
                signal timer_system_s1_master_qreq_vector :  STD_LOGIC;
                signal timer_system_s1_non_bursting_master_requests :  STD_LOGIC;
                signal timer_system_s1_reg_firsttransfer :  STD_LOGIC;
                signal timer_system_s1_slavearbiterlockenable :  STD_LOGIC;
                signal timer_system_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal timer_system_s1_unreg_firsttransfer :  STD_LOGIC;
                signal timer_system_s1_waits_for_read :  STD_LOGIC;
                signal timer_system_s1_waits_for_write :  STD_LOGIC;
                signal wait_for_timer_system_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT timer_system_s1_end_xfer;
    end if;

  end process;

  timer_system_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_timer_system_s1);
  --assign timer_system_s1_readdata_from_sa = timer_system_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  timer_system_s1_readdata_from_sa <= timer_system_s1_readdata;
  internal_cpu_0_data_master_requests_timer_system_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("100000001000000000000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --timer_system_s1_arb_share_counter set values, which is an e_mux
  timer_system_s1_arb_share_set_values <= std_logic_vector'("001");
  --timer_system_s1_non_bursting_master_requests mux, which is an e_mux
  timer_system_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_timer_system_s1;
  --timer_system_s1_any_bursting_master_saved_grant mux, which is an e_mux
  timer_system_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --timer_system_s1_arb_share_counter_next_value assignment, which is an e_assign
  timer_system_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(timer_system_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (timer_system_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(timer_system_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (timer_system_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --timer_system_s1_allgrants all slave grants, which is an e_mux
  timer_system_s1_allgrants <= timer_system_s1_grant_vector;
  --timer_system_s1_end_xfer assignment, which is an e_assign
  timer_system_s1_end_xfer <= NOT ((timer_system_s1_waits_for_read OR timer_system_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_timer_system_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_timer_system_s1 <= timer_system_s1_end_xfer AND (((NOT timer_system_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --timer_system_s1_arb_share_counter arbitration counter enable, which is an e_assign
  timer_system_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_timer_system_s1 AND timer_system_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_timer_system_s1 AND NOT timer_system_s1_non_bursting_master_requests));
  --timer_system_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_system_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(timer_system_s1_arb_counter_enable) = '1' then 
        timer_system_s1_arb_share_counter <= timer_system_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --timer_system_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_system_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((timer_system_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_timer_system_s1)) OR ((end_xfer_arb_share_counter_term_timer_system_s1 AND NOT timer_system_s1_non_bursting_master_requests)))) = '1' then 
        timer_system_s1_slavearbiterlockenable <= or_reduce(timer_system_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master timer_system/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= timer_system_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --timer_system_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  timer_system_s1_slavearbiterlockenable2 <= or_reduce(timer_system_s1_arb_share_counter_next_value);
  --cpu_0/data_master timer_system/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= timer_system_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --timer_system_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  timer_system_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_timer_system_s1 <= internal_cpu_0_data_master_requests_timer_system_s1 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --timer_system_s1_writedata mux, which is an e_mux
  timer_system_s1_writedata <= cpu_0_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_0_data_master_granted_timer_system_s1 <= internal_cpu_0_data_master_qualified_request_timer_system_s1;
  --cpu_0/data_master saved-grant timer_system/s1, which is an e_assign
  cpu_0_data_master_saved_grant_timer_system_s1 <= internal_cpu_0_data_master_requests_timer_system_s1;
  --allow new arb cycle for timer_system/s1, which is an e_assign
  timer_system_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  timer_system_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  timer_system_s1_master_qreq_vector <= std_logic'('1');
  --timer_system_s1_reset_n assignment, which is an e_assign
  timer_system_s1_reset_n <= reset_n;
  timer_system_s1_chipselect <= internal_cpu_0_data_master_granted_timer_system_s1;
  --timer_system_s1_firsttransfer first transaction, which is an e_assign
  timer_system_s1_firsttransfer <= A_WE_StdLogic((std_logic'(timer_system_s1_begins_xfer) = '1'), timer_system_s1_unreg_firsttransfer, timer_system_s1_reg_firsttransfer);
  --timer_system_s1_unreg_firsttransfer first transaction, which is an e_assign
  timer_system_s1_unreg_firsttransfer <= NOT ((timer_system_s1_slavearbiterlockenable AND timer_system_s1_any_continuerequest));
  --timer_system_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_system_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(timer_system_s1_begins_xfer) = '1' then 
        timer_system_s1_reg_firsttransfer <= timer_system_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --timer_system_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  timer_system_s1_beginbursttransfer_internal <= timer_system_s1_begins_xfer;
  --~timer_system_s1_write_n assignment, which is an e_mux
  timer_system_s1_write_n <= NOT ((internal_cpu_0_data_master_granted_timer_system_s1 AND cpu_0_data_master_write));
  shifted_address_to_timer_system_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --timer_system_s1_address mux, which is an e_mux
  timer_system_s1_address <= A_EXT (A_SRL(shifted_address_to_timer_system_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_timer_system_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_timer_system_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_timer_system_s1_end_xfer <= timer_system_s1_end_xfer;
    end if;

  end process;

  --timer_system_s1_waits_for_read in a cycle, which is an e_mux
  timer_system_s1_waits_for_read <= timer_system_s1_in_a_read_cycle AND timer_system_s1_begins_xfer;
  --timer_system_s1_in_a_read_cycle assignment, which is an e_assign
  timer_system_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_timer_system_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= timer_system_s1_in_a_read_cycle;
  --timer_system_s1_waits_for_write in a cycle, which is an e_mux
  timer_system_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(timer_system_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --timer_system_s1_in_a_write_cycle assignment, which is an e_assign
  timer_system_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_timer_system_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= timer_system_s1_in_a_write_cycle;
  wait_for_timer_system_s1_counter <= std_logic'('0');
  --assign timer_system_s1_irq_from_sa = timer_system_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  timer_system_s1_irq_from_sa <= timer_system_s1_irq;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_timer_system_s1 <= internal_cpu_0_data_master_granted_timer_system_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_timer_system_s1 <= internal_cpu_0_data_master_qualified_request_timer_system_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_timer_system_s1 <= internal_cpu_0_data_master_requests_timer_system_s1;
--synthesis translate_off
    --timer_system/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity timer_timestamp_s1_arbitrator is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                 signal cpu_0_data_master_read : IN STD_LOGIC;
                 signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                 signal cpu_0_data_master_write : IN STD_LOGIC;
                 signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                 signal reset_n : IN STD_LOGIC;
                 signal timer_timestamp_s1_irq : IN STD_LOGIC;
                 signal timer_timestamp_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

              -- outputs:
                 signal cpu_0_data_master_granted_timer_timestamp_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_qualified_request_timer_timestamp_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_read_data_valid_timer_timestamp_s1 : OUT STD_LOGIC;
                 signal cpu_0_data_master_requests_timer_timestamp_s1 : OUT STD_LOGIC;
                 signal d1_timer_timestamp_s1_end_xfer : OUT STD_LOGIC;
                 signal timer_timestamp_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                 signal timer_timestamp_s1_chipselect : OUT STD_LOGIC;
                 signal timer_timestamp_s1_irq_from_sa : OUT STD_LOGIC;
                 signal timer_timestamp_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal timer_timestamp_s1_reset_n : OUT STD_LOGIC;
                 signal timer_timestamp_s1_write_n : OUT STD_LOGIC;
                 signal timer_timestamp_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
              );
end entity timer_timestamp_s1_arbitrator;


architecture europa of timer_timestamp_s1_arbitrator is
                signal cpu_0_data_master_arbiterlock :  STD_LOGIC;
                signal cpu_0_data_master_arbiterlock2 :  STD_LOGIC;
                signal cpu_0_data_master_continuerequest :  STD_LOGIC;
                signal cpu_0_data_master_saved_grant_timer_timestamp_s1 :  STD_LOGIC;
                signal d1_reasons_to_wait :  STD_LOGIC;
                signal enable_nonzero_assertions :  STD_LOGIC;
                signal end_xfer_arb_share_counter_term_timer_timestamp_s1 :  STD_LOGIC;
                signal in_a_read_cycle :  STD_LOGIC;
                signal in_a_write_cycle :  STD_LOGIC;
                signal internal_cpu_0_data_master_granted_timer_timestamp_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_qualified_request_timer_timestamp_s1 :  STD_LOGIC;
                signal internal_cpu_0_data_master_requests_timer_timestamp_s1 :  STD_LOGIC;
                signal shifted_address_to_timer_timestamp_s1_from_cpu_0_data_master :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal timer_timestamp_s1_allgrants :  STD_LOGIC;
                signal timer_timestamp_s1_allow_new_arb_cycle :  STD_LOGIC;
                signal timer_timestamp_s1_any_bursting_master_saved_grant :  STD_LOGIC;
                signal timer_timestamp_s1_any_continuerequest :  STD_LOGIC;
                signal timer_timestamp_s1_arb_counter_enable :  STD_LOGIC;
                signal timer_timestamp_s1_arb_share_counter :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_timestamp_s1_arb_share_counter_next_value :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_timestamp_s1_arb_share_set_values :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_timestamp_s1_beginbursttransfer_internal :  STD_LOGIC;
                signal timer_timestamp_s1_begins_xfer :  STD_LOGIC;
                signal timer_timestamp_s1_end_xfer :  STD_LOGIC;
                signal timer_timestamp_s1_firsttransfer :  STD_LOGIC;
                signal timer_timestamp_s1_grant_vector :  STD_LOGIC;
                signal timer_timestamp_s1_in_a_read_cycle :  STD_LOGIC;
                signal timer_timestamp_s1_in_a_write_cycle :  STD_LOGIC;
                signal timer_timestamp_s1_master_qreq_vector :  STD_LOGIC;
                signal timer_timestamp_s1_non_bursting_master_requests :  STD_LOGIC;
                signal timer_timestamp_s1_reg_firsttransfer :  STD_LOGIC;
                signal timer_timestamp_s1_slavearbiterlockenable :  STD_LOGIC;
                signal timer_timestamp_s1_slavearbiterlockenable2 :  STD_LOGIC;
                signal timer_timestamp_s1_unreg_firsttransfer :  STD_LOGIC;
                signal timer_timestamp_s1_waits_for_read :  STD_LOGIC;
                signal timer_timestamp_s1_waits_for_write :  STD_LOGIC;
                signal wait_for_timer_timestamp_s1_counter :  STD_LOGIC;

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_reasons_to_wait <= std_logic'('0');
    elsif clk'event and clk = '1' then
      d1_reasons_to_wait <= NOT timer_timestamp_s1_end_xfer;
    end if;

  end process;

  timer_timestamp_s1_begins_xfer <= NOT d1_reasons_to_wait AND (internal_cpu_0_data_master_qualified_request_timer_timestamp_s1);
  --assign timer_timestamp_s1_readdata_from_sa = timer_timestamp_s1_readdata so that symbol knows where to group signals which may go to master only, which is an e_assign
  timer_timestamp_s1_readdata_from_sa <= timer_timestamp_s1_readdata;
  internal_cpu_0_data_master_requests_timer_timestamp_s1 <= to_std_logic(((Std_Logic_Vector'(cpu_0_data_master_address_to_slave(20 DOWNTO 5) & std_logic_vector'("00000")) = std_logic_vector'("100000001000000100000")))) AND ((cpu_0_data_master_read OR cpu_0_data_master_write));
  --timer_timestamp_s1_arb_share_counter set values, which is an e_mux
  timer_timestamp_s1_arb_share_set_values <= std_logic_vector'("001");
  --timer_timestamp_s1_non_bursting_master_requests mux, which is an e_mux
  timer_timestamp_s1_non_bursting_master_requests <= internal_cpu_0_data_master_requests_timer_timestamp_s1;
  --timer_timestamp_s1_any_bursting_master_saved_grant mux, which is an e_mux
  timer_timestamp_s1_any_bursting_master_saved_grant <= std_logic'('0');
  --timer_timestamp_s1_arb_share_counter_next_value assignment, which is an e_assign
  timer_timestamp_s1_arb_share_counter_next_value <= A_EXT (A_WE_StdLogicVector((std_logic'(timer_timestamp_s1_firsttransfer) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (timer_timestamp_s1_arb_share_set_values)) - std_logic_vector'("000000000000000000000000000000001"))), A_WE_StdLogicVector((std_logic'(or_reduce(timer_timestamp_s1_arb_share_counter)) = '1'), (((std_logic_vector'("000000000000000000000000000000") & (timer_timestamp_s1_arb_share_counter)) - std_logic_vector'("000000000000000000000000000000001"))), std_logic_vector'("000000000000000000000000000000000"))), 3);
  --timer_timestamp_s1_allgrants all slave grants, which is an e_mux
  timer_timestamp_s1_allgrants <= timer_timestamp_s1_grant_vector;
  --timer_timestamp_s1_end_xfer assignment, which is an e_assign
  timer_timestamp_s1_end_xfer <= NOT ((timer_timestamp_s1_waits_for_read OR timer_timestamp_s1_waits_for_write));
  --end_xfer_arb_share_counter_term_timer_timestamp_s1 arb share counter enable term, which is an e_assign
  end_xfer_arb_share_counter_term_timer_timestamp_s1 <= timer_timestamp_s1_end_xfer AND (((NOT timer_timestamp_s1_any_bursting_master_saved_grant OR in_a_read_cycle) OR in_a_write_cycle));
  --timer_timestamp_s1_arb_share_counter arbitration counter enable, which is an e_assign
  timer_timestamp_s1_arb_counter_enable <= ((end_xfer_arb_share_counter_term_timer_timestamp_s1 AND timer_timestamp_s1_allgrants)) OR ((end_xfer_arb_share_counter_term_timer_timestamp_s1 AND NOT timer_timestamp_s1_non_bursting_master_requests));
  --timer_timestamp_s1_arb_share_counter counter, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_timestamp_s1_arb_share_counter <= std_logic_vector'("000");
    elsif clk'event and clk = '1' then
      if std_logic'(timer_timestamp_s1_arb_counter_enable) = '1' then 
        timer_timestamp_s1_arb_share_counter <= timer_timestamp_s1_arb_share_counter_next_value;
      end if;
    end if;

  end process;

  --timer_timestamp_s1_slavearbiterlockenable slave enables arbiterlock, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_timestamp_s1_slavearbiterlockenable <= std_logic'('0');
    elsif clk'event and clk = '1' then
      if std_logic'((((timer_timestamp_s1_master_qreq_vector AND end_xfer_arb_share_counter_term_timer_timestamp_s1)) OR ((end_xfer_arb_share_counter_term_timer_timestamp_s1 AND NOT timer_timestamp_s1_non_bursting_master_requests)))) = '1' then 
        timer_timestamp_s1_slavearbiterlockenable <= or_reduce(timer_timestamp_s1_arb_share_counter_next_value);
      end if;
    end if;

  end process;

  --cpu_0/data_master timer_timestamp/s1 arbiterlock, which is an e_assign
  cpu_0_data_master_arbiterlock <= timer_timestamp_s1_slavearbiterlockenable AND cpu_0_data_master_continuerequest;
  --timer_timestamp_s1_slavearbiterlockenable2 slave enables arbiterlock2, which is an e_assign
  timer_timestamp_s1_slavearbiterlockenable2 <= or_reduce(timer_timestamp_s1_arb_share_counter_next_value);
  --cpu_0/data_master timer_timestamp/s1 arbiterlock2, which is an e_assign
  cpu_0_data_master_arbiterlock2 <= timer_timestamp_s1_slavearbiterlockenable2 AND cpu_0_data_master_continuerequest;
  --timer_timestamp_s1_any_continuerequest at least one master continues requesting, which is an e_assign
  timer_timestamp_s1_any_continuerequest <= std_logic'('1');
  --cpu_0_data_master_continuerequest continued request, which is an e_assign
  cpu_0_data_master_continuerequest <= std_logic'('1');
  internal_cpu_0_data_master_qualified_request_timer_timestamp_s1 <= internal_cpu_0_data_master_requests_timer_timestamp_s1 AND NOT (((NOT cpu_0_data_master_waitrequest) AND cpu_0_data_master_write));
  --timer_timestamp_s1_writedata mux, which is an e_mux
  timer_timestamp_s1_writedata <= cpu_0_data_master_writedata (15 DOWNTO 0);
  --master is always granted when requested
  internal_cpu_0_data_master_granted_timer_timestamp_s1 <= internal_cpu_0_data_master_qualified_request_timer_timestamp_s1;
  --cpu_0/data_master saved-grant timer_timestamp/s1, which is an e_assign
  cpu_0_data_master_saved_grant_timer_timestamp_s1 <= internal_cpu_0_data_master_requests_timer_timestamp_s1;
  --allow new arb cycle for timer_timestamp/s1, which is an e_assign
  timer_timestamp_s1_allow_new_arb_cycle <= std_logic'('1');
  --placeholder chosen master
  timer_timestamp_s1_grant_vector <= std_logic'('1');
  --placeholder vector of master qualified-requests
  timer_timestamp_s1_master_qreq_vector <= std_logic'('1');
  --timer_timestamp_s1_reset_n assignment, which is an e_assign
  timer_timestamp_s1_reset_n <= reset_n;
  timer_timestamp_s1_chipselect <= internal_cpu_0_data_master_granted_timer_timestamp_s1;
  --timer_timestamp_s1_firsttransfer first transaction, which is an e_assign
  timer_timestamp_s1_firsttransfer <= A_WE_StdLogic((std_logic'(timer_timestamp_s1_begins_xfer) = '1'), timer_timestamp_s1_unreg_firsttransfer, timer_timestamp_s1_reg_firsttransfer);
  --timer_timestamp_s1_unreg_firsttransfer first transaction, which is an e_assign
  timer_timestamp_s1_unreg_firsttransfer <= NOT ((timer_timestamp_s1_slavearbiterlockenable AND timer_timestamp_s1_any_continuerequest));
  --timer_timestamp_s1_reg_firsttransfer first transaction, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      timer_timestamp_s1_reg_firsttransfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      if std_logic'(timer_timestamp_s1_begins_xfer) = '1' then 
        timer_timestamp_s1_reg_firsttransfer <= timer_timestamp_s1_unreg_firsttransfer;
      end if;
    end if;

  end process;

  --timer_timestamp_s1_beginbursttransfer_internal begin burst transfer, which is an e_assign
  timer_timestamp_s1_beginbursttransfer_internal <= timer_timestamp_s1_begins_xfer;
  --~timer_timestamp_s1_write_n assignment, which is an e_mux
  timer_timestamp_s1_write_n <= NOT ((internal_cpu_0_data_master_granted_timer_timestamp_s1 AND cpu_0_data_master_write));
  shifted_address_to_timer_timestamp_s1_from_cpu_0_data_master <= cpu_0_data_master_address_to_slave;
  --timer_timestamp_s1_address mux, which is an e_mux
  timer_timestamp_s1_address <= A_EXT (A_SRL(shifted_address_to_timer_timestamp_s1_from_cpu_0_data_master,std_logic_vector'("00000000000000000000000000000010")), 3);
  --d1_timer_timestamp_s1_end_xfer register, which is an e_register
  process (clk, reset_n)
  begin
    if reset_n = '0' then
      d1_timer_timestamp_s1_end_xfer <= std_logic'('1');
    elsif clk'event and clk = '1' then
      d1_timer_timestamp_s1_end_xfer <= timer_timestamp_s1_end_xfer;
    end if;

  end process;

  --timer_timestamp_s1_waits_for_read in a cycle, which is an e_mux
  timer_timestamp_s1_waits_for_read <= timer_timestamp_s1_in_a_read_cycle AND timer_timestamp_s1_begins_xfer;
  --timer_timestamp_s1_in_a_read_cycle assignment, which is an e_assign
  timer_timestamp_s1_in_a_read_cycle <= internal_cpu_0_data_master_granted_timer_timestamp_s1 AND cpu_0_data_master_read;
  --in_a_read_cycle assignment, which is an e_mux
  in_a_read_cycle <= timer_timestamp_s1_in_a_read_cycle;
  --timer_timestamp_s1_waits_for_write in a cycle, which is an e_mux
  timer_timestamp_s1_waits_for_write <= Vector_To_Std_Logic(((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(timer_timestamp_s1_in_a_write_cycle))) AND std_logic_vector'("00000000000000000000000000000000")));
  --timer_timestamp_s1_in_a_write_cycle assignment, which is an e_assign
  timer_timestamp_s1_in_a_write_cycle <= internal_cpu_0_data_master_granted_timer_timestamp_s1 AND cpu_0_data_master_write;
  --in_a_write_cycle assignment, which is an e_mux
  in_a_write_cycle <= timer_timestamp_s1_in_a_write_cycle;
  wait_for_timer_timestamp_s1_counter <= std_logic'('0');
  --assign timer_timestamp_s1_irq_from_sa = timer_timestamp_s1_irq so that symbol knows where to group signals which may go to master only, which is an e_assign
  timer_timestamp_s1_irq_from_sa <= timer_timestamp_s1_irq;
  --vhdl renameroo for output signals
  cpu_0_data_master_granted_timer_timestamp_s1 <= internal_cpu_0_data_master_granted_timer_timestamp_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_qualified_request_timer_timestamp_s1 <= internal_cpu_0_data_master_qualified_request_timer_timestamp_s1;
  --vhdl renameroo for output signals
  cpu_0_data_master_requests_timer_timestamp_s1 <= internal_cpu_0_data_master_requests_timer_timestamp_s1;
--synthesis translate_off
    --timer_timestamp/s1 enable non-zero assertions, which is an e_register
    process (clk, reset_n)
    begin
      if reset_n = '0' then
        enable_nonzero_assertions <= std_logic'('0');
      elsif clk'event and clk = '1' then
        enable_nonzero_assertions <= std_logic'('1');
      end if;

    end process;

--synthesis translate_on

end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC
              );
end entity CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module;


architecture europa of CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module is
                signal data_in_d1 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "{-from ""*""} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_in_d1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_in_d1 <= data_in;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_out <= data_in_d1;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU_System_reset_clk_0_domain_synch_module is 
        port (
              -- inputs:
                 signal clk : IN STD_LOGIC;
                 signal data_in : IN STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- outputs:
                 signal data_out : OUT STD_LOGIC
              );
end entity CPU_System_reset_clk_0_domain_synch_module;


architecture europa of CPU_System_reset_clk_0_domain_synch_module is
                signal data_in_d1 :  STD_LOGIC;
attribute ALTERA_ATTRIBUTE : string;
attribute ALTERA_ATTRIBUTE of data_in_d1 : signal is "{-from ""*""} CUT=ON ; PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";
attribute ALTERA_ATTRIBUTE of data_out : signal is "PRESERVE_REGISTER=ON ; SUPPRESS_DA_RULE_INTERNAL=R101";

begin

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_in_d1 <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_in_d1 <= data_in;
    end if;

  end process;

  process (clk, reset_n)
  begin
    if reset_n = '0' then
      data_out <= std_logic'('0');
    elsif clk'event and clk = '1' then
      data_out <= data_in_d1;
    end if;

  end process;


end europa;



-- turn off superfluous VHDL processor warnings 
-- altera message_level Level1 
-- altera message_off 10034 10035 10036 10037 10230 10240 10030 

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity CPU_System is 
        port (
              -- 1) global signals:
                 signal clk_0 : IN STD_LOGIC;
                 signal clocks_0_sys_clk_out : OUT STD_LOGIC;
                 signal reset_n : IN STD_LOGIC;

              -- the_lcd_0
                 signal LCD_E_from_the_lcd_0 : OUT STD_LOGIC;
                 signal LCD_RS_from_the_lcd_0 : OUT STD_LOGIC;
                 signal LCD_RW_from_the_lcd_0 : OUT STD_LOGIC;
                 signal LCD_data_to_and_from_the_lcd_0 : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_pio_input_0
                 signal in_port_to_the_pio_input_0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_pio_output_0
                 signal out_port_from_the_pio_output_0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_pio_output_1
                 signal out_port_from_the_pio_output_1 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

              -- the_sram_0
                 signal SRAM_ADDR_from_the_sram_0 : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                 signal SRAM_CE_N_from_the_sram_0 : OUT STD_LOGIC;
                 signal SRAM_DQ_to_and_from_the_sram_0 : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                 signal SRAM_LB_N_from_the_sram_0 : OUT STD_LOGIC;
                 signal SRAM_OE_N_from_the_sram_0 : OUT STD_LOGIC;
                 signal SRAM_UB_N_from_the_sram_0 : OUT STD_LOGIC;
                 signal SRAM_WE_N_from_the_sram_0 : OUT STD_LOGIC
              );
end entity CPU_System;


architecture europa of CPU_System is
component CPU_System_clock_0_in_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_0_in_endofpacket : IN STD_LOGIC;
                    signal CPU_System_clock_0_in_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal CPU_System_clock_0_in_waitrequest : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_data_master_dbs_write_8 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal cpu_0_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal CPU_System_clock_0_in_address : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_endofpacket_from_sa : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_nativeaddress : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_read : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal CPU_System_clock_0_in_reset_n : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_waitrequest_from_sa : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_write : OUT STD_LOGIC;
                    signal CPU_System_clock_0_in_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal cpu_0_data_master_byteenable_CPU_System_clock_0_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_granted_CPU_System_clock_0_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_CPU_System_clock_0_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_CPU_System_clock_0_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_CPU_System_clock_0_in : OUT STD_LOGIC;
                    signal d1_CPU_System_clock_0_in_end_xfer : OUT STD_LOGIC
                 );
end component CPU_System_clock_0_in_arbitrator;

component CPU_System_clock_0_out_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_0_out_address : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_read : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_write : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal clocks_0_avalon_clocks_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal d1_clocks_0_avalon_clocks_slave_end_xfer : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal CPU_System_clock_0_out_address_to_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_0_out_readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal CPU_System_clock_0_out_reset_n : OUT STD_LOGIC;
                    signal CPU_System_clock_0_out_waitrequest : OUT STD_LOGIC
                 );
end component CPU_System_clock_0_out_arbitrator;

component CPU_System_clock_0 is 
           port (
                 -- inputs:
                    signal master_clk : IN STD_LOGIC;
                    signal master_endofpacket : IN STD_LOGIC;
                    signal master_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal master_reset_n : IN STD_LOGIC;
                    signal master_waitrequest : IN STD_LOGIC;
                    signal slave_address : IN STD_LOGIC;
                    signal slave_clk : IN STD_LOGIC;
                    signal slave_nativeaddress : IN STD_LOGIC;
                    signal slave_read : IN STD_LOGIC;
                    signal slave_reset_n : IN STD_LOGIC;
                    signal slave_write : IN STD_LOGIC;
                    signal slave_writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- outputs:
                    signal master_address : OUT STD_LOGIC;
                    signal master_nativeaddress : OUT STD_LOGIC;
                    signal master_read : OUT STD_LOGIC;
                    signal master_write : OUT STD_LOGIC;
                    signal master_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal slave_endofpacket : OUT STD_LOGIC;
                    signal slave_readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal slave_waitrequest : OUT STD_LOGIC
                 );
end component CPU_System_clock_0;

component CPU_System_clock_1_in_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_1_in_endofpacket : IN STD_LOGIC;
                    signal CPU_System_clock_1_in_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal CPU_System_clock_1_in_waitrequest : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal CPU_System_clock_1_in_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal CPU_System_clock_1_in_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal CPU_System_clock_1_in_endofpacket_from_sa : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_nativeaddress : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_read : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal CPU_System_clock_1_in_reset_n : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_waitrequest_from_sa : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_write : OUT STD_LOGIC;
                    signal CPU_System_clock_1_in_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_granted_CPU_System_clock_1_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_CPU_System_clock_1_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_CPU_System_clock_1_in : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_CPU_System_clock_1_in : OUT STD_LOGIC;
                    signal d1_CPU_System_clock_1_in_end_xfer : OUT STD_LOGIC
                 );
end component CPU_System_clock_1_in_arbitrator;

component CPU_System_clock_1_out_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_1_out_address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal CPU_System_clock_1_out_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal CPU_System_clock_1_out_granted_sysid_control_slave : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_qualified_request_sysid_control_slave : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_read : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_read_data_valid_sysid_control_slave : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_requests_sysid_control_slave : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_write : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal d1_sysid_control_slave_end_xfer : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sysid_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal CPU_System_clock_1_out_address_to_slave : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal CPU_System_clock_1_out_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal CPU_System_clock_1_out_reset_n : OUT STD_LOGIC;
                    signal CPU_System_clock_1_out_waitrequest : OUT STD_LOGIC
                 );
end component CPU_System_clock_1_out_arbitrator;

component CPU_System_clock_1 is 
           port (
                 -- inputs:
                    signal master_clk : IN STD_LOGIC;
                    signal master_endofpacket : IN STD_LOGIC;
                    signal master_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal master_reset_n : IN STD_LOGIC;
                    signal master_waitrequest : IN STD_LOGIC;
                    signal slave_address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal slave_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal slave_clk : IN STD_LOGIC;
                    signal slave_nativeaddress : IN STD_LOGIC;
                    signal slave_read : IN STD_LOGIC;
                    signal slave_reset_n : IN STD_LOGIC;
                    signal slave_write : IN STD_LOGIC;
                    signal slave_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal master_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal master_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal master_nativeaddress : OUT STD_LOGIC;
                    signal master_read : OUT STD_LOGIC;
                    signal master_write : OUT STD_LOGIC;
                    signal master_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal slave_endofpacket : OUT STD_LOGIC;
                    signal slave_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal slave_waitrequest : OUT STD_LOGIC
                 );
end component CPU_System_clock_1;

component clocks_0_avalon_clocks_slave_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_0_out_address_to_slave : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_read : IN STD_LOGIC;
                    signal CPU_System_clock_0_out_write : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal clocks_0_avalon_clocks_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave : OUT STD_LOGIC;
                    signal clocks_0_avalon_clocks_slave_address : OUT STD_LOGIC;
                    signal clocks_0_avalon_clocks_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal d1_clocks_0_avalon_clocks_slave_end_xfer : OUT STD_LOGIC
                 );
end component clocks_0_avalon_clocks_slave_arbitrator;

component clocks_0 is 
           port (
                 -- inputs:
                    signal CLOCK_50 : IN STD_LOGIC;
                    signal address : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal sys_clk : OUT STD_LOGIC
                 );
end component clocks_0;

component cpu_0_jtag_debug_module_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_debugaccess : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_resetrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_address : OUT STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_begintransfer : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_chipselect : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_debugaccess : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_reset_n : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_resetrequest_from_sa : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_write : OUT STD_LOGIC;
                    signal cpu_0_jtag_debug_module_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_0_jtag_debug_module_end_xfer : OUT STD_LOGIC
                 );
end component cpu_0_jtag_debug_module_arbitrator;

component cpu_0_data_master_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_0_in_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal CPU_System_clock_0_in_waitrequest_from_sa : IN STD_LOGIC;
                    signal CPU_System_clock_1_in_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal CPU_System_clock_1_in_waitrequest_from_sa : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable_CPU_System_clock_0_in : IN STD_LOGIC;
                    signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_data_master_granted_CPU_System_clock_0_in : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_CPU_System_clock_1_in : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_lcd_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_pio_input_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_pio_output_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_pio_output_1_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_timer_system_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_granted_timer_timestamp_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_CPU_System_clock_0_in : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_CPU_System_clock_1_in : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_lcd_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_input_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_output_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_output_1_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_timer_system_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_timer_timestamp_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_CPU_System_clock_0_in : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_CPU_System_clock_1_in : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_lcd_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_input_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_output_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_output_1_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_timer_system_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_timer_timestamp_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_CPU_System_clock_0_in : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_CPU_System_clock_1_in : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_lcd_0_control_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_input_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_output_0_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_output_1_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_timer_system_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_requests_timer_timestamp_s1 : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_CPU_System_clock_0_in_end_xfer : IN STD_LOGIC;
                    signal d1_CPU_System_clock_1_in_end_xfer : IN STD_LOGIC;
                    signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : IN STD_LOGIC;
                    signal d1_lcd_0_control_slave_end_xfer : IN STD_LOGIC;
                    signal d1_pio_input_0_s1_end_xfer : IN STD_LOGIC;
                    signal d1_pio_output_0_s1_end_xfer : IN STD_LOGIC;
                    signal d1_pio_output_1_s1_end_xfer : IN STD_LOGIC;
                    signal d1_sram_0_avalon_sram_slave_end_xfer : IN STD_LOGIC;
                    signal d1_timer_system_s1_end_xfer : IN STD_LOGIC;
                    signal d1_timer_timestamp_s1_end_xfer : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : IN STD_LOGIC;
                    signal lcd_0_control_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal lcd_0_control_slave_wait_counter_eq_0 : IN STD_LOGIC;
                    signal lcd_0_control_slave_wait_counter_eq_1 : IN STD_LOGIC;
                    signal pio_input_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_0_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_1_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal sram_0_avalon_sram_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal timer_system_s1_irq_from_sa : IN STD_LOGIC;
                    signal timer_system_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal timer_timestamp_s1_irq_from_sa : IN STD_LOGIC;
                    signal timer_timestamp_s1_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_data_master_address_to_slave : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_data_master_dbs_write_16 : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal cpu_0_data_master_dbs_write_8 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal cpu_0_data_master_irq : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_no_byte_enables_and_last_term : OUT STD_LOGIC;
                    signal cpu_0_data_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_data_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_0_data_master_arbitrator;

component cpu_0_instruction_master_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_instruction_master_address : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_granted_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : IN STD_LOGIC;
                    signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module : IN STD_LOGIC;
                    signal cpu_0_instruction_master_requests_sram_0_avalon_sram_slave : IN STD_LOGIC;
                    signal cpu_0_jtag_debug_module_readdata_from_sa : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d1_cpu_0_jtag_debug_module_end_xfer : IN STD_LOGIC;
                    signal d1_sram_0_avalon_sram_slave_end_xfer : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sram_0_avalon_sram_slave_readdata_from_sa : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_instruction_master_address_to_slave : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_instruction_master_dbs_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_instruction_master_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal cpu_0_instruction_master_waitrequest : OUT STD_LOGIC
                 );
end component cpu_0_instruction_master_arbitrator;

component cpu_0 is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal d_irq : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal d_waitrequest : IN STD_LOGIC;
                    signal i_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_waitrequest : IN STD_LOGIC;
                    signal jtag_debug_module_address : IN STD_LOGIC_VECTOR (8 DOWNTO 0);
                    signal jtag_debug_module_begintransfer : IN STD_LOGIC;
                    signal jtag_debug_module_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal jtag_debug_module_debugaccess : IN STD_LOGIC;
                    signal jtag_debug_module_select : IN STD_LOGIC;
                    signal jtag_debug_module_write : IN STD_LOGIC;
                    signal jtag_debug_module_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal d_address : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal d_byteenable : OUT STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal d_read : OUT STD_LOGIC;
                    signal d_write : OUT STD_LOGIC;
                    signal d_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal i_address : OUT STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal i_read : OUT STD_LOGIC;
                    signal jtag_debug_module_debugaccess_to_roms : OUT STD_LOGIC;
                    signal jtag_debug_module_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_debug_module_resetrequest : OUT STD_LOGIC
                 );
end component cpu_0;

component jtag_uart_0_avalon_jtag_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_dataavailable : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_readyfordata : IN STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave : OUT STD_LOGIC;
                    signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_address : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_chipselect : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_irq_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_read_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_reset_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_write_n : OUT STD_LOGIC;
                    signal jtag_uart_0_avalon_jtag_slave_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component jtag_uart_0_avalon_jtag_slave_arbitrator;

component jtag_uart_0 is 
           port (
                 -- inputs:
                    signal av_address : IN STD_LOGIC;
                    signal av_chipselect : IN STD_LOGIC;
                    signal av_read_n : IN STD_LOGIC;
                    signal av_write_n : IN STD_LOGIC;
                    signal av_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal rst_n : IN STD_LOGIC;

                 -- outputs:
                    signal av_irq : OUT STD_LOGIC;
                    signal av_readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal av_waitrequest : OUT STD_LOGIC;
                    signal dataavailable : OUT STD_LOGIC;
                    signal readyfordata : OUT STD_LOGIC
                 );
end component jtag_uart_0;

component lcd_0_control_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal lcd_0_control_slave_readdata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_lcd_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_lcd_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_lcd_0_control_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_lcd_0_control_slave : OUT STD_LOGIC;
                    signal d1_lcd_0_control_slave_end_xfer : OUT STD_LOGIC;
                    signal lcd_0_control_slave_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal lcd_0_control_slave_begintransfer : OUT STD_LOGIC;
                    signal lcd_0_control_slave_read : OUT STD_LOGIC;
                    signal lcd_0_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal lcd_0_control_slave_reset_n : OUT STD_LOGIC;
                    signal lcd_0_control_slave_wait_counter_eq_0 : OUT STD_LOGIC;
                    signal lcd_0_control_slave_wait_counter_eq_1 : OUT STD_LOGIC;
                    signal lcd_0_control_slave_write : OUT STD_LOGIC;
                    signal lcd_0_control_slave_writedata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component lcd_0_control_slave_arbitrator;

component lcd_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal begintransfer : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- outputs:
                    signal LCD_E : OUT STD_LOGIC;
                    signal LCD_RS : OUT STD_LOGIC;
                    signal LCD_RW : OUT STD_LOGIC;
                    signal LCD_data : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
                 );
end component lcd_0;

component pio_input_0_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal pio_input_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_pio_input_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_input_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_input_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_input_0_s1 : OUT STD_LOGIC;
                    signal d1_pio_input_0_s1_end_xfer : OUT STD_LOGIC;
                    signal pio_input_0_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal pio_input_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_input_0_s1_reset_n : OUT STD_LOGIC
                 );
end component pio_input_0_s1_arbitrator;

component pio_input_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal in_port : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component pio_input_0;

component pio_output_0_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_0_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_pio_output_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_output_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_output_0_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_output_0_s1 : OUT STD_LOGIC;
                    signal d1_pio_output_0_s1_end_xfer : OUT STD_LOGIC;
                    signal pio_output_0_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal pio_output_0_s1_chipselect : OUT STD_LOGIC;
                    signal pio_output_0_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_0_s1_reset_n : OUT STD_LOGIC;
                    signal pio_output_0_s1_write_n : OUT STD_LOGIC;
                    signal pio_output_0_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component pio_output_0_s1_arbitrator;

component pio_output_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal out_port : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component pio_output_0;

component pio_output_1_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_1_s1_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_granted_pio_output_1_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_pio_output_1_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_pio_output_1_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_pio_output_1_s1 : OUT STD_LOGIC;
                    signal d1_pio_output_1_s1_end_xfer : OUT STD_LOGIC;
                    signal pio_output_1_s1_address : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal pio_output_1_s1_chipselect : OUT STD_LOGIC;
                    signal pio_output_1_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal pio_output_1_s1_reset_n : OUT STD_LOGIC;
                    signal pio_output_1_s1_write_n : OUT STD_LOGIC;
                    signal pio_output_1_s1_writedata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component pio_output_1_s1_arbitrator;

component pio_output_1 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal out_port : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component pio_output_1;

component sram_0_avalon_sram_slave_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_byteenable : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
                    signal cpu_0_data_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_data_master_dbs_write_16 : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal cpu_0_data_master_no_byte_enables_and_last_term : IN STD_LOGIC;
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_instruction_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_instruction_master_dbs_address : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_instruction_master_read : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sram_0_avalon_sram_slave_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal sram_0_avalon_sram_slave_readdatavalid : IN STD_LOGIC;

                 -- outputs:
                    signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal cpu_0_data_master_granted_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_granted_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register : OUT STD_LOGIC;
                    signal cpu_0_instruction_master_requests_sram_0_avalon_sram_slave : OUT STD_LOGIC;
                    signal d1_sram_0_avalon_sram_slave_end_xfer : OUT STD_LOGIC;
                    signal sram_0_avalon_sram_slave_address : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal sram_0_avalon_sram_slave_byteenable : OUT STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal sram_0_avalon_sram_slave_read : OUT STD_LOGIC;
                    signal sram_0_avalon_sram_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal sram_0_avalon_sram_slave_reset : OUT STD_LOGIC;
                    signal sram_0_avalon_sram_slave_write : OUT STD_LOGIC;
                    signal sram_0_avalon_sram_slave_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component sram_0_avalon_sram_slave_arbitrator;

component sram_0 is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal byteenable : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
                    signal clk : IN STD_LOGIC;
                    signal read : IN STD_LOGIC;
                    signal reset : IN STD_LOGIC;
                    signal write : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal SRAM_ADDR : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal SRAM_CE_N : OUT STD_LOGIC;
                    signal SRAM_DQ : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal SRAM_LB_N : OUT STD_LOGIC;
                    signal SRAM_OE_N : OUT STD_LOGIC;
                    signal SRAM_UB_N : OUT STD_LOGIC;
                    signal SRAM_WE_N : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal readdatavalid : OUT STD_LOGIC
                 );
end component sram_0;

component sysid_control_slave_arbitrator is 
           port (
                 -- inputs:
                    signal CPU_System_clock_1_out_address_to_slave : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal CPU_System_clock_1_out_nativeaddress : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_read : IN STD_LOGIC;
                    signal CPU_System_clock_1_out_write : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal sysid_control_slave_readdata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);

                 -- outputs:
                    signal CPU_System_clock_1_out_granted_sysid_control_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_1_out_qualified_request_sysid_control_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_1_out_read_data_valid_sysid_control_slave : OUT STD_LOGIC;
                    signal CPU_System_clock_1_out_requests_sysid_control_slave : OUT STD_LOGIC;
                    signal d1_sysid_control_slave_end_xfer : OUT STD_LOGIC;
                    signal sysid_control_slave_address : OUT STD_LOGIC;
                    signal sysid_control_slave_readdata_from_sa : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal sysid_control_slave_reset_n : OUT STD_LOGIC
                 );
end component sysid_control_slave_arbitrator;

component sysid is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC;
                    signal clock : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal readdata : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
                 );
end component sysid;

component timer_system_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal timer_system_s1_irq : IN STD_LOGIC;
                    signal timer_system_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_data_master_granted_timer_system_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_timer_system_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_timer_system_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_timer_system_s1 : OUT STD_LOGIC;
                    signal d1_timer_system_s1_end_xfer : OUT STD_LOGIC;
                    signal timer_system_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal timer_system_s1_chipselect : OUT STD_LOGIC;
                    signal timer_system_s1_irq_from_sa : OUT STD_LOGIC;
                    signal timer_system_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal timer_system_s1_reset_n : OUT STD_LOGIC;
                    signal timer_system_s1_write_n : OUT STD_LOGIC;
                    signal timer_system_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component timer_system_s1_arbitrator;

component timer_system is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component timer_system;

component timer_timestamp_s1_arbitrator is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal cpu_0_data_master_address_to_slave : IN STD_LOGIC_VECTOR (20 DOWNTO 0);
                    signal cpu_0_data_master_read : IN STD_LOGIC;
                    signal cpu_0_data_master_waitrequest : IN STD_LOGIC;
                    signal cpu_0_data_master_write : IN STD_LOGIC;
                    signal cpu_0_data_master_writedata : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
                    signal reset_n : IN STD_LOGIC;
                    signal timer_timestamp_s1_irq : IN STD_LOGIC;
                    signal timer_timestamp_s1_readdata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal cpu_0_data_master_granted_timer_timestamp_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_qualified_request_timer_timestamp_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_read_data_valid_timer_timestamp_s1 : OUT STD_LOGIC;
                    signal cpu_0_data_master_requests_timer_timestamp_s1 : OUT STD_LOGIC;
                    signal d1_timer_timestamp_s1_end_xfer : OUT STD_LOGIC;
                    signal timer_timestamp_s1_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal timer_timestamp_s1_chipselect : OUT STD_LOGIC;
                    signal timer_timestamp_s1_irq_from_sa : OUT STD_LOGIC;
                    signal timer_timestamp_s1_readdata_from_sa : OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal timer_timestamp_s1_reset_n : OUT STD_LOGIC;
                    signal timer_timestamp_s1_write_n : OUT STD_LOGIC;
                    signal timer_timestamp_s1_writedata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component timer_timestamp_s1_arbitrator;

component timer_timestamp is 
           port (
                 -- inputs:
                    signal address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
                    signal chipselect : IN STD_LOGIC;
                    signal clk : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;
                    signal write_n : IN STD_LOGIC;
                    signal writedata : IN STD_LOGIC_VECTOR (15 DOWNTO 0);

                 -- outputs:
                    signal irq : OUT STD_LOGIC;
                    signal readdata : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
                 );
end component timer_timestamp;

component CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC
                 );
end component CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module;

component CPU_System_reset_clk_0_domain_synch_module is 
           port (
                 -- inputs:
                    signal clk : IN STD_LOGIC;
                    signal data_in : IN STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- outputs:
                    signal data_out : OUT STD_LOGIC
                 );
end component CPU_System_reset_clk_0_domain_synch_module;

                signal CPU_System_clock_0_in_address :  STD_LOGIC;
                signal CPU_System_clock_0_in_endofpacket :  STD_LOGIC;
                signal CPU_System_clock_0_in_endofpacket_from_sa :  STD_LOGIC;
                signal CPU_System_clock_0_in_nativeaddress :  STD_LOGIC;
                signal CPU_System_clock_0_in_read :  STD_LOGIC;
                signal CPU_System_clock_0_in_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal CPU_System_clock_0_in_readdata_from_sa :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal CPU_System_clock_0_in_reset_n :  STD_LOGIC;
                signal CPU_System_clock_0_in_waitrequest :  STD_LOGIC;
                signal CPU_System_clock_0_in_waitrequest_from_sa :  STD_LOGIC;
                signal CPU_System_clock_0_in_write :  STD_LOGIC;
                signal CPU_System_clock_0_in_writedata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal CPU_System_clock_0_out_address :  STD_LOGIC;
                signal CPU_System_clock_0_out_address_to_slave :  STD_LOGIC;
                signal CPU_System_clock_0_out_endofpacket :  STD_LOGIC;
                signal CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal CPU_System_clock_0_out_nativeaddress :  STD_LOGIC;
                signal CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal CPU_System_clock_0_out_read :  STD_LOGIC;
                signal CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal CPU_System_clock_0_out_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave :  STD_LOGIC;
                signal CPU_System_clock_0_out_reset_n :  STD_LOGIC;
                signal CPU_System_clock_0_out_waitrequest :  STD_LOGIC;
                signal CPU_System_clock_0_out_write :  STD_LOGIC;
                signal CPU_System_clock_0_out_writedata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal CPU_System_clock_1_in_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_in_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal CPU_System_clock_1_in_endofpacket :  STD_LOGIC;
                signal CPU_System_clock_1_in_endofpacket_from_sa :  STD_LOGIC;
                signal CPU_System_clock_1_in_nativeaddress :  STD_LOGIC;
                signal CPU_System_clock_1_in_read :  STD_LOGIC;
                signal CPU_System_clock_1_in_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal CPU_System_clock_1_in_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal CPU_System_clock_1_in_reset_n :  STD_LOGIC;
                signal CPU_System_clock_1_in_waitrequest :  STD_LOGIC;
                signal CPU_System_clock_1_in_waitrequest_from_sa :  STD_LOGIC;
                signal CPU_System_clock_1_in_write :  STD_LOGIC;
                signal CPU_System_clock_1_in_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal CPU_System_clock_1_out_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_out_address_to_slave :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal CPU_System_clock_1_out_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal CPU_System_clock_1_out_endofpacket :  STD_LOGIC;
                signal CPU_System_clock_1_out_granted_sysid_control_slave :  STD_LOGIC;
                signal CPU_System_clock_1_out_nativeaddress :  STD_LOGIC;
                signal CPU_System_clock_1_out_qualified_request_sysid_control_slave :  STD_LOGIC;
                signal CPU_System_clock_1_out_read :  STD_LOGIC;
                signal CPU_System_clock_1_out_read_data_valid_sysid_control_slave :  STD_LOGIC;
                signal CPU_System_clock_1_out_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal CPU_System_clock_1_out_requests_sysid_control_slave :  STD_LOGIC;
                signal CPU_System_clock_1_out_reset_n :  STD_LOGIC;
                signal CPU_System_clock_1_out_waitrequest :  STD_LOGIC;
                signal CPU_System_clock_1_out_write :  STD_LOGIC;
                signal CPU_System_clock_1_out_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal clk_0_reset_n :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_address :  STD_LOGIC;
                signal clocks_0_avalon_clocks_slave_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal clocks_0_avalon_clocks_slave_readdata_from_sa :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal clocks_0_sys_clk_out_reset_n :  STD_LOGIC;
                signal cpu_0_data_master_address :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal cpu_0_data_master_address_to_slave :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal cpu_0_data_master_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_data_master_byteenable_CPU_System_clock_0_in :  STD_LOGIC;
                signal cpu_0_data_master_byteenable_sram_0_avalon_sram_slave :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_data_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_data_master_dbs_write_16 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal cpu_0_data_master_dbs_write_8 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal cpu_0_data_master_debugaccess :  STD_LOGIC;
                signal cpu_0_data_master_granted_CPU_System_clock_0_in :  STD_LOGIC;
                signal cpu_0_data_master_granted_CPU_System_clock_1_in :  STD_LOGIC;
                signal cpu_0_data_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_granted_lcd_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_granted_pio_input_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_pio_output_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_pio_output_1_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_granted_timer_system_s1 :  STD_LOGIC;
                signal cpu_0_data_master_granted_timer_timestamp_s1 :  STD_LOGIC;
                signal cpu_0_data_master_irq :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_data_master_no_byte_enables_and_last_term :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_CPU_System_clock_0_in :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_CPU_System_clock_1_in :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_lcd_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_pio_input_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_pio_output_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_pio_output_1_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_timer_system_s1 :  STD_LOGIC;
                signal cpu_0_data_master_qualified_request_timer_timestamp_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_CPU_System_clock_0_in :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_CPU_System_clock_1_in :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_lcd_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_pio_input_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_pio_output_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_pio_output_1_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_timer_system_s1 :  STD_LOGIC;
                signal cpu_0_data_master_read_data_valid_timer_timestamp_s1 :  STD_LOGIC;
                signal cpu_0_data_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_data_master_requests_CPU_System_clock_0_in :  STD_LOGIC;
                signal cpu_0_data_master_requests_CPU_System_clock_1_in :  STD_LOGIC;
                signal cpu_0_data_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave :  STD_LOGIC;
                signal cpu_0_data_master_requests_lcd_0_control_slave :  STD_LOGIC;
                signal cpu_0_data_master_requests_pio_input_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_pio_output_0_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_pio_output_1_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_data_master_requests_timer_system_s1 :  STD_LOGIC;
                signal cpu_0_data_master_requests_timer_timestamp_s1 :  STD_LOGIC;
                signal cpu_0_data_master_waitrequest :  STD_LOGIC;
                signal cpu_0_data_master_write :  STD_LOGIC;
                signal cpu_0_data_master_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_instruction_master_address :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal cpu_0_instruction_master_address_to_slave :  STD_LOGIC_VECTOR (20 DOWNTO 0);
                signal cpu_0_instruction_master_dbs_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal cpu_0_instruction_master_granted_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_granted_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_read :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register :  STD_LOGIC;
                signal cpu_0_instruction_master_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_instruction_master_requests_cpu_0_jtag_debug_module :  STD_LOGIC;
                signal cpu_0_instruction_master_requests_sram_0_avalon_sram_slave :  STD_LOGIC;
                signal cpu_0_instruction_master_waitrequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_address :  STD_LOGIC_VECTOR (8 DOWNTO 0);
                signal cpu_0_jtag_debug_module_begintransfer :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_byteenable :  STD_LOGIC_VECTOR (3 DOWNTO 0);
                signal cpu_0_jtag_debug_module_chipselect :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_debugaccess :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_jtag_debug_module_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal cpu_0_jtag_debug_module_reset_n :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_resetrequest :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_resetrequest_from_sa :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_write :  STD_LOGIC;
                signal cpu_0_jtag_debug_module_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal d1_CPU_System_clock_0_in_end_xfer :  STD_LOGIC;
                signal d1_CPU_System_clock_1_in_end_xfer :  STD_LOGIC;
                signal d1_clocks_0_avalon_clocks_slave_end_xfer :  STD_LOGIC;
                signal d1_cpu_0_jtag_debug_module_end_xfer :  STD_LOGIC;
                signal d1_jtag_uart_0_avalon_jtag_slave_end_xfer :  STD_LOGIC;
                signal d1_lcd_0_control_slave_end_xfer :  STD_LOGIC;
                signal d1_pio_input_0_s1_end_xfer :  STD_LOGIC;
                signal d1_pio_output_0_s1_end_xfer :  STD_LOGIC;
                signal d1_pio_output_1_s1_end_xfer :  STD_LOGIC;
                signal d1_sram_0_avalon_sram_slave_end_xfer :  STD_LOGIC;
                signal d1_sysid_control_slave_end_xfer :  STD_LOGIC;
                signal d1_timer_system_s1_end_xfer :  STD_LOGIC;
                signal d1_timer_timestamp_s1_end_xfer :  STD_LOGIC;
                signal internal_LCD_E_from_the_lcd_0 :  STD_LOGIC;
                signal internal_LCD_RS_from_the_lcd_0 :  STD_LOGIC;
                signal internal_LCD_RW_from_the_lcd_0 :  STD_LOGIC;
                signal internal_SRAM_ADDR_from_the_sram_0 :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal internal_SRAM_CE_N_from_the_sram_0 :  STD_LOGIC;
                signal internal_SRAM_LB_N_from_the_sram_0 :  STD_LOGIC;
                signal internal_SRAM_OE_N_from_the_sram_0 :  STD_LOGIC;
                signal internal_SRAM_UB_N_from_the_sram_0 :  STD_LOGIC;
                signal internal_SRAM_WE_N_from_the_sram_0 :  STD_LOGIC;
                signal internal_clocks_0_sys_clk_out :  STD_LOGIC;
                signal internal_out_port_from_the_pio_output_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal internal_out_port_from_the_pio_output_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_address :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_chipselect :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_dataavailable :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_irq :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_irq_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_read_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_readyfordata :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_reset_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waitrequest :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_write_n :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal lcd_0_control_slave_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal lcd_0_control_slave_begintransfer :  STD_LOGIC;
                signal lcd_0_control_slave_read :  STD_LOGIC;
                signal lcd_0_control_slave_readdata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal lcd_0_control_slave_readdata_from_sa :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal lcd_0_control_slave_reset_n :  STD_LOGIC;
                signal lcd_0_control_slave_wait_counter_eq_0 :  STD_LOGIC;
                signal lcd_0_control_slave_wait_counter_eq_1 :  STD_LOGIC;
                signal lcd_0_control_slave_write :  STD_LOGIC;
                signal lcd_0_control_slave_writedata :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal module_input6 :  STD_LOGIC;
                signal module_input7 :  STD_LOGIC;
                signal out_clk_clocks_0_sys_clk :  STD_LOGIC;
                signal pio_input_0_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal pio_input_0_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_input_0_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_input_0_s1_reset_n :  STD_LOGIC;
                signal pio_output_0_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal pio_output_0_s1_chipselect :  STD_LOGIC;
                signal pio_output_0_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_output_0_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_output_0_s1_reset_n :  STD_LOGIC;
                signal pio_output_0_s1_write_n :  STD_LOGIC;
                signal pio_output_0_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_output_1_s1_address :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal pio_output_1_s1_chipselect :  STD_LOGIC;
                signal pio_output_1_s1_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_output_1_s1_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal pio_output_1_s1_reset_n :  STD_LOGIC;
                signal pio_output_1_s1_write_n :  STD_LOGIC;
                signal pio_output_1_s1_writedata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal reset_n_sources :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_address :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal sram_0_avalon_sram_slave_byteenable :  STD_LOGIC_VECTOR (1 DOWNTO 0);
                signal sram_0_avalon_sram_slave_read :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sram_0_avalon_sram_slave_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sram_0_avalon_sram_slave_readdatavalid :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_reset :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_write :  STD_LOGIC;
                signal sram_0_avalon_sram_slave_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal sysid_control_slave_address :  STD_LOGIC;
                signal sysid_control_slave_clock :  STD_LOGIC;
                signal sysid_control_slave_readdata :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sysid_control_slave_readdata_from_sa :  STD_LOGIC_VECTOR (31 DOWNTO 0);
                signal sysid_control_slave_reset_n :  STD_LOGIC;
                signal timer_system_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_system_s1_chipselect :  STD_LOGIC;
                signal timer_system_s1_irq :  STD_LOGIC;
                signal timer_system_s1_irq_from_sa :  STD_LOGIC;
                signal timer_system_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal timer_system_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal timer_system_s1_reset_n :  STD_LOGIC;
                signal timer_system_s1_write_n :  STD_LOGIC;
                signal timer_system_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal timer_timestamp_s1_address :  STD_LOGIC_VECTOR (2 DOWNTO 0);
                signal timer_timestamp_s1_chipselect :  STD_LOGIC;
                signal timer_timestamp_s1_irq :  STD_LOGIC;
                signal timer_timestamp_s1_irq_from_sa :  STD_LOGIC;
                signal timer_timestamp_s1_readdata :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal timer_timestamp_s1_readdata_from_sa :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal timer_timestamp_s1_reset_n :  STD_LOGIC;
                signal timer_timestamp_s1_write_n :  STD_LOGIC;
                signal timer_timestamp_s1_writedata :  STD_LOGIC_VECTOR (15 DOWNTO 0);

begin

  --the_CPU_System_clock_0_in, which is an e_instance
  the_CPU_System_clock_0_in : CPU_System_clock_0_in_arbitrator
    port map(
      CPU_System_clock_0_in_address => CPU_System_clock_0_in_address,
      CPU_System_clock_0_in_endofpacket_from_sa => CPU_System_clock_0_in_endofpacket_from_sa,
      CPU_System_clock_0_in_nativeaddress => CPU_System_clock_0_in_nativeaddress,
      CPU_System_clock_0_in_read => CPU_System_clock_0_in_read,
      CPU_System_clock_0_in_readdata_from_sa => CPU_System_clock_0_in_readdata_from_sa,
      CPU_System_clock_0_in_reset_n => CPU_System_clock_0_in_reset_n,
      CPU_System_clock_0_in_waitrequest_from_sa => CPU_System_clock_0_in_waitrequest_from_sa,
      CPU_System_clock_0_in_write => CPU_System_clock_0_in_write,
      CPU_System_clock_0_in_writedata => CPU_System_clock_0_in_writedata,
      cpu_0_data_master_byteenable_CPU_System_clock_0_in => cpu_0_data_master_byteenable_CPU_System_clock_0_in,
      cpu_0_data_master_granted_CPU_System_clock_0_in => cpu_0_data_master_granted_CPU_System_clock_0_in,
      cpu_0_data_master_qualified_request_CPU_System_clock_0_in => cpu_0_data_master_qualified_request_CPU_System_clock_0_in,
      cpu_0_data_master_read_data_valid_CPU_System_clock_0_in => cpu_0_data_master_read_data_valid_CPU_System_clock_0_in,
      cpu_0_data_master_requests_CPU_System_clock_0_in => cpu_0_data_master_requests_CPU_System_clock_0_in,
      d1_CPU_System_clock_0_in_end_xfer => d1_CPU_System_clock_0_in_end_xfer,
      CPU_System_clock_0_in_endofpacket => CPU_System_clock_0_in_endofpacket,
      CPU_System_clock_0_in_readdata => CPU_System_clock_0_in_readdata,
      CPU_System_clock_0_in_waitrequest => CPU_System_clock_0_in_waitrequest,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_dbs_address => cpu_0_data_master_dbs_address,
      cpu_0_data_master_dbs_write_8 => cpu_0_data_master_dbs_write_8,
      cpu_0_data_master_no_byte_enables_and_last_term => cpu_0_data_master_no_byte_enables_and_last_term,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_CPU_System_clock_0_out, which is an e_instance
  the_CPU_System_clock_0_out : CPU_System_clock_0_out_arbitrator
    port map(
      CPU_System_clock_0_out_address_to_slave => CPU_System_clock_0_out_address_to_slave,
      CPU_System_clock_0_out_readdata => CPU_System_clock_0_out_readdata,
      CPU_System_clock_0_out_reset_n => CPU_System_clock_0_out_reset_n,
      CPU_System_clock_0_out_waitrequest => CPU_System_clock_0_out_waitrequest,
      CPU_System_clock_0_out_address => CPU_System_clock_0_out_address,
      CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_read => CPU_System_clock_0_out_read,
      CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_write => CPU_System_clock_0_out_write,
      CPU_System_clock_0_out_writedata => CPU_System_clock_0_out_writedata,
      clk => clk_0,
      clocks_0_avalon_clocks_slave_readdata_from_sa => clocks_0_avalon_clocks_slave_readdata_from_sa,
      d1_clocks_0_avalon_clocks_slave_end_xfer => d1_clocks_0_avalon_clocks_slave_end_xfer,
      reset_n => clk_0_reset_n
    );


  --the_CPU_System_clock_0, which is an e_ptf_instance
  the_CPU_System_clock_0 : CPU_System_clock_0
    port map(
      master_address => CPU_System_clock_0_out_address,
      master_nativeaddress => CPU_System_clock_0_out_nativeaddress,
      master_read => CPU_System_clock_0_out_read,
      master_write => CPU_System_clock_0_out_write,
      master_writedata => CPU_System_clock_0_out_writedata,
      slave_endofpacket => CPU_System_clock_0_in_endofpacket,
      slave_readdata => CPU_System_clock_0_in_readdata,
      slave_waitrequest => CPU_System_clock_0_in_waitrequest,
      master_clk => clk_0,
      master_endofpacket => CPU_System_clock_0_out_endofpacket,
      master_readdata => CPU_System_clock_0_out_readdata,
      master_reset_n => CPU_System_clock_0_out_reset_n,
      master_waitrequest => CPU_System_clock_0_out_waitrequest,
      slave_address => CPU_System_clock_0_in_address,
      slave_clk => internal_clocks_0_sys_clk_out,
      slave_nativeaddress => CPU_System_clock_0_in_nativeaddress,
      slave_read => CPU_System_clock_0_in_read,
      slave_reset_n => CPU_System_clock_0_in_reset_n,
      slave_write => CPU_System_clock_0_in_write,
      slave_writedata => CPU_System_clock_0_in_writedata
    );


  --the_CPU_System_clock_1_in, which is an e_instance
  the_CPU_System_clock_1_in : CPU_System_clock_1_in_arbitrator
    port map(
      CPU_System_clock_1_in_address => CPU_System_clock_1_in_address,
      CPU_System_clock_1_in_byteenable => CPU_System_clock_1_in_byteenable,
      CPU_System_clock_1_in_endofpacket_from_sa => CPU_System_clock_1_in_endofpacket_from_sa,
      CPU_System_clock_1_in_nativeaddress => CPU_System_clock_1_in_nativeaddress,
      CPU_System_clock_1_in_read => CPU_System_clock_1_in_read,
      CPU_System_clock_1_in_readdata_from_sa => CPU_System_clock_1_in_readdata_from_sa,
      CPU_System_clock_1_in_reset_n => CPU_System_clock_1_in_reset_n,
      CPU_System_clock_1_in_waitrequest_from_sa => CPU_System_clock_1_in_waitrequest_from_sa,
      CPU_System_clock_1_in_write => CPU_System_clock_1_in_write,
      CPU_System_clock_1_in_writedata => CPU_System_clock_1_in_writedata,
      cpu_0_data_master_granted_CPU_System_clock_1_in => cpu_0_data_master_granted_CPU_System_clock_1_in,
      cpu_0_data_master_qualified_request_CPU_System_clock_1_in => cpu_0_data_master_qualified_request_CPU_System_clock_1_in,
      cpu_0_data_master_read_data_valid_CPU_System_clock_1_in => cpu_0_data_master_read_data_valid_CPU_System_clock_1_in,
      cpu_0_data_master_requests_CPU_System_clock_1_in => cpu_0_data_master_requests_CPU_System_clock_1_in,
      d1_CPU_System_clock_1_in_end_xfer => d1_CPU_System_clock_1_in_end_xfer,
      CPU_System_clock_1_in_endofpacket => CPU_System_clock_1_in_endofpacket,
      CPU_System_clock_1_in_readdata => CPU_System_clock_1_in_readdata,
      CPU_System_clock_1_in_waitrequest => CPU_System_clock_1_in_waitrequest,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_CPU_System_clock_1_out, which is an e_instance
  the_CPU_System_clock_1_out : CPU_System_clock_1_out_arbitrator
    port map(
      CPU_System_clock_1_out_address_to_slave => CPU_System_clock_1_out_address_to_slave,
      CPU_System_clock_1_out_readdata => CPU_System_clock_1_out_readdata,
      CPU_System_clock_1_out_reset_n => CPU_System_clock_1_out_reset_n,
      CPU_System_clock_1_out_waitrequest => CPU_System_clock_1_out_waitrequest,
      CPU_System_clock_1_out_address => CPU_System_clock_1_out_address,
      CPU_System_clock_1_out_byteenable => CPU_System_clock_1_out_byteenable,
      CPU_System_clock_1_out_granted_sysid_control_slave => CPU_System_clock_1_out_granted_sysid_control_slave,
      CPU_System_clock_1_out_qualified_request_sysid_control_slave => CPU_System_clock_1_out_qualified_request_sysid_control_slave,
      CPU_System_clock_1_out_read => CPU_System_clock_1_out_read,
      CPU_System_clock_1_out_read_data_valid_sysid_control_slave => CPU_System_clock_1_out_read_data_valid_sysid_control_slave,
      CPU_System_clock_1_out_requests_sysid_control_slave => CPU_System_clock_1_out_requests_sysid_control_slave,
      CPU_System_clock_1_out_write => CPU_System_clock_1_out_write,
      CPU_System_clock_1_out_writedata => CPU_System_clock_1_out_writedata,
      clk => clk_0,
      d1_sysid_control_slave_end_xfer => d1_sysid_control_slave_end_xfer,
      reset_n => clk_0_reset_n,
      sysid_control_slave_readdata_from_sa => sysid_control_slave_readdata_from_sa
    );


  --the_CPU_System_clock_1, which is an e_ptf_instance
  the_CPU_System_clock_1 : CPU_System_clock_1
    port map(
      master_address => CPU_System_clock_1_out_address,
      master_byteenable => CPU_System_clock_1_out_byteenable,
      master_nativeaddress => CPU_System_clock_1_out_nativeaddress,
      master_read => CPU_System_clock_1_out_read,
      master_write => CPU_System_clock_1_out_write,
      master_writedata => CPU_System_clock_1_out_writedata,
      slave_endofpacket => CPU_System_clock_1_in_endofpacket,
      slave_readdata => CPU_System_clock_1_in_readdata,
      slave_waitrequest => CPU_System_clock_1_in_waitrequest,
      master_clk => clk_0,
      master_endofpacket => CPU_System_clock_1_out_endofpacket,
      master_readdata => CPU_System_clock_1_out_readdata,
      master_reset_n => CPU_System_clock_1_out_reset_n,
      master_waitrequest => CPU_System_clock_1_out_waitrequest,
      slave_address => CPU_System_clock_1_in_address,
      slave_byteenable => CPU_System_clock_1_in_byteenable,
      slave_clk => internal_clocks_0_sys_clk_out,
      slave_nativeaddress => CPU_System_clock_1_in_nativeaddress,
      slave_read => CPU_System_clock_1_in_read,
      slave_reset_n => CPU_System_clock_1_in_reset_n,
      slave_write => CPU_System_clock_1_in_write,
      slave_writedata => CPU_System_clock_1_in_writedata
    );


  --the_clocks_0_avalon_clocks_slave, which is an e_instance
  the_clocks_0_avalon_clocks_slave : clocks_0_avalon_clocks_slave_arbitrator
    port map(
      CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_granted_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_qualified_request_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_read_data_valid_clocks_0_avalon_clocks_slave,
      CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave => CPU_System_clock_0_out_requests_clocks_0_avalon_clocks_slave,
      clocks_0_avalon_clocks_slave_address => clocks_0_avalon_clocks_slave_address,
      clocks_0_avalon_clocks_slave_readdata_from_sa => clocks_0_avalon_clocks_slave_readdata_from_sa,
      d1_clocks_0_avalon_clocks_slave_end_xfer => d1_clocks_0_avalon_clocks_slave_end_xfer,
      CPU_System_clock_0_out_address_to_slave => CPU_System_clock_0_out_address_to_slave,
      CPU_System_clock_0_out_read => CPU_System_clock_0_out_read,
      CPU_System_clock_0_out_write => CPU_System_clock_0_out_write,
      clk => clk_0,
      clocks_0_avalon_clocks_slave_readdata => clocks_0_avalon_clocks_slave_readdata,
      reset_n => clk_0_reset_n
    );


  --clocks_0_sys_clk_out out_clk assignment, which is an e_assign
  internal_clocks_0_sys_clk_out <= out_clk_clocks_0_sys_clk;
  --the_clocks_0, which is an e_ptf_instance
  the_clocks_0 : clocks_0
    port map(
      readdata => clocks_0_avalon_clocks_slave_readdata,
      sys_clk => out_clk_clocks_0_sys_clk,
      CLOCK_50 => clk_0,
      address => clocks_0_avalon_clocks_slave_address
    );


  --the_cpu_0_jtag_debug_module, which is an e_instance
  the_cpu_0_jtag_debug_module : cpu_0_jtag_debug_module_arbitrator
    port map(
      cpu_0_data_master_granted_cpu_0_jtag_debug_module => cpu_0_data_master_granted_cpu_0_jtag_debug_module,
      cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_data_master_requests_cpu_0_jtag_debug_module => cpu_0_data_master_requests_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_granted_cpu_0_jtag_debug_module => cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_requests_cpu_0_jtag_debug_module => cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
      cpu_0_jtag_debug_module_address => cpu_0_jtag_debug_module_address,
      cpu_0_jtag_debug_module_begintransfer => cpu_0_jtag_debug_module_begintransfer,
      cpu_0_jtag_debug_module_byteenable => cpu_0_jtag_debug_module_byteenable,
      cpu_0_jtag_debug_module_chipselect => cpu_0_jtag_debug_module_chipselect,
      cpu_0_jtag_debug_module_debugaccess => cpu_0_jtag_debug_module_debugaccess,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      cpu_0_jtag_debug_module_reset_n => cpu_0_jtag_debug_module_reset_n,
      cpu_0_jtag_debug_module_resetrequest_from_sa => cpu_0_jtag_debug_module_resetrequest_from_sa,
      cpu_0_jtag_debug_module_write => cpu_0_jtag_debug_module_write,
      cpu_0_jtag_debug_module_writedata => cpu_0_jtag_debug_module_writedata,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_debugaccess => cpu_0_data_master_debugaccess,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      cpu_0_jtag_debug_module_readdata => cpu_0_jtag_debug_module_readdata,
      cpu_0_jtag_debug_module_resetrequest => cpu_0_jtag_debug_module_resetrequest,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_cpu_0_data_master, which is an e_instance
  the_cpu_0_data_master : cpu_0_data_master_arbitrator
    port map(
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_dbs_address => cpu_0_data_master_dbs_address,
      cpu_0_data_master_dbs_write_16 => cpu_0_data_master_dbs_write_16,
      cpu_0_data_master_dbs_write_8 => cpu_0_data_master_dbs_write_8,
      cpu_0_data_master_irq => cpu_0_data_master_irq,
      cpu_0_data_master_no_byte_enables_and_last_term => cpu_0_data_master_no_byte_enables_and_last_term,
      cpu_0_data_master_readdata => cpu_0_data_master_readdata,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      CPU_System_clock_0_in_readdata_from_sa => CPU_System_clock_0_in_readdata_from_sa,
      CPU_System_clock_0_in_waitrequest_from_sa => CPU_System_clock_0_in_waitrequest_from_sa,
      CPU_System_clock_1_in_readdata_from_sa => CPU_System_clock_1_in_readdata_from_sa,
      CPU_System_clock_1_in_waitrequest_from_sa => CPU_System_clock_1_in_waitrequest_from_sa,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address => cpu_0_data_master_address,
      cpu_0_data_master_byteenable_CPU_System_clock_0_in => cpu_0_data_master_byteenable_CPU_System_clock_0_in,
      cpu_0_data_master_byteenable_sram_0_avalon_sram_slave => cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
      cpu_0_data_master_granted_CPU_System_clock_0_in => cpu_0_data_master_granted_CPU_System_clock_0_in,
      cpu_0_data_master_granted_CPU_System_clock_1_in => cpu_0_data_master_granted_CPU_System_clock_1_in,
      cpu_0_data_master_granted_cpu_0_jtag_debug_module => cpu_0_data_master_granted_cpu_0_jtag_debug_module,
      cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_granted_lcd_0_control_slave => cpu_0_data_master_granted_lcd_0_control_slave,
      cpu_0_data_master_granted_pio_input_0_s1 => cpu_0_data_master_granted_pio_input_0_s1,
      cpu_0_data_master_granted_pio_output_0_s1 => cpu_0_data_master_granted_pio_output_0_s1,
      cpu_0_data_master_granted_pio_output_1_s1 => cpu_0_data_master_granted_pio_output_1_s1,
      cpu_0_data_master_granted_sram_0_avalon_sram_slave => cpu_0_data_master_granted_sram_0_avalon_sram_slave,
      cpu_0_data_master_granted_timer_system_s1 => cpu_0_data_master_granted_timer_system_s1,
      cpu_0_data_master_granted_timer_timestamp_s1 => cpu_0_data_master_granted_timer_timestamp_s1,
      cpu_0_data_master_qualified_request_CPU_System_clock_0_in => cpu_0_data_master_qualified_request_CPU_System_clock_0_in,
      cpu_0_data_master_qualified_request_CPU_System_clock_1_in => cpu_0_data_master_qualified_request_CPU_System_clock_1_in,
      cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_data_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_qualified_request_lcd_0_control_slave => cpu_0_data_master_qualified_request_lcd_0_control_slave,
      cpu_0_data_master_qualified_request_pio_input_0_s1 => cpu_0_data_master_qualified_request_pio_input_0_s1,
      cpu_0_data_master_qualified_request_pio_output_0_s1 => cpu_0_data_master_qualified_request_pio_output_0_s1,
      cpu_0_data_master_qualified_request_pio_output_1_s1 => cpu_0_data_master_qualified_request_pio_output_1_s1,
      cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave => cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
      cpu_0_data_master_qualified_request_timer_system_s1 => cpu_0_data_master_qualified_request_timer_system_s1,
      cpu_0_data_master_qualified_request_timer_timestamp_s1 => cpu_0_data_master_qualified_request_timer_timestamp_s1,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_read_data_valid_CPU_System_clock_0_in => cpu_0_data_master_read_data_valid_CPU_System_clock_0_in,
      cpu_0_data_master_read_data_valid_CPU_System_clock_1_in => cpu_0_data_master_read_data_valid_CPU_System_clock_1_in,
      cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_data_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_read_data_valid_lcd_0_control_slave => cpu_0_data_master_read_data_valid_lcd_0_control_slave,
      cpu_0_data_master_read_data_valid_pio_input_0_s1 => cpu_0_data_master_read_data_valid_pio_input_0_s1,
      cpu_0_data_master_read_data_valid_pio_output_0_s1 => cpu_0_data_master_read_data_valid_pio_output_0_s1,
      cpu_0_data_master_read_data_valid_pio_output_1_s1 => cpu_0_data_master_read_data_valid_pio_output_1_s1,
      cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave => cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
      cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register => cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
      cpu_0_data_master_read_data_valid_timer_system_s1 => cpu_0_data_master_read_data_valid_timer_system_s1,
      cpu_0_data_master_read_data_valid_timer_timestamp_s1 => cpu_0_data_master_read_data_valid_timer_timestamp_s1,
      cpu_0_data_master_requests_CPU_System_clock_0_in => cpu_0_data_master_requests_CPU_System_clock_0_in,
      cpu_0_data_master_requests_CPU_System_clock_1_in => cpu_0_data_master_requests_CPU_System_clock_1_in,
      cpu_0_data_master_requests_cpu_0_jtag_debug_module => cpu_0_data_master_requests_cpu_0_jtag_debug_module,
      cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_requests_lcd_0_control_slave => cpu_0_data_master_requests_lcd_0_control_slave,
      cpu_0_data_master_requests_pio_input_0_s1 => cpu_0_data_master_requests_pio_input_0_s1,
      cpu_0_data_master_requests_pio_output_0_s1 => cpu_0_data_master_requests_pio_output_0_s1,
      cpu_0_data_master_requests_pio_output_1_s1 => cpu_0_data_master_requests_pio_output_1_s1,
      cpu_0_data_master_requests_sram_0_avalon_sram_slave => cpu_0_data_master_requests_sram_0_avalon_sram_slave,
      cpu_0_data_master_requests_timer_system_s1 => cpu_0_data_master_requests_timer_system_s1,
      cpu_0_data_master_requests_timer_timestamp_s1 => cpu_0_data_master_requests_timer_timestamp_s1,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      d1_CPU_System_clock_0_in_end_xfer => d1_CPU_System_clock_0_in_end_xfer,
      d1_CPU_System_clock_1_in_end_xfer => d1_CPU_System_clock_1_in_end_xfer,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer => d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
      d1_lcd_0_control_slave_end_xfer => d1_lcd_0_control_slave_end_xfer,
      d1_pio_input_0_s1_end_xfer => d1_pio_input_0_s1_end_xfer,
      d1_pio_output_0_s1_end_xfer => d1_pio_output_0_s1_end_xfer,
      d1_pio_output_1_s1_end_xfer => d1_pio_output_1_s1_end_xfer,
      d1_sram_0_avalon_sram_slave_end_xfer => d1_sram_0_avalon_sram_slave_end_xfer,
      d1_timer_system_s1_end_xfer => d1_timer_system_s1_end_xfer,
      d1_timer_timestamp_s1_end_xfer => d1_timer_timestamp_s1_end_xfer,
      jtag_uart_0_avalon_jtag_slave_irq_from_sa => jtag_uart_0_avalon_jtag_slave_irq_from_sa,
      jtag_uart_0_avalon_jtag_slave_readdata_from_sa => jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
      lcd_0_control_slave_readdata_from_sa => lcd_0_control_slave_readdata_from_sa,
      lcd_0_control_slave_wait_counter_eq_0 => lcd_0_control_slave_wait_counter_eq_0,
      lcd_0_control_slave_wait_counter_eq_1 => lcd_0_control_slave_wait_counter_eq_1,
      pio_input_0_s1_readdata_from_sa => pio_input_0_s1_readdata_from_sa,
      pio_output_0_s1_readdata_from_sa => pio_output_0_s1_readdata_from_sa,
      pio_output_1_s1_readdata_from_sa => pio_output_1_s1_readdata_from_sa,
      reset_n => clocks_0_sys_clk_out_reset_n,
      sram_0_avalon_sram_slave_readdata_from_sa => sram_0_avalon_sram_slave_readdata_from_sa,
      timer_system_s1_irq_from_sa => timer_system_s1_irq_from_sa,
      timer_system_s1_readdata_from_sa => timer_system_s1_readdata_from_sa,
      timer_timestamp_s1_irq_from_sa => timer_timestamp_s1_irq_from_sa,
      timer_timestamp_s1_readdata_from_sa => timer_timestamp_s1_readdata_from_sa
    );


  --the_cpu_0_instruction_master, which is an e_instance
  the_cpu_0_instruction_master : cpu_0_instruction_master_arbitrator
    port map(
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_dbs_address => cpu_0_instruction_master_dbs_address,
      cpu_0_instruction_master_readdata => cpu_0_instruction_master_readdata,
      cpu_0_instruction_master_waitrequest => cpu_0_instruction_master_waitrequest,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_instruction_master_address => cpu_0_instruction_master_address,
      cpu_0_instruction_master_granted_cpu_0_jtag_debug_module => cpu_0_instruction_master_granted_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_granted_sram_0_avalon_sram_slave => cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module => cpu_0_instruction_master_qualified_request_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave => cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module => cpu_0_instruction_master_read_data_valid_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave => cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register => cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
      cpu_0_instruction_master_requests_cpu_0_jtag_debug_module => cpu_0_instruction_master_requests_cpu_0_jtag_debug_module,
      cpu_0_instruction_master_requests_sram_0_avalon_sram_slave => cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
      cpu_0_jtag_debug_module_readdata_from_sa => cpu_0_jtag_debug_module_readdata_from_sa,
      d1_cpu_0_jtag_debug_module_end_xfer => d1_cpu_0_jtag_debug_module_end_xfer,
      d1_sram_0_avalon_sram_slave_end_xfer => d1_sram_0_avalon_sram_slave_end_xfer,
      reset_n => clocks_0_sys_clk_out_reset_n,
      sram_0_avalon_sram_slave_readdata_from_sa => sram_0_avalon_sram_slave_readdata_from_sa
    );


  --the_cpu_0, which is an e_ptf_instance
  the_cpu_0 : cpu_0
    port map(
      d_address => cpu_0_data_master_address,
      d_byteenable => cpu_0_data_master_byteenable,
      d_read => cpu_0_data_master_read,
      d_write => cpu_0_data_master_write,
      d_writedata => cpu_0_data_master_writedata,
      i_address => cpu_0_instruction_master_address,
      i_read => cpu_0_instruction_master_read,
      jtag_debug_module_debugaccess_to_roms => cpu_0_data_master_debugaccess,
      jtag_debug_module_readdata => cpu_0_jtag_debug_module_readdata,
      jtag_debug_module_resetrequest => cpu_0_jtag_debug_module_resetrequest,
      clk => internal_clocks_0_sys_clk_out,
      d_irq => cpu_0_data_master_irq,
      d_readdata => cpu_0_data_master_readdata,
      d_waitrequest => cpu_0_data_master_waitrequest,
      i_readdata => cpu_0_instruction_master_readdata,
      i_waitrequest => cpu_0_instruction_master_waitrequest,
      jtag_debug_module_address => cpu_0_jtag_debug_module_address,
      jtag_debug_module_begintransfer => cpu_0_jtag_debug_module_begintransfer,
      jtag_debug_module_byteenable => cpu_0_jtag_debug_module_byteenable,
      jtag_debug_module_debugaccess => cpu_0_jtag_debug_module_debugaccess,
      jtag_debug_module_select => cpu_0_jtag_debug_module_chipselect,
      jtag_debug_module_write => cpu_0_jtag_debug_module_write,
      jtag_debug_module_writedata => cpu_0_jtag_debug_module_writedata,
      reset_n => cpu_0_jtag_debug_module_reset_n
    );


  --the_jtag_uart_0_avalon_jtag_slave, which is an e_instance
  the_jtag_uart_0_avalon_jtag_slave : jtag_uart_0_avalon_jtag_slave_arbitrator
    port map(
      cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_granted_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_qualified_request_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_read_data_valid_jtag_uart_0_avalon_jtag_slave,
      cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave => cpu_0_data_master_requests_jtag_uart_0_avalon_jtag_slave,
      d1_jtag_uart_0_avalon_jtag_slave_end_xfer => d1_jtag_uart_0_avalon_jtag_slave_end_xfer,
      jtag_uart_0_avalon_jtag_slave_address => jtag_uart_0_avalon_jtag_slave_address,
      jtag_uart_0_avalon_jtag_slave_chipselect => jtag_uart_0_avalon_jtag_slave_chipselect,
      jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa => jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa,
      jtag_uart_0_avalon_jtag_slave_irq_from_sa => jtag_uart_0_avalon_jtag_slave_irq_from_sa,
      jtag_uart_0_avalon_jtag_slave_read_n => jtag_uart_0_avalon_jtag_slave_read_n,
      jtag_uart_0_avalon_jtag_slave_readdata_from_sa => jtag_uart_0_avalon_jtag_slave_readdata_from_sa,
      jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa => jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa,
      jtag_uart_0_avalon_jtag_slave_reset_n => jtag_uart_0_avalon_jtag_slave_reset_n,
      jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa => jtag_uart_0_avalon_jtag_slave_waitrequest_from_sa,
      jtag_uart_0_avalon_jtag_slave_write_n => jtag_uart_0_avalon_jtag_slave_write_n,
      jtag_uart_0_avalon_jtag_slave_writedata => jtag_uart_0_avalon_jtag_slave_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      jtag_uart_0_avalon_jtag_slave_dataavailable => jtag_uart_0_avalon_jtag_slave_dataavailable,
      jtag_uart_0_avalon_jtag_slave_irq => jtag_uart_0_avalon_jtag_slave_irq,
      jtag_uart_0_avalon_jtag_slave_readdata => jtag_uart_0_avalon_jtag_slave_readdata,
      jtag_uart_0_avalon_jtag_slave_readyfordata => jtag_uart_0_avalon_jtag_slave_readyfordata,
      jtag_uart_0_avalon_jtag_slave_waitrequest => jtag_uart_0_avalon_jtag_slave_waitrequest,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_jtag_uart_0, which is an e_ptf_instance
  the_jtag_uart_0 : jtag_uart_0
    port map(
      av_irq => jtag_uart_0_avalon_jtag_slave_irq,
      av_readdata => jtag_uart_0_avalon_jtag_slave_readdata,
      av_waitrequest => jtag_uart_0_avalon_jtag_slave_waitrequest,
      dataavailable => jtag_uart_0_avalon_jtag_slave_dataavailable,
      readyfordata => jtag_uart_0_avalon_jtag_slave_readyfordata,
      av_address => jtag_uart_0_avalon_jtag_slave_address,
      av_chipselect => jtag_uart_0_avalon_jtag_slave_chipselect,
      av_read_n => jtag_uart_0_avalon_jtag_slave_read_n,
      av_write_n => jtag_uart_0_avalon_jtag_slave_write_n,
      av_writedata => jtag_uart_0_avalon_jtag_slave_writedata,
      clk => internal_clocks_0_sys_clk_out,
      rst_n => jtag_uart_0_avalon_jtag_slave_reset_n
    );


  --the_lcd_0_control_slave, which is an e_instance
  the_lcd_0_control_slave : lcd_0_control_slave_arbitrator
    port map(
      cpu_0_data_master_granted_lcd_0_control_slave => cpu_0_data_master_granted_lcd_0_control_slave,
      cpu_0_data_master_qualified_request_lcd_0_control_slave => cpu_0_data_master_qualified_request_lcd_0_control_slave,
      cpu_0_data_master_read_data_valid_lcd_0_control_slave => cpu_0_data_master_read_data_valid_lcd_0_control_slave,
      cpu_0_data_master_requests_lcd_0_control_slave => cpu_0_data_master_requests_lcd_0_control_slave,
      d1_lcd_0_control_slave_end_xfer => d1_lcd_0_control_slave_end_xfer,
      lcd_0_control_slave_address => lcd_0_control_slave_address,
      lcd_0_control_slave_begintransfer => lcd_0_control_slave_begintransfer,
      lcd_0_control_slave_read => lcd_0_control_slave_read,
      lcd_0_control_slave_readdata_from_sa => lcd_0_control_slave_readdata_from_sa,
      lcd_0_control_slave_reset_n => lcd_0_control_slave_reset_n,
      lcd_0_control_slave_wait_counter_eq_0 => lcd_0_control_slave_wait_counter_eq_0,
      lcd_0_control_slave_wait_counter_eq_1 => lcd_0_control_slave_wait_counter_eq_1,
      lcd_0_control_slave_write => lcd_0_control_slave_write,
      lcd_0_control_slave_writedata => lcd_0_control_slave_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      lcd_0_control_slave_readdata => lcd_0_control_slave_readdata,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_lcd_0, which is an e_ptf_instance
  the_lcd_0 : lcd_0
    port map(
      LCD_E => internal_LCD_E_from_the_lcd_0,
      LCD_RS => internal_LCD_RS_from_the_lcd_0,
      LCD_RW => internal_LCD_RW_from_the_lcd_0,
      LCD_data => LCD_data_to_and_from_the_lcd_0,
      readdata => lcd_0_control_slave_readdata,
      address => lcd_0_control_slave_address,
      begintransfer => lcd_0_control_slave_begintransfer,
      clk => internal_clocks_0_sys_clk_out,
      read => lcd_0_control_slave_read,
      reset_n => lcd_0_control_slave_reset_n,
      write => lcd_0_control_slave_write,
      writedata => lcd_0_control_slave_writedata
    );


  --the_pio_input_0_s1, which is an e_instance
  the_pio_input_0_s1 : pio_input_0_s1_arbitrator
    port map(
      cpu_0_data_master_granted_pio_input_0_s1 => cpu_0_data_master_granted_pio_input_0_s1,
      cpu_0_data_master_qualified_request_pio_input_0_s1 => cpu_0_data_master_qualified_request_pio_input_0_s1,
      cpu_0_data_master_read_data_valid_pio_input_0_s1 => cpu_0_data_master_read_data_valid_pio_input_0_s1,
      cpu_0_data_master_requests_pio_input_0_s1 => cpu_0_data_master_requests_pio_input_0_s1,
      d1_pio_input_0_s1_end_xfer => d1_pio_input_0_s1_end_xfer,
      pio_input_0_s1_address => pio_input_0_s1_address,
      pio_input_0_s1_readdata_from_sa => pio_input_0_s1_readdata_from_sa,
      pio_input_0_s1_reset_n => pio_input_0_s1_reset_n,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_write => cpu_0_data_master_write,
      pio_input_0_s1_readdata => pio_input_0_s1_readdata,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_pio_input_0, which is an e_ptf_instance
  the_pio_input_0 : pio_input_0
    port map(
      readdata => pio_input_0_s1_readdata,
      address => pio_input_0_s1_address,
      clk => internal_clocks_0_sys_clk_out,
      in_port => in_port_to_the_pio_input_0,
      reset_n => pio_input_0_s1_reset_n
    );


  --the_pio_output_0_s1, which is an e_instance
  the_pio_output_0_s1 : pio_output_0_s1_arbitrator
    port map(
      cpu_0_data_master_granted_pio_output_0_s1 => cpu_0_data_master_granted_pio_output_0_s1,
      cpu_0_data_master_qualified_request_pio_output_0_s1 => cpu_0_data_master_qualified_request_pio_output_0_s1,
      cpu_0_data_master_read_data_valid_pio_output_0_s1 => cpu_0_data_master_read_data_valid_pio_output_0_s1,
      cpu_0_data_master_requests_pio_output_0_s1 => cpu_0_data_master_requests_pio_output_0_s1,
      d1_pio_output_0_s1_end_xfer => d1_pio_output_0_s1_end_xfer,
      pio_output_0_s1_address => pio_output_0_s1_address,
      pio_output_0_s1_chipselect => pio_output_0_s1_chipselect,
      pio_output_0_s1_readdata_from_sa => pio_output_0_s1_readdata_from_sa,
      pio_output_0_s1_reset_n => pio_output_0_s1_reset_n,
      pio_output_0_s1_write_n => pio_output_0_s1_write_n,
      pio_output_0_s1_writedata => pio_output_0_s1_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      pio_output_0_s1_readdata => pio_output_0_s1_readdata,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_pio_output_0, which is an e_ptf_instance
  the_pio_output_0 : pio_output_0
    port map(
      out_port => internal_out_port_from_the_pio_output_0,
      readdata => pio_output_0_s1_readdata,
      address => pio_output_0_s1_address,
      chipselect => pio_output_0_s1_chipselect,
      clk => internal_clocks_0_sys_clk_out,
      reset_n => pio_output_0_s1_reset_n,
      write_n => pio_output_0_s1_write_n,
      writedata => pio_output_0_s1_writedata
    );


  --the_pio_output_1_s1, which is an e_instance
  the_pio_output_1_s1 : pio_output_1_s1_arbitrator
    port map(
      cpu_0_data_master_granted_pio_output_1_s1 => cpu_0_data_master_granted_pio_output_1_s1,
      cpu_0_data_master_qualified_request_pio_output_1_s1 => cpu_0_data_master_qualified_request_pio_output_1_s1,
      cpu_0_data_master_read_data_valid_pio_output_1_s1 => cpu_0_data_master_read_data_valid_pio_output_1_s1,
      cpu_0_data_master_requests_pio_output_1_s1 => cpu_0_data_master_requests_pio_output_1_s1,
      d1_pio_output_1_s1_end_xfer => d1_pio_output_1_s1_end_xfer,
      pio_output_1_s1_address => pio_output_1_s1_address,
      pio_output_1_s1_chipselect => pio_output_1_s1_chipselect,
      pio_output_1_s1_readdata_from_sa => pio_output_1_s1_readdata_from_sa,
      pio_output_1_s1_reset_n => pio_output_1_s1_reset_n,
      pio_output_1_s1_write_n => pio_output_1_s1_write_n,
      pio_output_1_s1_writedata => pio_output_1_s1_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      pio_output_1_s1_readdata => pio_output_1_s1_readdata,
      reset_n => clocks_0_sys_clk_out_reset_n
    );


  --the_pio_output_1, which is an e_ptf_instance
  the_pio_output_1 : pio_output_1
    port map(
      out_port => internal_out_port_from_the_pio_output_1,
      readdata => pio_output_1_s1_readdata,
      address => pio_output_1_s1_address,
      chipselect => pio_output_1_s1_chipselect,
      clk => internal_clocks_0_sys_clk_out,
      reset_n => pio_output_1_s1_reset_n,
      write_n => pio_output_1_s1_write_n,
      writedata => pio_output_1_s1_writedata
    );


  --the_sram_0_avalon_sram_slave, which is an e_instance
  the_sram_0_avalon_sram_slave : sram_0_avalon_sram_slave_arbitrator
    port map(
      cpu_0_data_master_byteenable_sram_0_avalon_sram_slave => cpu_0_data_master_byteenable_sram_0_avalon_sram_slave,
      cpu_0_data_master_granted_sram_0_avalon_sram_slave => cpu_0_data_master_granted_sram_0_avalon_sram_slave,
      cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave => cpu_0_data_master_qualified_request_sram_0_avalon_sram_slave,
      cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave => cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave,
      cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register => cpu_0_data_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
      cpu_0_data_master_requests_sram_0_avalon_sram_slave => cpu_0_data_master_requests_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_granted_sram_0_avalon_sram_slave => cpu_0_instruction_master_granted_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave => cpu_0_instruction_master_qualified_request_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave => cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave,
      cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register => cpu_0_instruction_master_read_data_valid_sram_0_avalon_sram_slave_shift_register,
      cpu_0_instruction_master_requests_sram_0_avalon_sram_slave => cpu_0_instruction_master_requests_sram_0_avalon_sram_slave,
      d1_sram_0_avalon_sram_slave_end_xfer => d1_sram_0_avalon_sram_slave_end_xfer,
      sram_0_avalon_sram_slave_address => sram_0_avalon_sram_slave_address,
      sram_0_avalon_sram_slave_byteenable => sram_0_avalon_sram_slave_byteenable,
      sram_0_avalon_sram_slave_read => sram_0_avalon_sram_slave_read,
      sram_0_avalon_sram_slave_readdata_from_sa => sram_0_avalon_sram_slave_readdata_from_sa,
      sram_0_avalon_sram_slave_reset => sram_0_avalon_sram_slave_reset,
      sram_0_avalon_sram_slave_write => sram_0_avalon_sram_slave_write,
      sram_0_avalon_sram_slave_writedata => sram_0_avalon_sram_slave_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_byteenable => cpu_0_data_master_byteenable,
      cpu_0_data_master_dbs_address => cpu_0_data_master_dbs_address,
      cpu_0_data_master_dbs_write_16 => cpu_0_data_master_dbs_write_16,
      cpu_0_data_master_no_byte_enables_and_last_term => cpu_0_data_master_no_byte_enables_and_last_term,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_instruction_master_address_to_slave => cpu_0_instruction_master_address_to_slave,
      cpu_0_instruction_master_dbs_address => cpu_0_instruction_master_dbs_address,
      cpu_0_instruction_master_read => cpu_0_instruction_master_read,
      reset_n => clocks_0_sys_clk_out_reset_n,
      sram_0_avalon_sram_slave_readdata => sram_0_avalon_sram_slave_readdata,
      sram_0_avalon_sram_slave_readdatavalid => sram_0_avalon_sram_slave_readdatavalid
    );


  --the_sram_0, which is an e_ptf_instance
  the_sram_0 : sram_0
    port map(
      SRAM_ADDR => internal_SRAM_ADDR_from_the_sram_0,
      SRAM_CE_N => internal_SRAM_CE_N_from_the_sram_0,
      SRAM_DQ => SRAM_DQ_to_and_from_the_sram_0,
      SRAM_LB_N => internal_SRAM_LB_N_from_the_sram_0,
      SRAM_OE_N => internal_SRAM_OE_N_from_the_sram_0,
      SRAM_UB_N => internal_SRAM_UB_N_from_the_sram_0,
      SRAM_WE_N => internal_SRAM_WE_N_from_the_sram_0,
      readdata => sram_0_avalon_sram_slave_readdata,
      readdatavalid => sram_0_avalon_sram_slave_readdatavalid,
      address => sram_0_avalon_sram_slave_address,
      byteenable => sram_0_avalon_sram_slave_byteenable,
      clk => internal_clocks_0_sys_clk_out,
      read => sram_0_avalon_sram_slave_read,
      reset => sram_0_avalon_sram_slave_reset,
      write => sram_0_avalon_sram_slave_write,
      writedata => sram_0_avalon_sram_slave_writedata
    );


  --the_sysid_control_slave, which is an e_instance
  the_sysid_control_slave : sysid_control_slave_arbitrator
    port map(
      CPU_System_clock_1_out_granted_sysid_control_slave => CPU_System_clock_1_out_granted_sysid_control_slave,
      CPU_System_clock_1_out_qualified_request_sysid_control_slave => CPU_System_clock_1_out_qualified_request_sysid_control_slave,
      CPU_System_clock_1_out_read_data_valid_sysid_control_slave => CPU_System_clock_1_out_read_data_valid_sysid_control_slave,
      CPU_System_clock_1_out_requests_sysid_control_slave => CPU_System_clock_1_out_requests_sysid_control_slave,
      d1_sysid_control_slave_end_xfer => d1_sysid_control_slave_end_xfer,
      sysid_control_slave_address => sysid_control_slave_address,
      sysid_control_slave_readdata_from_sa => sysid_control_slave_readdata_from_sa,
      sysid_control_slave_reset_n => sysid_control_slave_reset_n,
      CPU_System_clock_1_out_address_to_slave => CPU_System_clock_1_out_address_to_slave,
      CPU_System_clock_1_out_nativeaddress => CPU_System_clock_1_out_nativeaddress,
      CPU_System_clock_1_out_read => CPU_System_clock_1_out_read,
      CPU_System_clock_1_out_write => CPU_System_clock_1_out_write,
      clk => clk_0,
      reset_n => clk_0_reset_n,
      sysid_control_slave_readdata => sysid_control_slave_readdata
    );


  --the_sysid, which is an e_ptf_instance
  the_sysid : sysid
    port map(
      readdata => sysid_control_slave_readdata,
      address => sysid_control_slave_address,
      clock => sysid_control_slave_clock,
      reset_n => sysid_control_slave_reset_n
    );


  --the_timer_system_s1, which is an e_instance
  the_timer_system_s1 : timer_system_s1_arbitrator
    port map(
      cpu_0_data_master_granted_timer_system_s1 => cpu_0_data_master_granted_timer_system_s1,
      cpu_0_data_master_qualified_request_timer_system_s1 => cpu_0_data_master_qualified_request_timer_system_s1,
      cpu_0_data_master_read_data_valid_timer_system_s1 => cpu_0_data_master_read_data_valid_timer_system_s1,
      cpu_0_data_master_requests_timer_system_s1 => cpu_0_data_master_requests_timer_system_s1,
      d1_timer_system_s1_end_xfer => d1_timer_system_s1_end_xfer,
      timer_system_s1_address => timer_system_s1_address,
      timer_system_s1_chipselect => timer_system_s1_chipselect,
      timer_system_s1_irq_from_sa => timer_system_s1_irq_from_sa,
      timer_system_s1_readdata_from_sa => timer_system_s1_readdata_from_sa,
      timer_system_s1_reset_n => timer_system_s1_reset_n,
      timer_system_s1_write_n => timer_system_s1_write_n,
      timer_system_s1_writedata => timer_system_s1_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clocks_0_sys_clk_out_reset_n,
      timer_system_s1_irq => timer_system_s1_irq,
      timer_system_s1_readdata => timer_system_s1_readdata
    );


  --the_timer_system, which is an e_ptf_instance
  the_timer_system : timer_system
    port map(
      irq => timer_system_s1_irq,
      readdata => timer_system_s1_readdata,
      address => timer_system_s1_address,
      chipselect => timer_system_s1_chipselect,
      clk => internal_clocks_0_sys_clk_out,
      reset_n => timer_system_s1_reset_n,
      write_n => timer_system_s1_write_n,
      writedata => timer_system_s1_writedata
    );


  --the_timer_timestamp_s1, which is an e_instance
  the_timer_timestamp_s1 : timer_timestamp_s1_arbitrator
    port map(
      cpu_0_data_master_granted_timer_timestamp_s1 => cpu_0_data_master_granted_timer_timestamp_s1,
      cpu_0_data_master_qualified_request_timer_timestamp_s1 => cpu_0_data_master_qualified_request_timer_timestamp_s1,
      cpu_0_data_master_read_data_valid_timer_timestamp_s1 => cpu_0_data_master_read_data_valid_timer_timestamp_s1,
      cpu_0_data_master_requests_timer_timestamp_s1 => cpu_0_data_master_requests_timer_timestamp_s1,
      d1_timer_timestamp_s1_end_xfer => d1_timer_timestamp_s1_end_xfer,
      timer_timestamp_s1_address => timer_timestamp_s1_address,
      timer_timestamp_s1_chipselect => timer_timestamp_s1_chipselect,
      timer_timestamp_s1_irq_from_sa => timer_timestamp_s1_irq_from_sa,
      timer_timestamp_s1_readdata_from_sa => timer_timestamp_s1_readdata_from_sa,
      timer_timestamp_s1_reset_n => timer_timestamp_s1_reset_n,
      timer_timestamp_s1_write_n => timer_timestamp_s1_write_n,
      timer_timestamp_s1_writedata => timer_timestamp_s1_writedata,
      clk => internal_clocks_0_sys_clk_out,
      cpu_0_data_master_address_to_slave => cpu_0_data_master_address_to_slave,
      cpu_0_data_master_read => cpu_0_data_master_read,
      cpu_0_data_master_waitrequest => cpu_0_data_master_waitrequest,
      cpu_0_data_master_write => cpu_0_data_master_write,
      cpu_0_data_master_writedata => cpu_0_data_master_writedata,
      reset_n => clocks_0_sys_clk_out_reset_n,
      timer_timestamp_s1_irq => timer_timestamp_s1_irq,
      timer_timestamp_s1_readdata => timer_timestamp_s1_readdata
    );


  --the_timer_timestamp, which is an e_ptf_instance
  the_timer_timestamp : timer_timestamp
    port map(
      irq => timer_timestamp_s1_irq,
      readdata => timer_timestamp_s1_readdata,
      address => timer_timestamp_s1_address,
      chipselect => timer_timestamp_s1_chipselect,
      clk => internal_clocks_0_sys_clk_out,
      reset_n => timer_timestamp_s1_reset_n,
      write_n => timer_timestamp_s1_write_n,
      writedata => timer_timestamp_s1_writedata
    );


  --reset is asserted asynchronously and deasserted synchronously
  CPU_System_reset_clocks_0_sys_clk_out_domain_synch : CPU_System_reset_clocks_0_sys_clk_out_domain_synch_module
    port map(
      data_out => clocks_0_sys_clk_out_reset_n,
      clk => internal_clocks_0_sys_clk_out,
      data_in => module_input6,
      reset_n => reset_n_sources
    );

  module_input6 <= std_logic'('1');

  --reset sources mux, which is an e_mux
  reset_n_sources <= Vector_To_Std_Logic(NOT ((((((std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(NOT reset_n))) OR std_logic_vector'("00000000000000000000000000000000")) OR std_logic_vector'("00000000000000000000000000000000")) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_resetrequest_from_sa)))) OR (std_logic_vector'("0000000000000000000000000000000") & (A_TOSTDLOGICVECTOR(cpu_0_jtag_debug_module_resetrequest_from_sa))))));
  --reset is asserted asynchronously and deasserted synchronously
  CPU_System_reset_clk_0_domain_synch : CPU_System_reset_clk_0_domain_synch_module
    port map(
      data_out => clk_0_reset_n,
      clk => clk_0,
      data_in => module_input7,
      reset_n => reset_n_sources
    );

  module_input7 <= std_logic'('1');

  --CPU_System_clock_0_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  CPU_System_clock_0_out_endofpacket <= std_logic'('0');
  --CPU_System_clock_1_out_endofpacket of type endofpacket does not connect to anything so wire it to default (0)
  CPU_System_clock_1_out_endofpacket <= std_logic'('0');
  --sysid_control_slave_clock of type clock does not connect to anything so wire it to default (0)
  sysid_control_slave_clock <= std_logic'('0');
  --vhdl renameroo for output signals
  LCD_E_from_the_lcd_0 <= internal_LCD_E_from_the_lcd_0;
  --vhdl renameroo for output signals
  LCD_RS_from_the_lcd_0 <= internal_LCD_RS_from_the_lcd_0;
  --vhdl renameroo for output signals
  LCD_RW_from_the_lcd_0 <= internal_LCD_RW_from_the_lcd_0;
  --vhdl renameroo for output signals
  SRAM_ADDR_from_the_sram_0 <= internal_SRAM_ADDR_from_the_sram_0;
  --vhdl renameroo for output signals
  SRAM_CE_N_from_the_sram_0 <= internal_SRAM_CE_N_from_the_sram_0;
  --vhdl renameroo for output signals
  SRAM_LB_N_from_the_sram_0 <= internal_SRAM_LB_N_from_the_sram_0;
  --vhdl renameroo for output signals
  SRAM_OE_N_from_the_sram_0 <= internal_SRAM_OE_N_from_the_sram_0;
  --vhdl renameroo for output signals
  SRAM_UB_N_from_the_sram_0 <= internal_SRAM_UB_N_from_the_sram_0;
  --vhdl renameroo for output signals
  SRAM_WE_N_from_the_sram_0 <= internal_SRAM_WE_N_from_the_sram_0;
  --vhdl renameroo for output signals
  clocks_0_sys_clk_out <= internal_clocks_0_sys_clk_out;
  --vhdl renameroo for output signals
  out_port_from_the_pio_output_0 <= internal_out_port_from_the_pio_output_0;
  --vhdl renameroo for output signals
  out_port_from_the_pio_output_1 <= internal_out_port_from_the_pio_output_1;

end europa;


--synthesis translate_off

library altera;
use altera.altera_europa_support_lib.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;



-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your libraries here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>

entity test_bench is 
end entity test_bench;


architecture europa of test_bench is
component CPU_System is 
           port (
                 -- 1) global signals:
                    signal clk_0 : IN STD_LOGIC;
                    signal clocks_0_sys_clk_out : OUT STD_LOGIC;
                    signal reset_n : IN STD_LOGIC;

                 -- the_lcd_0
                    signal LCD_E_from_the_lcd_0 : OUT STD_LOGIC;
                    signal LCD_RS_from_the_lcd_0 : OUT STD_LOGIC;
                    signal LCD_RW_from_the_lcd_0 : OUT STD_LOGIC;
                    signal LCD_data_to_and_from_the_lcd_0 : INOUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_pio_input_0
                    signal in_port_to_the_pio_input_0 : IN STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_pio_output_0
                    signal out_port_from_the_pio_output_0 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_pio_output_1
                    signal out_port_from_the_pio_output_1 : OUT STD_LOGIC_VECTOR (7 DOWNTO 0);

                 -- the_sram_0
                    signal SRAM_ADDR_from_the_sram_0 : OUT STD_LOGIC_VECTOR (17 DOWNTO 0);
                    signal SRAM_CE_N_from_the_sram_0 : OUT STD_LOGIC;
                    signal SRAM_DQ_to_and_from_the_sram_0 : INOUT STD_LOGIC_VECTOR (15 DOWNTO 0);
                    signal SRAM_LB_N_from_the_sram_0 : OUT STD_LOGIC;
                    signal SRAM_OE_N_from_the_sram_0 : OUT STD_LOGIC;
                    signal SRAM_UB_N_from_the_sram_0 : OUT STD_LOGIC;
                    signal SRAM_WE_N_from_the_sram_0 : OUT STD_LOGIC
                 );
end component CPU_System;

                signal CPU_System_clock_0_in_endofpacket_from_sa :  STD_LOGIC;
                signal CPU_System_clock_0_out_endofpacket :  STD_LOGIC;
                signal CPU_System_clock_0_out_nativeaddress :  STD_LOGIC;
                signal CPU_System_clock_1_in_endofpacket_from_sa :  STD_LOGIC;
                signal CPU_System_clock_1_out_endofpacket :  STD_LOGIC;
                signal LCD_E_from_the_lcd_0 :  STD_LOGIC;
                signal LCD_RS_from_the_lcd_0 :  STD_LOGIC;
                signal LCD_RW_from_the_lcd_0 :  STD_LOGIC;
                signal LCD_data_to_and_from_the_lcd_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal SRAM_ADDR_from_the_sram_0 :  STD_LOGIC_VECTOR (17 DOWNTO 0);
                signal SRAM_CE_N_from_the_sram_0 :  STD_LOGIC;
                signal SRAM_DQ_to_and_from_the_sram_0 :  STD_LOGIC_VECTOR (15 DOWNTO 0);
                signal SRAM_LB_N_from_the_sram_0 :  STD_LOGIC;
                signal SRAM_OE_N_from_the_sram_0 :  STD_LOGIC;
                signal SRAM_UB_N_from_the_sram_0 :  STD_LOGIC;
                signal SRAM_WE_N_from_the_sram_0 :  STD_LOGIC;
                signal clk :  STD_LOGIC;
                signal clk_0 :  STD_LOGIC;
                signal clocks_0_sys_clk_out :  STD_LOGIC;
                signal in_port_to_the_pio_input_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal jtag_uart_0_avalon_jtag_slave_dataavailable_from_sa :  STD_LOGIC;
                signal jtag_uart_0_avalon_jtag_slave_readyfordata_from_sa :  STD_LOGIC;
                signal out_port_from_the_pio_output_0 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal out_port_from_the_pio_output_1 :  STD_LOGIC_VECTOR (7 DOWNTO 0);
                signal reset_n :  STD_LOGIC;
                signal sysid_control_slave_clock :  STD_LOGIC;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add your component and signal declaration here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


begin

  --Set us up the Dut
  DUT : CPU_System
    port map(
      LCD_E_from_the_lcd_0 => LCD_E_from_the_lcd_0,
      LCD_RS_from_the_lcd_0 => LCD_RS_from_the_lcd_0,
      LCD_RW_from_the_lcd_0 => LCD_RW_from_the_lcd_0,
      LCD_data_to_and_from_the_lcd_0 => LCD_data_to_and_from_the_lcd_0,
      SRAM_ADDR_from_the_sram_0 => SRAM_ADDR_from_the_sram_0,
      SRAM_CE_N_from_the_sram_0 => SRAM_CE_N_from_the_sram_0,
      SRAM_DQ_to_and_from_the_sram_0 => SRAM_DQ_to_and_from_the_sram_0,
      SRAM_LB_N_from_the_sram_0 => SRAM_LB_N_from_the_sram_0,
      SRAM_OE_N_from_the_sram_0 => SRAM_OE_N_from_the_sram_0,
      SRAM_UB_N_from_the_sram_0 => SRAM_UB_N_from_the_sram_0,
      SRAM_WE_N_from_the_sram_0 => SRAM_WE_N_from_the_sram_0,
      clocks_0_sys_clk_out => clocks_0_sys_clk_out,
      out_port_from_the_pio_output_0 => out_port_from_the_pio_output_0,
      out_port_from_the_pio_output_1 => out_port_from_the_pio_output_1,
      clk_0 => clk_0,
      in_port_to_the_pio_input_0 => in_port_to_the_pio_input_0,
      reset_n => reset_n
    );


  process
  begin
    clk_0 <= '0';
    loop
       wait for 10 ns;
       clk_0 <= not clk_0;
    end loop;
  end process;
  PROCESS
    BEGIN
       reset_n <= '0';
       wait for 200 ns;
       reset_n <= '1'; 
    WAIT;
  END PROCESS;


-- <ALTERA_NOTE> CODE INSERTED BETWEEN HERE
--add additional architecture here
-- AND HERE WILL BE PRESERVED </ALTERA_NOTE>


end europa;



--synthesis translate_on
