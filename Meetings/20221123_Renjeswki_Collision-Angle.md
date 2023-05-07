# 20221123_Renjeswki_Collision-Angle.md

Goal: Understanding what is the influence of the different parameters

2 levels:

1: Is it even possible?
    1. Release torso angle
    2. Run optimizer: Does it find solution with given input variables?

2: Modulate AEA
    Put controller on top that modulates AEA (anterior extreme angle), give controller degree of freedom to act with, DoF: velocity vector and angle between velocity vector and leg, adaptive AEA

collision-based approach: touchdown angle is adjusted depending on pitch angle

cot_mech & collision-fraction: use as analysis tool

Potentially relatively insensitive to changes in collision angle, but maybe there is an ideal collision angle that is maintained with some regularity over certain states, for which e.g. the cot is minimized

We do not know yet what we are optimizing for!
How can this angle be influenced at all? Do we need feedback signals, do we have to look into the swing phase, does it make sense to change it "live" or should we better anticipate it? Does it matter when it gets controlled, are there certain times that prove to be advantageous?

How do you set it up so that one can play with the collision angle?

Voltage limits of the motor: look at voltage curves, large voltage peaks? If not, no constraint
