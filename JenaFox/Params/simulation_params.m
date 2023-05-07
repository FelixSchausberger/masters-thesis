%% Solver parameters
solverParams.maxStep = 1e-1;
solverParams.relTol = 1e-2;
solverParams.absTol = 1e-3;
solverParams.refineFactor = 1e1;


%% Termination conditions
terminationConditions.dx = -1.0;
terminationConditions.y = 0.15;
terminationConditions.y_knee = 0.028;
terminationConditions.stopDistance = 15;
terminationConditions.stopTime = 60.0;
terminationConditions.enableVLO = 0;
