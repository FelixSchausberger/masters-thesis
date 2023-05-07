# 20221203_Renjewski_Optimize-Optimization.md

Meeting preparation:

- Still finds solution if you set the spring stiffness & damping coefficient to 0.01 (but simulation gets slower the smaller): Currently at 1
(for every 0, twice as slow)
- Steps of the optimizer seem quite small to me, unfortunately not yet managed to set a minimum step size, qF still depends strongly on q0, qF: inverse of q0
- Show video
- Simulation, video of the very last run?

Meeting:

Simulation slow:

- Angular velocity torso vs. joint (rotational velocity), many zero crossings? Constraint on initial velocity: not close to 0 (avoids shaking around 0)
- Limit minimum integration step (default: auto, try 10^-9 → 10^-6)

Final state:

- One would have to be larger and one smaller, in magnitude both would have to be larger
- Left leg less than or equal to right leg if that is behind

New termination condition:

- Next touchdown of front leg
- In the Fox simulation you don't need a touchdown condition, because ground contact sensor (If force was once at 0 and then goes back to 1 - touchdown, logic in ground contact model)
- Start: left leg vertical, end: right leg vertical (vertical leg orientation (VLO)): clean cycle (x above foot point, when is x again above next foot point, incl. knee and hip angle at 0)

- Spring stiffness: 0.1: appropriate
- Damping coefficient: usually loosely 2, 3 orders of magnitude below that

Video of solution:

- Call Mechanics Explorer from the program
- Output parameters from last run so that you can feed them back into simulation
- Output joint positions and animate via plot
