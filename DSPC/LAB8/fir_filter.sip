set_global_assignment -entity "fir_filter" -library "lib_fir_filter" -name IP_TOOL_NAME "altera_fir_compiler_ii"
set_global_assignment -entity "fir_filter" -library "lib_fir_filter" -name IP_TOOL_VERSION "12.1"
set_global_assignment -entity "fir_filter" -library "lib_fir_filter" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_fir_filter" -name SPD_FILE [file join $::quartus(sip_path) "fir_filter.spd"]

set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_math_pkg_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_lib_pkg_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/auk_dspip_roundsat_hpfir.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/dspba_library.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_rtl.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_ast.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_nativelink.tcl"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_msim.tcl"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_tb.vhd"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_mlab.m"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_model.m"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_coef_int.txt"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_input.txt"]
set_global_assignment -library "lib_fir_filter" -name MISC_FILE [file join $::quartus(sip_path) "fir_filter_sim/fir_filter_param.txt"]
