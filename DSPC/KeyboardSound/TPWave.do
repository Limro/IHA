onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /transferprotocol_tb/clk
add wave -noupdate /transferprotocol_tb/reset_n
add wave -noupdate /transferprotocol_tb/WE
add wave -noupdate /transferprotocol_tb/CS
add wave -noupdate -radix decimal /transferprotocol_tb/address
add wave -noupdate -radix decimal /transferprotocol_tb/writedata
add wave -noupdate /transferprotocol_tb/ram_Addr
add wave -noupdate -radix decimal /transferprotocol_tb/ram_Data
add wave -noupdate /transferprotocol_tb/ram_cs_module0
add wave -noupdate /transferprotocol_tb/ram_cs_module1
add wave -noupdate /transferprotocol_tb/ram_to_play
add wave -noupdate -radix decimal /transferprotocol_tb/ramSamples_to_read
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300227 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 243
configure wave -valuecolwidth 39
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
WaveRestoreZoom {0 ps} {315 ns}
