# 20230112_Renjewski_Analyzing-Offset.md

- Projected velocity vector was wrong - checked with sensor in torso
- Proportionality constant for AEA
- How to cite JenaFox ISB convention (https://www.moodle.tum.de/mod/page/view.php?id=2068770)

How must offset look like depending on the state from touchdown?

Control law by reverse engineering:
How do we have to set the offset to get a touchdown with the current state of the robot so that we are periodic again in the next step?

- 1st possibility:
Find to a fixed angle state periodic solution: Ideally, you can read off: If my state is like this my angle must be like this
  - Pass fixed offset - find periodic solution
  - Pass other offset - find periodic solution again
- 2nd possibility: Keep all variables of the initial conditions the same except for one: How must the offset now look to be periodic? If one varies periodic solution, is there offset that periodic solution comes out again?

How do I set offset to run as periodically as possible?

Ideal case: offset can be constant and no matter what speed vector looks like I will always be periodic

basin of attraction: how big is error in solution when moving away from periodic solution. If large isolines around periodic solution: No problem, offset can be constant, state must change very much so that solutions do not become periodic, whereby if they lie very closely around then one needs for changed state also a changed offset.

Give selected offsets, compare state with offset

How do periodic solutions change when the initial state changes? How is offset related to initial state and velocity vector?

When varying periodic solution, is there offset that varied periodic solution is periodic again?

Thinking aloud:
Which quantities are useful to vary? Change the starting point? e.g. start at touchdown?
