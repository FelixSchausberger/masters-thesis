# 20221114_Renjewski_OptimTraj.md

MATLAB library for Trajectory Optimization (OptimTraj (FMINCON))

- Needs mass, moment of inertia (Trägheitsmoment), length & distance to CoM of every limb (trunk, upper & lower leg)
- Should I specify the JenaFox parameters and use the library?
- Advantage: Quickly switch between collocation methods (Trapezoidal, Runge Kutta, Hermite-Simpson) and numerical/analytical gradients
- Should I try to rebuild the library in the existing Simulink model?

  Trajectory Optimization:

  1. Dynamics
  q = [phi_knee_r, phi_hip_l, q, phi_hip_l, phi_knee_l] → dq, ddq
  2. Objective function
  Integral of torque-squared? How to get trunk torque?
  CoT? Difficult to optimize because solution tends to be discontinuous
  3. Constraints
    Step Constraints:
      - Periodicity
      - Step length (speed)?
      - Small feet?
    Path Constraints:
      - Keep swing foot above ground at all times?
  4. Initialization
    Make educated guess for q(0) and q(T)
  5. Transcription (transform trajectory optimization problem into constrained parameter optimization (NLP): continous → discrete)
    Use direct (discretize then optimize) collocation (based on function approximation) method:
      - Hermit Simpson: Dynamic & Control quadratic between grid points, state is cubic spline
  6. Solution accuracy: Mesh refinements:
    Use h-method (low-order, converge by increasing number of segments): 2 2nd order segments → 4 2nd order segments
    p-method: Hermite-Simpson?
