# TCL File Generated by Component Editor 12.1
# Wed Mar 06 10:37:16 CET 2013
# DO NOT MODIFY


# 
# iis2st_hw "iis2st_hw" v1.0
# null 2013.03.06.10:37:16
# 
# 

# 
# request TCL package from ACDS 11.0
# 
package require -exact sopc 11.0


# 
# module iis2st_hw
# 
set_module_property NAME iis2st_hw
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP IHA
set_module_property DISPLAY_NAME iis2st_hw
set_module_property TOP_LEVEL_HDL_FILE iis2st_rtl.vhd
set_module_property TOP_LEVEL_HDL_MODULE iis2st_rtl
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property STATIC_TOP_LEVEL_MODULE_NAME iis2st_rtl
set_module_property FIX_110_VIP_PATH false
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false


# 
# files
# 
add_file iis2st.vhd {SYNTHESIS SIMULATION}
add_file iis2st_rtl.vhd {SYNTHESIS SIMULATION}


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
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock_12M
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true

add_interface_port reset reset_n reset_n Input 1


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock_12M
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 24
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 0
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true

add_interface_port avalon_streaming_sink ast_sink_data data Input 24
add_interface_port avalon_streaming_sink ast_sink_ready ready Output 1
add_interface_port avalon_streaming_sink ast_sink_valid valid Input 1
add_interface_port avalon_streaming_sink ast_sink_error error Input 2


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock_12M
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 24
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 0
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true

add_interface_port avalon_streaming_source ast_source_ready ready Input 1
add_interface_port avalon_streaming_source ast_source_valid valid Output 1
add_interface_port avalon_streaming_source ast_source_error error Output 2
add_interface_port avalon_streaming_source ast_source_data data Output 24


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true

add_interface_port conduit_end bitclk export Input 1
add_interface_port conduit_end adcdat export Input 1
add_interface_port conduit_end dacdat export Output 1
add_interface_port conduit_end adclrck export Input 1
add_interface_port conduit_end daclrck export Input 1


# 
# connection point clock_12M
# 
add_interface clock_12M clock end
set_interface_property clock_12M clockRate 0
set_interface_property clock_12M ENABLED true

add_interface_port clock_12M clk clk Input 1


# 
# connection point clock_48k
# 
add_interface clock_48k clock end
set_interface_property clock_48k clockRate 0
set_interface_property clock_48k ENABLED true

