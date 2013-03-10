# TCL File Generated by Component Editor 12.1
# Mon Feb 25 11:53:56 CET 2013
# DO NOT MODIFY


# 
# mm_bus_counter "Counter" v1.0
# Kim Bjerge 2013.02.25.11:53:56
# 
# 

# 
# request TCL package from ACDS 11.0
# 
package require -exact sopc 11.0


# 
# module mm_bus_counter
# 
set_module_property NAME mm_bus_counter
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP IHA
set_module_property AUTHOR "Kim Bjerge"
set_module_property DISPLAY_NAME Counter
set_module_property TOP_LEVEL_HDL_FILE mm_bus_counter.vhd
set_module_property TOP_LEVEL_HDL_MODULE mm_bus_counter
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property STATIC_TOP_LEVEL_MODULE_NAME mm_bus_counter
set_module_property FIX_110_VIP_PATH false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# files
# 
add_file mm_bus_counter.vhd {SYNTHESIS SIMULATION}


# 
# file sets
# 

# 
# parameters
# 


# 
# display items
# 


# 
# connection point clockreset
# 
add_interface clockreset clock end
set_interface_property clockreset clockRate 0
set_interface_property clockreset ENABLED true

add_interface_port clockreset csi_clockreset_clk clk Input 1


# 
# connection point clockreset_reset
# 
add_interface clockreset_reset reset end
set_interface_property clockreset_reset associatedClock clockreset
set_interface_property clockreset_reset synchronousEdges DEASSERT
set_interface_property clockreset_reset ENABLED true

add_interface_port clockreset_reset csi_clockreset_reset_n reset_n Input 1


# 
# connection point s1
# 
add_interface s1 avalon end
set_interface_property s1 addressAlignment DYNAMIC
set_interface_property s1 addressUnits WORDS
set_interface_property s1 associatedClock clockreset
set_interface_property s1 burstOnBurstBoundariesOnly false
set_interface_property s1 explicitAddressSpan 0
set_interface_property s1 holdTime 0
set_interface_property s1 isMemoryDevice false
set_interface_property s1 isNonVolatileStorage false
set_interface_property s1 linewrapBursts false
set_interface_property s1 maximumPendingReadTransactions 0
set_interface_property s1 printableDevice false
set_interface_property s1 readLatency 0
set_interface_property s1 readWaitTime 1
set_interface_property s1 setupTime 0
set_interface_property s1 timingUnits Cycles
set_interface_property s1 writeWaitTime 0
set_interface_property s1 ENABLED true

add_interface_port s1 avs_s1_write write Input 1
add_interface_port s1 avs_s1_read read Input 1
add_interface_port s1 avs_s1_chipselect chipselect Input 1
add_interface_port s1 avs_s1_address address Input 8
add_interface_port s1 avs_s1_writedata writedata Input 16
add_interface_port s1 avs_s1_readdata readdata Output 16
set_interface_assignment s1 embeddedsw.configuration.isFlash 0
set_interface_assignment s1 embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment s1 embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment s1 embeddedsw.configuration.isPrintableDevice 0


# 
# connection point irq0
# 
add_interface irq0 interrupt end
set_interface_property irq0 associatedAddressablePoint s1
set_interface_property irq0 associatedClock clockreset
set_interface_property irq0 associatedReset clockreset_reset
set_interface_property irq0 ENABLED true

add_interface_port irq0 ins_irq0_irq irq Output 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock clockreset
set_interface_property conduit_end associatedReset clockreset_reset
set_interface_property conduit_end ENABLED true

add_interface_port conduit_end input_counter export Input 1
add_interface_port conduit_end input_irq export Input 1

