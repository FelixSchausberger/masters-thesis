# Keywords

## Introduction

- Balancing trunk: Major challenge
- Avoid conflicting control objectives: gait control tightly integrated
- Objective: Stabilize torso, enable movement on plane, was fixed with spring
- Goal: Quantify correlations of params that influence periodic gait
- Implementation: Neural network controller
- Periodic gait: trajectory optimization
- Evaluation: Quantitative parameters based on MCA

## Trajectory optimization

- attempt made to deduce control law by simulating and analyzing dynamics of entire system
- Cost function: sum of absolute deviations between initial and final state (state: angles and angular velocities)
- Initial and final state: VLO: Divide gait into phases
- Optimizer was left to find a solution as periodic as possible via the cost function

## MCA

- Quantify energy consumption and efficiency of movement patterns
- Central concept: D'Alembert's 'principle of orthogonal constraint'
- Mass redirected without mechanical work as long as F perpendicular V -> dot product (= mechanical power) = 0
- Cannot be implemented in real legged systems: require intermittent, discrete footfalls -> preclude consistent orthogonal relationship -> kinetic energy is lost as F performs mechanical work on the CoM
- Figure: two isolated, hypothetical strides:

  - instantaneous: lambda (horizontal), theta (vectical), phi: deviation of perpendicularity of F to V
  - arcsine: phase shift of π/2 to define angle of zero when the force and
velocity vectors are perpendicular to each other
  - Note: φ is undefined during flight periods, i.e. when GRF = 0
  - left: compliant SLIP: F and V opposite directions from vertical and horizontal axes: φ = λ + θ ̸= 0
  - right: however: F and V same direction: collisions reduced: up to theoretical case where remain orthogonal throughout entire stride
  - Note: angles are illustrated at specific instances

## Collision fraction

- Collision reduction: directly correlated to collision angle Φ, quantified by collision fraction κ: Actual collision relative to potential collision
- Phi, Lambda, Theta: angle over entire stride, given by weighted average of corresponding instantaneous angle
- Small if: Lambda/Theta small, near perpendicularity of F and V
- Compliant SLIP: Kappa = 1, Zero collision case: Kappa = 0
- Applying the small angle approximation of phi to Phi, only small vertical undulations and fore-aft forces appear: Phi ~ CoTmech (sin(φ) ≊ φ (i.e. if φ is less than about 0.3 rad))
- CoTmech: dimensionless metric of normalized mechanical power during contact period of gait when limb redirects CoM, i.e. the mechanical work at the CoM required to move a unit body weight a unit distance in the direction of travel
- Compared to mammals from the literature, CoTmech of the robot is relatively high (almost 2x that of running humans)

## Horizontal velocity

- Extreme oscillations
- Negative horizontal displacement of the robot
- enormous energy demand, as accelerates and decelerates
- solution approach: stricter constrains (no negative velocity)

## Phase plot

- Stopped after 15m
- Asymptotically stable in its gait after few oscillations
- converge to given orbit over time, orbit: attracting

## Summary

- Objective: Stabilize torso
- Goal: Quantify correlations of parameters that influence periodic gait
- Implementation: Neural network controller, trajectory optimization, VLO, MCA
- Result: Asymptotically stable gait found
- Evaluation: Not energy efficient
- Outlook: Presented optimizer: starting point to develop new promising gaits
- Basin of attraction (analyze error distance of solution to the most periodic solution)
