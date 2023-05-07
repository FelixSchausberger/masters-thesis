# 20221220_Renjewski_Knee-Extension.md

Forward swing: Are we not getting far enough or are we swinging back? - Output angular velocities at touchdown:
Negative: We are in still swinging forward: Turn gain to make swing faster
Positive: We are already in the backswing

We want to make sure that we can control attack angles, so that swing phase must be completed cleanly

Recommendation: make hip angle flatter so that there is more room for knee to swing through, and knee starts to swing through later (depends on AEA)

Compare hip angle:
Hip against torso vs. hip against world
Is phi_fh smaller than angle when torso was still fixed?

In optimizer force knee angle at touchdown to be greater or equal than zero
Take the initial conditions for the torso angle always so that the knee angle always becomes zero
Knee angle speed: Positive: knee in extension, ground clearance is not sufficient

If torso is tilted backwards, then complete controller would initiate swing relatively far up on relatively vertical hind leg and would thus have maximum ground clearance
If torso is tilted forward you have much less ground clearance
