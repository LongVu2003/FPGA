transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL/Mul4x2_2x2Matrix.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL/vadd.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL/qmult.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/RTL/Mul2vector.v}

vlog -sv -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/Synth/../RTL {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/D21_DoanLongVu/FPGA/240413/Project/Synth/../RTL/TB_Mul4x2_2x2Matrix.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_Mul4x2_2x2Matrix

add wave *
view structure
view signals
run -all
