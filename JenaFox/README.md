# Comparison of Controllers for Trunk Stabilization in a Bipedal Robot

This project aims at quantifying and analyzing the similarities and differences between different trunk stabilization control strategies and testing them on a robotic test bed. General information about this project can be found [here](https://codeberg.org/fesch/masters-thesis)

<div align="center">
  <img src="https://codeberg.org/fesch/master-thesis/raw/branch/main/LaTeX/Thesis/figures/jenafox/jenafox-wireframe-transparent-blue.png" width="220" alt="JenaFox Robot" />
</div>

## Index

[[_TOC_]]

## Repository overview

- [Archive](/Archive/): Obsolete and unused files of previous projects
- [CAD](/CAD/): CAD (.STEP) files of the robot which are used for the simulation
- [Calibration](/Calibration/): Contains calibration files for the robot
- [Media](/Media/): Media files
- [Params](/Params/): Parameter files of the robot
- [Scripts](/Scripts/): Configuration and start/stop scripts of the simulation and hardware
  - [Output](/Scripts/Output/): Simulation output files
  - [Plots](/Scripts/Plots/): Helper scripts to visualize solution and create plots
- [Simulink](/Simulink/):
  - [JenaFox_Hardware](/Simulink/JenaFox_Hardware/): Simulink model of the real robot

## Dependencies

The following MATLAB toolboxes need to be installed:

- MATLAB 2022a
  - MATLAB Optimization Toolbox
  - Statistics and Machine Learning Toolbox
- Simulink
  - Simulink Desktop Real-Time (hardware only)
- Signal Processing Toolbox
  - DSP System Toolbox
    - Communication Toolbox
- Simscape
  - Simscape Electrical
  - Simscape Multibody

>>>
Note: Get required toolboxes with

```matlab
tbxes=dependencies.toolboxDependencyAnalysis({'JenaFox_NCm'})
```

>>>

## First steps

Make sure that all folders are in the MATLAB path

To run:

- the optimization: [trajectory_optimization.m](/Scripts/trajectory_optimization.m)
- a single iteration: [single_iteration.m](/Scripts/single_iteration.m)

Both run [Fox_simulation.m](/Scripts/Fox_simulation.m) which:

- Runs [JenaFox_NCm.slx](/Simulink/JenaFox_NCm.slx)
- Calls [Fox_mca.m](/Scripts/Fox_mca.m) (which calculates the mechanical cost analysis)
- Calls [Fox_plot.m](/Scripts/Fox_plot.m) (to visualize solution)

>>>
Note: To visualize a solution without running the complete model use [visualize_solution.mlx](/Scripts/visualize_solution.mlx)
>>>
