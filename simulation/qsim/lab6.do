onerror {quit -f}
vlib work
vlog -work work lab6.vo
vlog -work work lab6.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.decode_vlg_vec_tst
vcd file -direction lab6.msim.vcd
vcd add -internal decode_vlg_vec_tst/*
vcd add -internal decode_vlg_vec_tst/i1/*
add wave /*
run -all
