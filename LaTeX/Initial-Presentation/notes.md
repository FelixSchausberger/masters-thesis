# Notes

Welcome to my initial presentation for my Master's thesis titled "Comparison of Controllers for Trunk Stabilization in a Bipedal Robot".

Bipedal running is a complex task, as it is a highly dynamical gait that involves a flight phase, during which no force can be applied to the environment (Bommel, 2011). Here, among other things, one of the main challenges is to balance the torso on the usually quite long legs, and that is exactly what will be tackled in the Thesis.

First, different control strategies for stabilizing the trunk pitch will get quantified and analyzed. Then, the most relevant controllers will be implemented in the already existing JenaFox simulation and last but not least selected approaches will be evaluated on the robotic test environment. The figure on the left shows the JenaFox robot.

Currently, a rather stiff spring limits the rotation of trunk of the JenaFox robot. I plan on gradually reducing this spring while adjusting controller accordingly. For this, I chose three promising approaches which I will focus on:

The first one, which will also be the main focus for implementation, is a collision based approach introduced by David Lee and others, with the premise that discrete footfalls prevent a consistent orthogonal relationship between the force and velocity vectors, and thus kinetic energy is lost as the GRF performs mechanical work at the center of mass.

The other two are on the one hand an extension of canonical SLIP with a constant hip torque and linear leg damping during stance called hip actuated SLIP (or H-SLIP) and on the other hand the VPP, a fixed point on the torso above the CoM, where the GRF are directed to via a hip torque.

The overall objective of the work is to get rid of the spring and enable a free rotation of the trunk without restrictions. Please note that friction will still be included in the simulation, just not as a spring.

The individual approaches will be compared with a disturbance rejection, in other word the maximum allowable perturbation of the model, whose process can be seen in the graphic on the left.
First, the limit cycle, which the model is in when the initial states remain unchanged for consecutive strides, will get determined.
Then the model will try to complete a certain number of steps, if it fails to do so and falls, the control parameters will get adjusted, and the whole process is repeated. However, if it is successful, the disturbances are increased and the run is repeated with the same parameters.
The mapping between the initial states of consecutive strides is called a Poincaré map.

Other possible comparison criteria are the disturbance response, meaning the recovery process of the model after a disturbance, or a mechanical cost analysis.

Possible disturbances are:
    - the horizontal velocity
    - the floor height
    - or the torso angular rate
which will get introduced as a single error on the initial state of the limit cycle.

The controllers will get implemented and simulated in MATLAB and Simulink. Git is used as a version control system and the documentation will be done in LaTeX.

Here is the preliminary schedule of work, today we are here, at the initial presentation. I plan a time buffer of about two weeks before the final submission to use the time for proofreading.

To sum up, I will quantify and analyze different trunk pitch control strategies, implement selected ones in the JenaFox simulation and evaluate them on a robotic test environment.

Here are the references I have used for the presentation. Thanks for your attention and if you any have questions please feel free to ask them now.

Appendix:

Collision based approach:
(Biewener, 2018): The mechanics of terrestrial locomotion can be modeled in terms of “inelastic” collisions by the limb with the ground (Kuo et al., 2005). If force and velocity vectors are perpendicular to each other, no collision occurs, which in turn means that no work is done at the center of mass (CoM). An example of this is the rolling wheel, more detailed, a wheel without rim but infinite spokes. However, locomotion with legs requires discrete footfalls, which precludes a consistent perpendicular relationship between these two vectors. The intermittent foot contacts during legged locomotion result in relatively abrupt, collision-like changes in CoM direction, which require mechanical work.

H-SLIP:
SLIP: energy conserving
Although it can return to periodic locomotion when subjected to a perturbation in velocity direction, it cannot stabilize the system energy.

VPP:
(Bommel, 2011): When the GRF always directs at the VPP, the VPP becomes a virtual hinge around which the torso will rotate. Essentially, this transforms the difficult task of balancing an inverted pendulum to a system consisting of a pendulum suspended from a hinge, which is intrinsically stable.

(Bommel, 2011): The controller can exert a torso torque only during the stance phase, since no GRF are present during the flight phase.
