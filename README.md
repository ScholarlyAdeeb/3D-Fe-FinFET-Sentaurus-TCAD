================================================================================
        3D FERROELECTRIC FINFET (Fe-FinFET) SIMULATION PROJECT
================================================================================

Author  : Mohammed Adeeb Khan
Institute : Delhi Technological University (DTU)
Project : Research Internship
Toolchain : Synopsys Sentaurus TCAD (SDE, SDevice, SVisual)

================================================================================
PROJECT OVERVIEW
================================================================================

This repository contains the complete Sentaurus TCAD workflow for designing,
simulating, and analyzing a three-dimensional Ferroelectric FinFET (Fe-FinFET)
using Hafnium Zirconium Oxide (HZO) as the ferroelectric gate dielectric.

The project was carried out as part of my research internship with the objective
of understanding ferroelectric field-effect transistors, device-level simulation,
and the complete TCAD design workflow using Synopsys Sentaurus.

The repository documents not only the final implementation but also the complete
engineering and debugging journey—from learning Sentaurus from scratch to
integrating ferroelectric polarization models and analyzing simulation results.

================================================================================
PROJECT OBJECTIVES
================================================================================

• Learn the complete Synopsys Sentaurus TCAD workflow.
• Design a 3D SOI-based Ferroelectric FinFET.
• Integrate HZO ferroelectric material into the gate stack.
• Configure ferroelectric polarization models.
• Study the electrical behavior of the device.
• Understand hysteresis behavior in ferroelectric materials.
• Gain hands-on experience with semiconductor device simulation.

================================================================================
PROJECT STRUCTURE
================================================================================

Master Simulation Files

    sde_dvs.cmd
        Main Sentaurus Structure Editor script.

    sdevice_des.cmd
        Device simulation and electrical solver.

    svisual_vis.tcl
        Automated visualization and post-processing.

Material Parameter Files

    sdevice.par
        Global simulation parameters.

    Insulator1.par
        Ferroelectric material parameters.

    Silicon.par
        Silicon material properties.

Workbench Files

    gtree.dat
    gvars.dat
    .project

These files define the Sentaurus Workbench project tree and simulation flow.

Documentation

    README.md
    README.txt
    Reports
    Figures
    Screenshots

================================================================================
SIMULATION WORKFLOW
================================================================================

Step 1
-------
Create the complete 3D geometry using Sentaurus Structure Editor.

↓

Step 2
-------
Generate an optimized mesh.

↓

Step 3
-------
Assign materials, contacts, and doping profiles.

↓

Step 4
-------
Configure semiconductor and ferroelectric physics.

↓

Step 5
-------
Run electrical simulations using SDevice.

↓

Step 6
-------
Visualize and analyze the results using Sentaurus Visual.

================================================================================
FILE EXPLANATION
================================================================================

1. sde_dvs.cmd

Responsible for constructing the complete device geometry.

Major Commands

(sde:clear)

    Clears the previous geometry before generating a new structure.

------------------------------------------------------------

(sdegeo:set-default-boolean "ABA")

Controls Boolean operations while creating overlapping regions.

------------------------------------------------------------

(sdegeo:create-cuboid ...)

Creates

• Silicon Fin
• Source
• Drain
• BOX
• Gate Oxide
• HZO Layer
• Metal Gate

------------------------------------------------------------

(sdegeo:define-contact-set ...)

Creates logical contacts

• Source
• Drain
• Gate
• Substrate

------------------------------------------------------------

(sdedr:define-refinement-size ...)

Defines mesh refinement windows for improved numerical accuracy.

================================================================================

2. sdevice_des.cmd

Performs the complete electrical simulation.

Main Sections

File { }

Loads

• Mesh
• Output files
• Current files
• Log files

------------------------------------------------------------

Electrode { }

Defines electrical contacts and work functions.

------------------------------------------------------------

Physics

Activates

• Mobility Models
• Recombination Models
• Intrinsic Carrier Models
• Ferroelectric Polarization

Example

Physics (Region="R.HZO")
{
    Polarization(Memory=20)
}

The Memory parameter enables history-dependent polarization switching.

------------------------------------------------------------

Math

Contains numerical solver controls.

Examples

• Line Search Damping
• Iteration Control
• Convergence Settings

------------------------------------------------------------

Solve

Executes sequential voltage sweeps

