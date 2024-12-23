transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed/Mul4x2_2x2Matrix.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed/Mul4bit.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed/Mul2vector.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/RTL/main_signed/AddNbitSigned.v}

vlog -sv -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/Synth/../RTL/main_signed {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240409/Project/Signed/Synth/../RTL/main_signed/TB_Mul4x2_2x2Matrix.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  TB_Mul4x2_2x2Matrix

add wave *
view structure
view signals
run -all
