# 20221212_Renjewski_Optimize-Optimization_Part-2.md

Meeting preparation:

- Update:
  - Simulation runs way faster:
    - Min integration step limited to 10^-9
    - New termination: (VLO)
      - Initial: left leg vertical
      - Final: right leg vertical (x above xFP2 OR leg vertical to ground (works better)) - xFP2 from ground contact model
      - Same cost function (angles of left leg and torso in final state should be same as angles of right leg and torso in initial state)
    - Spring stiffness: 0.1
    - Damping coefficient: 0.01
- Questions:
  - Angular velocity torso: Many zero crossings? (Can't really avoid with constraining initial velocity)
  - Put controller on top that modulates AEA (angle between velocity vector and hip) - how to proceed? (Make connection to angle of attack) How can this angle be influenced at all?

Meeting:

Record actual touchdown angle at moment of touchdown
Compare with AEA (hip to touchdown point, center of gravity to upper body to touchdown point (as velocity vector starts here))
How does angle change from AEA to touchdown (does it get bigger, smaller?) - can you give AEA offset to land on desired angle?
