onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /playsoundandram_tb/clk
add wave -noupdate /playsoundandram_tb/reset_n
add wave -noupdate /playsoundandram_tb/CS0
add wave -noupdate /playsoundandram_tb/CS1
add wave -noupdate /playsoundandram_tb/writeAddr
add wave -noupdate /playsoundandram_tb/readAddr
add wave -noupdate -radix decimal /playsoundandram_tb/writedata
add wave -noupdate -radix decimal /playsoundandram_tb/readData
add wave -noupdate /playsoundandram_tb/ram_to_play
add wave -noupdate -radix decimal /playsoundandram_tb/ramSamples_to_read
add wave -noupdate /playsoundandram_tb/addr
add wave -noupdate -radix decimal /playsoundandram_tb/data
add wave -noupdate /playsoundandram_tb/ram_CS
add wave -noupdate /playsoundandram_tb/ast_clk
add wave -noupdate -radix decimal /playsoundandram_tb/ast_source_data
add wave -noupdate /playsoundandram_tb/ast_source_ready
add wave -noupdate /playsoundandram_tb/ast_source_valid
add wave -noupdate /playsoundandram_tb/PS/cs1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2528619 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 235
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {3675 ns}