0 V → +3 V

+3 V → -3 V

-3 V → +3 V

These sweeps are intended to observe hysteresis behavior.

================================================================================

3. svisual_vis.tcl

Automates visualization.

Major Functions

load_file

Loads simulation output.

------------------------------------------------------------

create_plot

Creates electrical plots.

------------------------------------------------------------

create_curve

Plots

Id-Vg

Id-Vd

Transfer Characteristics

------------------------------------------------------------

calculate

Automatically extracts

• Threshold Voltage

• Other electrical parameters

------------------------------------------------------------

set_vector_prop Polarization-V

Displays polarization vectors inside the HZO region.

================================================================================
DEVICE ARCHITECTURE
================================================================================

Device Type

3D SOI Ferroelectric FinFET

Gate Stack

Metal Gate

↓

HZO Ferroelectric Layer

↓

High-k Dielectric

↓

Interfacial Oxide

↓

Silicon Fin

↓

Buried Oxide

↓

Silicon Substrate

================================================================================
KEY FEATURES
================================================================================

• Fully parameterized Sentaurus project

• 3D geometry generation

• Automated meshing

• Ferroelectric polarization model

• Electrical characteristic extraction

• Threshold voltage extraction

• Polarization visualization

• Modular project structure

• Easy customization for future work

================================================================================
CHALLENGES FACED DURING DEVELOPMENT
================================================================================

This repository documents the complete engineering journey rather than only the
final implementation.

Major challenges included

• Learning Synopsys Sentaurus from scratch.

• Understanding Scheme scripting.

• Building a complex 3D FinFET geometry.

• Defining Boolean operations correctly.

• Assigning materials to multiple regions.

• Creating proper contact definitions.

• Debugging mesh generation issues.

• Understanding convergence failures.

• Configuring the ferroelectric Preisach model.

• Preparing custom parameter files.

• Investigating polarization behavior.

• Understanding differences between Quasistationary and Transient simulations.

Every major issue encountered during development has been documented through
incremental commits and repository updates.

================================================================================
LEARNING OUTCOMES
================================================================================

Through this project I gained practical experience in

• Synopsys Sentaurus TCAD

• Semiconductor device physics

• Ferroelectric memory devices

• Numerical simulation

• TCAD debugging

• Device modeling

• Scientific documentation

• Version control using Git and GitHub

• Research methodology

================================================================================
CURRENT STATUS
================================================================================

The repository successfully demonstrates

• 3D Fe-FinFET construction

• Material definition

• Device meshing

• Physics configuration

• Electrical simulation workflow

• Ferroelectric model integration

The project also documents the investigation of ferroelectric polarization
behavior and serves as a strong foundation for future research involving
transient switching analysis and advanced ferroelectric device optimization.

================================================================================
FUTURE WORK
================================================================================

Potential future improvements include

• Transient pulse-based ferroelectric simulations.

• Preisach parameter calibration using experimental HZO data.

• Landau-Khalatnikov ferroelectric modeling.

• Optimization of gate stack dimensions.

• Reliability and endurance analysis.

• Retention and fatigue studies.

• Neuromorphic computing applications.

• Multi-level memory behavior.

• Comparison with conventional FinFET devices.

• Process variation analysis.

• AI-assisted parameter optimization.

================================================================================
GITHUB COMMIT HISTORY
================================================================================

The commit history reflects the iterative research and development process,
capturing each stage of the project—from initial device construction and TCAD
setup to debugging, physics integration, and final documentation. Rather than
representing only a finished result, it serves as a record of the engineering
decisions, challenges, and incremental improvements made throughout the
internship.

================================================================================
ACKNOWLEDGEMENTS
================================================================================

I would like to express my sincere gratitude to my research mentor for providing
continuous guidance throughout the internship. I also thank the Department of
Electrical Engineering, Delhi Technological University, for providing the
opportunity to work on semiconductor device simulation using Synopsys
Sentaurus TCAD.

================================================================================
DISCLAIMER
================================================================================

This repository is intended for educational and research purposes only.

The project focuses on understanding and implementing ferroelectric device
simulation workflows within Synopsys Sentaurus TCAD. Some aspects of advanced
ferroelectric behavior remain active research topics and may require additional
calibration or experimental validation for production-level accuracy.

================================================================================
END OF README
================================================================================
