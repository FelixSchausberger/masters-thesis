# 20221108_Renjewski_Trajectory-Optimization.md

I have CoM_mech / CoT_mech and collision fraction, but where do I go from here?
  
- (Schroeder, 2018): Take advantage of passive dynamics during single stance, rely on impulsive forces at step-to-step transition
- Objective function: Minimization of the sum of the mechanical work-based costs with cost function? Apply control optimization including a work-based cost and a force-rate-squared cost for each leg actuator. (Schroeder & Bertram, 2018)
- What are the parameters to control? Angle of attack, q (hip angle) and w (angular velocity)? Speed, step frequency and step length?
- How to include leg swing dynamics? bang-coast-bang strategy (impulse (acc) - swing with passive dynamics - impulse (dec), decoupling between leg dynamics and rest of body)

Periodicity:

- Robot takes a step
- Minimise the deviation of the state at the end of the step from the
state at the beginning of the step.
- Zero search (Nullstellensuche)

State:

- Upper body [x, y, phi]
- possibly hip and knee angle

Output:
Variation of stride length

Good initial configuration? Two-legged? One-legged? Less variability
and dependencies when starting with one leg

Variation of extreme angles with neural controller, keep weights the same

Optimisation problem to obtain reasonable set of initial conditions

Reduce spring stiffness and damping gradually
Current params: Params/physics_params.xml:
<IC_c_z value="500"/> % Spring stiffness (N/m)
<IC_d_z value="500"/> % Damping coefficient (rotation: Nm * s (?))

Dummy connector: necessary to add another DoF to the robot that allows to
rotate the pitch of the robot around the boom

q: Hip joint angle in relation to the origin
w: Angular speed of the hip joint
