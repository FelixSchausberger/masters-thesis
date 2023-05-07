function Fox_plot(solution, best_idx) % filename
% This function visualizes the output of the JenaFox_NCm model.
% It takes two inputs:
% 1. filename - filename of the solution containing the SimulationOutput
%
% Felix Schausberger, 19.01.2023
%%

set(0, 'defaulttextinterpreter', 'latex');

% currentFile = mfilename('fullpath');
% [pathstr, ~, ~] = fileparts(currentFile);
% addpath(fullfile(pathstr, './Plots'));
% addpath(fullfile(pathstr, '../Output'));
% 
% solution = load(filename);



% GM_h = structfun(@(x) cat(1, x.output.GM_h), solution);

% com_velocity(solution)
% save_myfig(gcf, 'com-vertical-velocity', {'eps','fig'})

phi_hip_torso(solution, best_idx);
% save_myfig(gcf, 'phi-hip-torso', {'eps','fig'})

% phase_plot(solution);
% save_myfig(gcf, 'phase-plot', {'eps','fig'})

% displacement(solution, best_idx);
% save_myfig(gcf, 'displacement-zoom', {'eps','fig'})

% velocity_vectors_touchdown(solution, GM_h);
% save_myfig(gcf, 'velocity-vectors-touchdown', {'eps','fig'})

% velocity_vectors_vlo(solution, GM_h);
% save_myfig(gcf, 'velocity-vectors-vlo', {'eps','fig'})

% ground_state(solution);







% x.data = structfun(@(x) x.output.offset, solution);
% x.name = "Offset [deg]";
%
% x.data = structfun(@(x) cat(1, x.output.GM_h), solution);
% x.name = "Hip Motor Gain";
% 
% cost = structfun(@(x) x.output.cost, solution);
% [~, best_idx] = min(cost);
%
% offset = structfun(@(x) cat(1, x.output.offset), solution);

% run(which('alpha_vs_phi_hip.m'));
% run(which('alpha_vs_velocity_vectors.m'));
% run(which('com_trajectory.m'));
% run(which('ground_contact.m'));
% run(which('ground_reaction_forces.m'));
% run(which('joint_positions.m'));
% run(which('joint_torques.m'));

% x_vs_cost(x, cost, best_idx);
% x_vs_phi(solution, x, best_idx);
% x_vs_vphi(solution, x, best_idx);
% x_vs_alpha(solution, x, best_idx);
% x_vs_velocity_vector(solution, x, best_idx);

% touchdown_velocities(solution, best_idx);
% vphi_hip_r(solution, GM_h, offset, best_idx);
% GM_h(solution, best_idx);

% run(which('torso_joint_velocity.m'));
% run(which('touchdown_angles.m'));
% run(which('velocity_vectors.m'));

end
