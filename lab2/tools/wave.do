onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/arithmetic_if/clk
add wave -noupdate /top/arithmetic_if/reset_n
add wave -noupdate /top/arithmetic_if/load_en
add wave -noupdate -radix decimal /top/arithmetic_if/write_pointer
add wave -noupdate /top/arithmetic_if/opcode
add wave -noupdate /top/arithmetic_if/operand_a
add wave -noupdate /top/arithmetic_if/operand_b
add wave -noupdate -radix decimal /top/arithmetic_if/read_pointer
add wave -noupdate /top/arithmetic_if/instruction_word
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ns} 0}
configure wave -namecolwidth 235
configure wave -valuecolwidth 99
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
WaveRestoreZoom {0 ns} {118 ns}
