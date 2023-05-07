# 20221004_Renjewski_Initial-Presentation.md

- You know what you're doing, you've thought about how you're going to divide the work up
- Don't go into detail, briefly touch on background, 1, 2 slides up your sleeve
- Topic incorporated, how do you approach the topic, a little background
- Milestones, what do I want to achieve, by when should sections be completed.
- **Define comparison criteria (!)**
- Initial presentation:
  - How detailed does the schedule have to be? Gantt chart?
  - How much should the content be addressed?
  - Should the structure of the thesis be included?
  - The goal of the work is not yet clear enough to me, should the robot be able to stand, walk, run? How many controllers should be compared with each other (is it sufficient to compare collision based with VPP and PD (hybrid)?)
- Andrés has transferred the model to 2022a, should I take his repo and work from there? As far as I know he did the RL stuff with Python, should I get that running too?
- VPP: Force sensors on robot: planned but not implemented? Feedback loop with a P-control scheme vs simplified model?
- How to compare individual approaches? Maximum allowable disturbance, disturbance response, mechanical cost analysis?
- I can't see any official registration in my system yet, is it possible that it hasn't been done yet?

- Clock driven spring mass model (Seipel) can be included as an approach (spring profile in hip, stabilization by reaction moments of the legs)
- VPP: run robot over force plate, no current control in hips, use as analysis tool
- **Focus on kinematic things (e.g.: velocity angle)**.
- Spring behavior in hips via velocity profiles? Questionable

- Upper body currently limited in rotation with relatively stiff spring, gradually take out, reduce spring bit by bit and adjust controller.
- Goal / ideal case: rotation should be possible without restrictions
- Leave a little friction inside (no spring!) very moderate!
