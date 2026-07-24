load_file IdVg_Fwd1_afet_des.plt -name Fwd1
load_file IdVg_Rev_afet_des.plt  -name Rev
load_file IdVg_Fwd2_afet_des.plt -name Fwd2

set v_axis "gate OuterVoltage"
set i_axis "drain TotalCurrent"

create_plot -1d -name IdVg_Hysteresis_Plot

if {[lsearch [list_variables -dataset Fwd1] $v_axis] != -1} {
    
    create_curve -plot IdVg_Hysteresis_Plot -dataset Fwd1 -axisX $v_axis -axisY $i_axis -name "0V to 3V"
    create_curve -plot IdVg_Hysteresis_Plot -dataset Rev  -axisX $v_axis -axisY $i_axis -name "3V to -3V"
    create_curve -plot IdVg_Hysteresis_Plot -dataset Fwd2 -axisX $v_axis -axisY $i_axis -name "-3V to 3V"

    set_axis_prop -plot IdVg_Hysteresis_Plot -axis y -type log
    set_curve_prop "0V to 3V"  -plot IdVg_Hysteresis_Plot -color blue -line_style solid -line_width 2
    set_curve_prop "3V to -3V" -plot IdVg_Hysteresis_Plot -color red  -line_style solid -line_width 2
    set_curve_prop "-3V to 3V" -plot IdVg_Hysteresis_Plot -color green -line_style solid -line_width 2
    
    set_best_look {IdVg_Hysteresis_Plot}

} else {
    echo "ERROR: Data variables not found. Check sdevice log for convergence failures."
}

if {[list_curves -plot IdVg_Hysteresis_Plot "3V to -3V"] != ""} {
    set Vth_fwd [calculate "0V to 3V"  -plot IdVg_Hysteresis_Plot -op vth]
    set Vth_rev [calculate "3V to -3V" -plot IdVg_Hysteresis_Plot -op vth]
    echo "Memory Window: [expr abs($Vth_fwd - $Vth_rev)] V"
}

load_file afet_des.tdr -name FeFET_3D
create_plot -dataset FeFET_3D -name Structure_Plot

set_material_prop Oxide -plot Structure_Plot -off

set_field_prop ElectrostaticPotential -plot Structure_Plot -show_bands -on

set_vector_prop Polarization-V -plot Structure_Plot -show -on -scale grid -scale_factor_grid 0.5



