# =============================================================
# 1. DATA LOADING AND INITIALIZATION
# =============================================================
# Loading the three sweep segments
load_file IdVg_Fwd1_afet_des.plt -name Fwd1
load_file IdVg_Rev_afet_des.plt  -name Rev
load_file IdVg_Fwd2_afet_des.plt -name Fwd2

# Define native variable names for standard electrodes
set v_axis "gate OuterVoltage"
set i_axis "drain TotalCurrent"

# =============================================================
# 2. 1D PLOTTING: Id-Vg HYSTERESIS LOOP
# =============================================================
create_plot -1d -name IdVg_Hysteresis_Plot

# Check if variables exist in Fwd1 before creating curves to avoid resolution errors
if {[lsearch [list_variables -dataset Fwd1] $v_axis] != -1} {
    
    # Create the forward and reverse curves
    create_curve -plot IdVg_Hysteresis_Plot -dataset Fwd1 -axisX $v_axis -axisY $i_axis -name "0V to 3V"
    create_curve -plot IdVg_Hysteresis_Plot -dataset Rev  -axisX $v_axis -axisY $i_axis -name "3V to -3V"
    create_curve -plot IdVg_Hysteresis_Plot -dataset Fwd2 -axisX $v_axis -axisY $i_axis -name "-3V to 3V"

    # Styling the curves (Now safe because curves are successfully created)
    set_axis_prop -plot IdVg_Hysteresis_Plot -axis y -type log
    set_curve_prop "0V to 3V"  -plot IdVg_Hysteresis_Plot -color blue -line_style solid -line_width 2
    set_curve_prop "3V to -3V" -plot IdVg_Hysteresis_Plot -color red  -line_style solid -line_width 2
    set_curve_prop "-3V to 3V" -plot IdVg_Hysteresis_Plot -color green -line_style solid -line_width 2
    
    # Apply 'Best Look' for optimal framing and labels
    set_best_look {IdVg_Hysteresis_Plot}

} else {
    echo "ERROR: Data variables not found. Check sdevice log for convergence failures."
}

# =============================================================
# 3. ANALYSIS PART: PARAMETER EXTRACTION
# =============================================================
# Extracting Threshold Voltages to determine the Memory Window
if {[list_curves -plot IdVg_Hysteresis_Plot "3V to -3V"] != ""} {
    set Vth_fwd [calculate "0V to 3V"  -plot IdVg_Hysteresis_Plot -op vth]
    set Vth_rev [calculate "3V to -3V" -plot IdVg_Hysteresis_Plot -op vth]
    echo "Memory Window: [expr abs($Vth_fwd - $Vth_rev)] V"
}

# =============================================================
# 4. 3D VISUALIZATION: STRUCTURE AND POLARIZATION
# =============================================================
load_file afet_des.tdr -name FeFET_3D
create_plot -dataset FeFET_3D -name Structure_Plot

# Hide the BOX (Oxide) to visualize internal fields within the Fin
set_material_prop Oxide -plot Structure_Plot -off

# Display Electrostatic Potential on the surface with contour bands
set_field_prop ElectrostaticPotential -plot Structure_Plot -show_bands -on

# Display the Polarization vector to visualize dipole switching (X, Y, and Z)
# Note: Requires 'Polarization/Vector' in the sdevice Plot section
set_vector_prop Polarization-V -plot Structure_Plot -show -on -scale grid -scale_factor_grid 0.5


