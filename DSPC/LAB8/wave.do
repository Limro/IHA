onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /iis2st_tb/reset_n
add wave -noupdate /iis2st_tb/coeff_in_clk
add wave -noupdate /iis2st_tb/coeff_in_areset
add wave -noupdate /iis2st_tb/ast_sink_data
add wave -noupdate /iis2st_tb/ast_sink_ready
add wave -noupdate /iis2st_tb/ast_sink_valid
add wave -noupdate /iis2st_tb/ast_sink_error
add wave -noupdate /iis2st_tb/ast_source_data
add wave -noupdate /iis2st_tb/ast_source_ready
add wave -noupdate /iis2st_tb/ast_source_valid
add wave -noupdate /iis2st_tb/ast_source_error
add wave -noupdate /iis2st_tb/adcdat
add wave -noupdate /iis2st_tb/adclrck
add wave -noupdate /iis2st_tb/dacdat
add wave -noupdate /iis2st_tb/daclrck
add wave -noupdate /iis2st_tb/bitclk
add wave -noupdate /iis2st_tb/clk
add wave -noupdate /iis2st_tb/i2svalue
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {284 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
