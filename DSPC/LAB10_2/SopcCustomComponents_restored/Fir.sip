set_global_assignment -entity "Fir" -library "lib_Fir" -name IP_TOOL_NAME "altera_fir_compiler_ii"
set_global_assignment -entity "Fir" -library "lib_Fir" -name IP_TOOL_VERSION "12.1"
set_global_assignment -entity "Fir" -library "lib_Fir" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_Fir" -name SPD_FILE [file join $::quartus(sip_path) "Fir.spd"]

set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/altera_avalon_sc_fifo.v"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_math_pkg_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_lib_pkg_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_avalon_streaming_controller_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_avalon_streaming_sink_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_avalon_streaming_source_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/auk_dspip_roundsat_hpfir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/dspba_library_package.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/dspba_library.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_rtl.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_ast.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_nativelink.tcl"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_msim.tcl"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_tb.vhd"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_mlab.m"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_model.m"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_coef_int.txt"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_input.txt"]
set_global_assignment -library "lib_Fir" -name MISC_FILE [file join $::quartus(sip_path) "Fir_sim/Fir_param.txt"]
