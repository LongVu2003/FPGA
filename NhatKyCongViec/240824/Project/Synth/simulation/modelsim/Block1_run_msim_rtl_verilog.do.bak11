transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/RTL/Des {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/RTL/Des/fxp_zoom.v}
vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/RTL/Des {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/RTL/Des/fxp_div_pipe.v}

vlog -vlog01compat -work work +incdir+C:/Users/DELL/OneDrive\ -\ ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/Synth/../RTL/Tb {C:/Users/DELL/OneDrive - ptit.edu.vn/Documents/FPGA/NhatKyCongViec/240824/Project/Synth/../RTL/Tb/tb_fxp_div_pipe.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  tb_fxp_div_pipe

add wave *
view structure
view signals
run -all
