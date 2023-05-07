# Notes

Welcome to the final presentation of my master's thesis.

## Problem description

Balancing the trunk on long legs is a major challenge in bipedal walking. To avoid conflicting control objectives, all aspects of gait control must be tightly integrated. The goal of this thesis was to quantify correlations of parameters that influence the periodic gait. In the course of this, similarities and differences between different control strategies were analyzed and tested in a bipedal robot simulation. The goal of this work is to stabilize the torso of a bipedal robot and thus enable free movement of the upper body on a plane, as the trunk was previously fixed with a rather spring unable to swing forward or backward with previous walking patterns.

A neural network based controller was implemented, and quantitative parameters based on the mechanical cost analysis were determined to evaluate the controller. To achieve a periodic gait, a trajectory optimization was implemented where the concept of vertical leg orientation was used to divide the periodic gait into a phase that repetitively results in a meaningful gait. By simulating and analyzing the dynamics of the entire system, an attempt is made to deduce a control law.

## Mechanical Cost Analysis

The main focus of the implementation is a collision based approach introduced by David Lee and others, called Mechanical Cost Analysis. The MCA is a method used to quantify the energy consumption and efficiency of movement patterns in biological and artificial systems with the premise that discrete footfalls prevent a consistent orthogonal relationship between the force and velocity vectors, and thus kinetic energy is lost as the GRF performs mechanical work at the center of mass.

The central concept of MCA is D'Alembert's 'principle of orthogonal constraint', which shows that a mass can be redirected without mechanical work, as long as the constraint (i.e. the force vector) is perpendicular to the path (i.e. the velocity vector), such that their dot-product (i.e. the mechanical power) is zero. However, this theoretical redirection with zero work cannot be implemented in real legged systems as terrestrial legged locomotion requires intermittent, discrete footfalls. These "inelastic" collisions by the limb with the ground preclude a consistent orthogonal relationship between the force and velocity vector, as their corresponding instantaneous angles theta (relative to vertical) and lambda (relative to horizontal) are of the same sign (left). This results in a non-zero collision angle phi and abrupt, collision-like changes in the CoM direction, which require mechanical work. However, in the theoretical case, if the two vectors are perpendicular to each other, phi = 0, meaning the angles theta and lambda are equal and of opposite sign, which in turn means that no collision occurs, and no work is done at the CoM, as for a wheel without rim but infinite spokes (right). Note that angles and collision fractions are illustrated at specific instances.

The instantaneous collision angle phi is the deviation of perpendicularity of force and velocity vectors of the CoM, given by the dot product of force on velocity.

## Mechanical Cost Analysis 2

Applying the small angle approximation of phi in Phi, that is, when only small vertical undulations and fore-aft forces appear, shows that the collision angle Phi is a close approximation to the CoTmech if sin(phi) ~ phi (i.e. if phi is less than about 0.3 rad).

The collision reduction is directly correlated to the collision angle Φ and quantified by the collision fraction κ, which gets small if either the velocity angle Λ4 or the force angle Θ is small, if there is a near perpendicularity of the velocity vector v CoM and the GRF throughout the stride or any combination thereof. The collision fraction is the actual collision relative to potential collision.

Compliant SLIP: φ = λ + θ ̸= 0 and κ = 1, since the braking force yields a non-perpendicular angle with downward velocity whereas the propulsive force yields one with upward velocity (left), which occurs whenever the GRF and v CoM are oriented in opposite directions from the vertical and horizontal axes. Whenever the GRF and v CoM are oriented in the same direction, collisions are reduced and κ < 1 up to the idealized case in which the GRF and v CoM remain orthogonal throughout the entire stride and thus φ = |λ − θ | = 0 and κ = 0 (right).

## Trajectory optimization

To ensure that the walking gait is periodic, the sum of absolute deviations between the initial and final state is used as the cost function, where the state consists the angles and angular velocities.

## Horizontal velocity

An ongoing issue that should be addressed in further work is the extreme oscillations of the horizontal velocity, which also include a negative horizontal displacement of the robot (see figure 4.6b). This results in an enormous energy demand, as the robot permanently accelerates and then decelerates again with the given gait. A possible solution approach would be to give the optimizer stricter constraints, for example, that the robot is not allowed to reach negative horizontal velocities at all ( v CoM x > 0 ms ∀ t ). However, at the current time of writing, no reasonable gait could have been found that takes stricter constraints into account.

## Phase plot

The plot shows the position of the torso of the JenaFox robot on the sagittal plane (i.e. the plane spanned between the abscissa axis (X-axis, orange) and ordinate axis (Y-axis, green)) during its motion and reveals that the robot is asymptotically stable in its gait. The simulation was stopped as soon as the robot reached a distance of 15m. The vertical displacement of the torso in is plotted on the abscissa axis, the vertical velocity on the ordinate axis, respectively.
