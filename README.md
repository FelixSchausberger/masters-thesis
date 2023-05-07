# Comparison of Controllers for Trunk Stabilization in a Bipedal Robot

Master's thesis: Technical University of Munich, 2023
This project aims at quantifying and analyzing the similarities and differences between different trunk stabilization control strategies and testing them on a robotic test bed.

<p align="center">
  <a href="https://github.com/FelixSchausberger/masters_thesis">
    <img alt="JenaFox Robot" src="https://github.com/FelixSchausberger/masters_thesis/blob/main/JenaFox/Media/jenafox-wireframe-transparent-blue.png" width="220"/>
  </a>
</p>
<br/>
<p align="center">
  <a href="https://github.com/FelixSchausberger/masters_thesis/blob/main/LaTeX/Thesis/thesis.pdf" title="Download PDF (full text)">
    <img src="https://img.shields.io/badge/Download-PDF_(thesis)_-green"/>
  </a>
  <a href="https://gitlab.lrz.de/AM/TUMlatex" title="Template">
    <img src="https://img.shields.io/badge/Templates_-green"/>
  </a>
</p>
<br/>

## Abstract

Balancing the trunk on long legs is a major challenge in bipedal walking. To avoid conflictingcontrol objectives, all aspects of gait control must be tightly integrated. The goal of this thesisis to quantify correlations of parameters that influence the periodic gait. In the course of this,similarities and differences between different control strategies will be analyzed and tested ina bipedal robot simulation.  At first, a review of approaches for torso stabilization in bipedalrobots will be given.  A selected controller will then be implemented and simulated in thegiven computer model of the JenaFox bipedal walker. Finally, quantitative parameters basedon the mechanical cost analysis are determined to evaluate the controller.  For this purpose,trajectory optimization is used, to adjust the initial system dynamics in a way that the robotachieves a periodic gait.  The designed controller has strong influence of a neural networkcontroller.  The concept of vertical leg orientation is used to divide the periodic gait into aphase that repetitively results in a meaningful gait. Finally, a stability analysis is performed,which shows that the gait is asymptotically stable but not energy efficient.  Altogether, thisthesis investigates control strategies for balancing the trunk in bipedal walking and providesa solution approach that ensures the most periodic gait possible.
