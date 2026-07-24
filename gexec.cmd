# project name
name g_workbench2.dtu.ac.in_28163_0.tmp
# execution graph
job 3   -post { extract_vars "$nodedir" n3_vis.out 3 }  -o n3_vis "svisual n3_vis.tcl"
job 1   -post { extract_vars "$nodedir" n1_dvs.out 1 }  -o n1_dvs "sde -l n1_dvs.cmd"
job 2   -post { extract_vars "$nodedir" n2_des.out 2 }  -o n2_des "sdevice pp2_des.cmd"
check sde_dvs.cmd 1784635947
check sdevice_des.cmd 1784895305
check sdevice.par 1784635941
check svisual_vis.tcl 1784895747
check global_tooldb 1643313649
check gtree.dat 1784286051
# included files
