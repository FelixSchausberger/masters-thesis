# 20230109_Renjewski_Final-Adjustments.md

- Optimizer extended: angular velocities, penalty for knees, torso may be mirrored (abs)
- Velocity vector is only more or less in the fourth quadrant
- AEA based on velocity vector - finds periodic solution
- Jobs (prosthetics, exoskeletons, legged robots)

Record values one sample before touchdown

map velocity vector of torso to hip (omega x r with the omega of the torso) -> v_proj = v_com + r x omega

Fit sensor in torso (torso against world, x, y, dx, dy).
Plot resultant velocity vector of hip with rotational velocity

Connect red with blue points

Add proportionality constants for AEA in controller and optimizer (x2, x0.5, ...) - we want to get behind that

Compare touchdown velocity of hip with foot point

How depends hip angle/foot angle and how hip angle with projected velocity vector
