# 3D Ferroelectric FinFET (Fe-FinFET) Simulation using Synopsys Sentaurus TCAD

> A complete 3D TCAD workflow for designing, simulating, and analyzing a Ferroelectric FinFET (Fe-FinFET) using Hafnium Zirconium Oxide (HZO) as the ferroelectric gate dielectric.

---

## 📌 Overview

This repository contains the complete Synopsys Sentaurus TCAD project developed during my research internship for studying a **3D Ferroelectric FinFET (Fe-FinFET)**.

The project focuses on:

- Designing a 3D SOI FinFET
- Integrating an HZO ferroelectric gate stack
- Configuring ferroelectric polarization models
- Simulating electrical characteristics
- Understanding hysteresis behavior
- Learning the complete Sentaurus TCAD workflow

Unlike many repositories that only contain the final implementation, this project also documents the engineering decisions, debugging process, and lessons learned throughout development.

---

# 🖼 Device Structure

> **Replace with your final SDE structure screenshot**

<p align="center">
<img src="images/device_structure.png" width="750">
</p>

---

# 🚀 Features

- ✅ Fully Parameterized Sentaurus Project
- ✅ 3D SOI FinFET Geometry
- ✅ HZO Ferroelectric Gate Stack
- ✅ Automated Mesh Generation
- ✅ Ferroelectric Polarization Model
- ✅ Threshold Voltage Extraction
- ✅ Electrical Characteristic Simulation
- ✅ Automated Visualization using SVisual
- ✅ Modular Project Structure
- ✅ Research-Oriented Documentation

---

# 📂 Repository Structure

```text
.
├── sde_dvs.cmd              # Structure Editor
├── sdevice_des.cmd          # Device Simulation
├── sdevice.par              # Global Parameters
├── Insulator1.par           # Ferroelectric Material
├── Silicon.par              # Silicon Parameters
├── svisual_vis.tcl          # Visualization Script
├── images/                  # Figures used in README
├── reports/
└── README.md
```

---

# ⚙ Simulation Workflow

```text
Sentaurus Structure Editor (SDE)
                │
                ▼
        Geometry Creation
                │
                ▼
          Mesh Generation
                │
                ▼
     Sentaurus Device (SDevice)
                │
                ▼
 Electrical Characteristic Simulation
                │
                ▼
      Sentaurus Visual (SVisual)
                │
                ▼
      Result Analysis & Extraction
```

---

# 🏗 Device Architecture

The simulated device consists of:

- Silicon Fin
- Source & Drain
- Buried Oxide (BOX)
- Interfacial Oxide
- High-k Dielectric
- Hafnium Zirconium Oxide (HZO)
- Metal Gate

---

## 🖼 Gate Stack

> **Insert cross-sectional image of the gate stack**

<p align="center">
<img src="images/gate_stack.png" width="650">
</p>

---

# 📖 File Descriptions

## `sde_dvs.cmd`

Responsible for generating the complete 3D geometry.

Main operations include:

- Geometry creation
- Region definitions
- Boolean operations
- Contact assignment
- Mesh refinement

---

## `sdevice_des.cmd`

Performs semiconductor device simulation.

Major sections include:

- Physics Models
- Boundary Conditions
- Solver Configuration
- Voltage Sweeps
- Ferroelectric Polarization

Example:

```cpp
Physics (Region="R.HZO")
{
    Polarization(Memory=20)
}
```

---

## `sdevice.par`

Contains material properties including

- Saturation Polarization (Ps)
- Remnant Polarization (Pr)
- Coercive Field (Fc)

along with dielectric constants and ferroelectric model parameters.

---

## `svisual_vis.tcl`

Automates post-processing.

Functions include:

- Id-Vg Plotting
- Threshold Voltage Extraction
- Polarization Visualization
- Data Export

---

# 🔬 Physics Models

The simulation uses:

- Drift-Diffusion Transport
- Doping Dependent Mobility
- High Field Saturation
- SRH Recombination
- Old Slotboom Intrinsic Density
- Ferroelectric Preisach Model

---

# 📊 Simulation Results

## Device Mesh

> **Insert mesh screenshot**

<p align="center">
<img src="images/mesh.png" width="700">
</p>

---

## Potential Distribution

> **Insert electrostatic potential image**

<p align="center">
<img src="images/potential.png" width="700">
</p>

---

## Electric Field

> **Insert electric field contour**

<p align="center">
<img src="images/electric_field.png" width="700">
</p>

---

## Electron Concentration

> **Insert carrier concentration plot**

<p align="center">
<img src="images/electron_density.png" width="700">
</p>

---

## Transfer Characteristics (Id–Vg)

> **Insert Id-Vg curve**

<p align="center">
<img src="images/idvg.png" width="700">
</p>

---

## Polarization Visualization

> **Insert polarization vector screenshot**

<p align="center">
<img src="images/polarization.png" width="700">
</p>

---

# 🛠 Challenges Encountered

One of the primary objectives of this repository is to document the research and debugging process.

| Challenge | Description |
|------------|-------------|
| Learning Sentaurus | Built the complete project while learning TCAD from scratch |
| 3D Geometry | Constructed a complex SOI FinFET structure using Scheme scripting |
| Boolean Operations | Resolved overlapping region and geometry issues |
| Material Assignment | Correctly configured HZO and semiconductor regions |
| Mesh Generation | Optimized refinement windows for numerical stability |
| Solver Convergence | Tuned solver settings to improve convergence |
| Ferroelectric Modeling | Integrated the Preisach polarization model |
| Parameter Configuration | Prepared custom material parameter files |
| Polarization Analysis | Investigated polarization behavior and model limitations |

---

# 📚 Skills Gained

Throughout this project I gained practical experience in

- Synopsys Sentaurus TCAD
- Semiconductor Device Physics
- Ferroelectric Memory Devices
- Numerical Simulation
- Scientific Debugging
- Research Documentation
- Git & GitHub
- Version Control
- Technical Report Writing

---

# 📈 Current Status

The repository successfully demonstrates

- 3D Fe-FinFET Design
- Device Meshing
- Material Configuration
- Physics Setup
- Electrical Simulation Workflow
- Ferroelectric Model Integration

This project serves as a solid foundation for further research in ferroelectric transistors and non-volatile semiconductor devices.

---

# 🔮 Future Work

Potential extensions include:

- Transient Switching Simulations
- Landau-Khalatnikov Ferroelectric Model
- Preisach Model Calibration
- Endurance & Retention Analysis
- Multi-Level Memory Simulation
- Neuromorphic Computing Applications
- Device Scaling Studies
- Reliability Analysis
- AI-Based Parameter Optimization

---

# 📜 Research Journey

Rather than presenting only the final implementation, this repository captures the complete development journey.

The Git commit history reflects:

- Device construction
- Physics integration
- Debugging sessions
- Simulation improvements
- Documentation updates
- Final project refinement

Every major milestone has been preserved to showcase the iterative nature of semiconductor device research.

---

# 🙏 Acknowledgements

I sincerely thank my research mentor and the Department of Electrical Engineering, Delhi Technological University (DTU), for providing the opportunity to work on semiconductor device simulation using Synopsys Sentaurus TCAD.

---

# 📄 License

This repository is intended for educational and research purposes only.
