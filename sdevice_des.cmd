File {
    Grid      = "n1_msh.tdr"
    Plot      = "afet_des.tdr"
    Current   = "afet_des.plt"
    Parameter = "sdevice.par"
    Output    = "afet_des.log"
}

Electrode {
    { Name="source" Voltage=0.0 }
    { Name="drain"  Voltage=0.0 }
    { Name="gate"   Voltage=0.0 Barrier=-0.55 } # Adjust Barrier for TiN workfunction if needed
}

Physics {
    Mobility( DopingDependence HighFieldSaturation Enormal )
    EffectiveIntrinsicDensity( OldSlotboom )
    Recombination( SRH(DopingDependence) )
}

# Activate Ferroelectric Polarization for the HZO Region
Physics (Region="R.HZO") {
    Polarization(Memory=20)
}

Plot {
    eDensity hDensity eCurrent hCurrent
    Potential SpaceCharge ElectricField
    eMobility hMobility eVelocity hVelocity
    Doping DonorConcentration AcceptorConcentration
    # Save the polarization vector to visualize the ferroelectric domains
    Polarization/Vector 
}

Math {
    Extrapolate
    Derivatives
    Iterations=20
    NotDamped=100
    Method=ILS
}

Solve {
    #- Initial solution with Line Search Damping to aid ferroelectric convergence
    Coupled (Iterations=100 LineSearchDamping=1e-4) { Poisson }
    Coupled { Poisson Electron Hole }

    #- Step 1: Ramp Drain Voltage to 0.05V (Linear Region)
    NewCurrentPrefix="Vd_"
    Quasistationary (
        InitialStep=0.01 MaxStep=0.1 MinStep=1e-5
        Goal { Name="drain" Voltage=0.05 }
    ) { Coupled { Poisson Electron Hole } }

    #- Step 2: Hysteresis Sweep (0V -> 3V)
    NewCurrentPrefix="IdVg_Fwd1_"
    Quasistationary (
        InitialStep=0.01 MaxStep=0.05 MinStep=1e-5
        Goal { Name="gate" Voltage=3.0 }
    ) { Coupled { Poisson Electron Hole } }

    #- Step 3: Hysteresis Sweep (3V -> -3V)
    NewCurrentPrefix="IdVg_Rev_"
    Quasistationary (
        InitialStep=0.01 MaxStep=0.05 MinStep=1e-5
        Goal { Name="gate" Voltage=-3.0 }
    ) { Coupled { Poisson Electron Hole } }

    #- Step 4: Hysteresis Sweep (-3V -> 3V)
    NewCurrentPrefix="IdVg_Fwd2_"
    Quasistationary (
        InitialStep=0.01 MaxStep=0.05 MinStep=1e-5
        Goal { Name="gate" Voltage=3.0 }
    ) { Coupled { Poisson Electron Hole } }
}
