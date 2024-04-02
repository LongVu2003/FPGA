transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/LAB_FPGA/SO_ML/RTL/main {D:/LAB_FPGA/SO_ML/RTL/main/Mul4bit.v}
vlog -vlog01compat -work work +incdir+D:/LAB_FPGA/SO_ML/RTL/main {D:/LAB_FPGA/SO_ML/RTL/main/adder8bit.v}
vlog -vlog01compat -work work +incdir+D:/LAB_FPGA/SO_ML/RTL/main {D:/LAB_FPGA/SO_ML/RTL/main/Mul2vector.v}
vlog -vlog01compat -work work +incdir+D:/LAB_FPGA/SO_ML/RTL/main {D:/LAB_FPGA/SO_ML/RTL/main/Mul4x2_2x2Matrix.v}

vlog -sv -work work +incdir+D:/LAB_FPGA/SO_ML/Synth/../RTL/main {D:/LAB_FPGA/SO_ML/Synth/../RTL/main/TB_Mul4x2_2x2Matrix.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_Mul4x2_2x2Matrix

add wave *
view structure
view signals
run -all
