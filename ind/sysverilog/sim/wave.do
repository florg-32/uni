onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /avmm_mem_tb/th/uut/clk
add wave -noupdate /avmm_mem_tb/th/uut/rst_n
add wave -noupdate /avmm_mem_tb/th/uut/address
add wave -noupdate /avmm_mem_tb/th/uut/write
add wave -noupdate /avmm_mem_tb/th/uut/read
add wave -noupdate /avmm_mem_tb/th/uut/writedata
add wave -noupdate /avmm_mem_tb/th/uut/readdata
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {45752 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {1144500 ps}
