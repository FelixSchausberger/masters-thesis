function obj = Fox_simulation(x0, visualize, GM_h, vcom_magnitude, ...
    prop_const, offset, IC_limit)
% This function calls the model JenaFox_NCm, a multibody simulation of the
% JenaFox robot with a neural network based controller. 
% It takes seven inputs:
% 1. params consiting of seven variables:
%     1. phi.knee_r     - right knee angle.
%     2. phi.hip_r      - right hip angle.
%     3. phi.com        - torso angle.
%     4. vcom.lambda    - angle of the velocity vector vcom
%     4. vphi.knee_r    - right knee angular velocity.
%     5. vphi.hip_r     - right hip angular velocity.
%     6. vphi.com       - torso angular velocity.
% 2. visualize:         To visualize the solution in the mechanics explorer.
% 3. GM_h:              Motor gain of the hip.
% 4. v_com_magnitude:   Magnitude of the velocity vector of the CoM.
% 5. prop_const:        Proportionality constant for the mapping function.
% 6. offset:            Offset for the mapping function.
% 7. IC_limit:          Struct containing the upper and lower bounds.
%
% 
% The function simulates the model and has one output:
%     1. obj - sum of absolute deviations between initial and final state.
% 
% Felix Schausberger, 15.11.2022
%%


%% Change to folder where script is located
cd(fullfile(fileparts(mfilename('fullpath'))));


%% Initialize variables
IC.phi.knee_r = x0(1);                          % [rad]
IC.phi.hip_r = x0(2);                           % [rad]
IC.phi.com = x0(3);                             % [rad]
IC.phi.hip_l = IC.phi.com;                      % [rad]
IC.phi.knee_l = 0.0;                            % [rad]

vcom.magnitude = vcom_magnitude;                % [m/s]
vcom.lambda = x0(4);                            % [rad]
IC.dx_com = vcom.magnitude * cos(vcom.lambda);  % [m/s]
IC.dy_com = vcom.magnitude * sin(vcom.lambda);  % [m/s]

IC.vphi.knee_r = x0(5);                         % [rad/s]
IC.vphi.hip_r = x0(6);                          % [rad/s]
IC.vphi.com = x0(7);                            % [rad/s]
IC.vphi.hip_l = 0.0;                            % [rad/s]
IC.vphi.knee_l = 0.0;                           % [rad/s]

IC.limit = IC_limit;

% Add params
for params = ["simulation_params", "physics_params", "motor_params", ...
        "simscape_model_params", "generate_dep_params"]
    run(which(string(params)));
end
save('workspace.mat');

global solution_history;

persistent n_calls;
if isempty(n_calls)
    n_calls = 0;
end

DEBUG = true;

q0 = [IC.phi.knee_r, ...
    IC.phi.hip_r, ...
    IC.phi.com, ...
    IC.phi.hip_l, ...
    IC.phi.knee_l, ...
    0.0, ...                % desired knee angle angle at touchdown
    IC.vphi.knee_r, ...
    IC.vphi.hip_r, ...
    IC.vphi.com, ...
    IC.vphi.hip_l, ...
    IC.vphi.knee_l, ...
    IC.dx_com, ...
    IC.dy_com, ...
    ];


%% Call simulation
simIn = Simulink.SimulationInput('JenaFox_NCm');
simIn = setModelParameter(simIn, 'SimMechanicsOpenEditorOnUpdate', ...
    visualize);
simIn = loadVariablesFromMATFile(simIn, "workspace.mat");
simIn = setVariable(simIn, 'prop_const', prop_const);
simIn = setVariable(simIn, 'offset', offset);
simIn = setVariable(simIn, 'GM_h', GM_h);

fastRestart = 'on';
if strcmp(visualize, 'on')
    fastRestart = 'off';
end

simOut = sim(simIn, 'UseFastRestart', fastRestart, 'ShowProgress', 'off');
warning(simOut.ErrorMessage)


%% Find first non-zero row index to store in history
[~, c] = structfun(@(x) max(x.data ~= 0, [], 1), simOut.touchdown.alpha);


%% Objective function (Right VLO)
qF = [simOut.knee_kinematics.phi_knee_l.data(end), ...
    simOut.hip_kinematics.phi_hip_l.data(end), ...
    abs(simOut.com_kinematics.phi_com.data(end)), ... % accept mirror
    penalty(simOut.hip_kinematics.phi_hip_r.data(end), deg2rad(10), deg2rad(0.6), 0), ...
    penalty(simOut.knee_kinematics.phi_knee_r.data(end), deg2rad(10), deg2rad(0.6), 0), ...
    penalty(simOut.touchdown.knee.phi_knee_r.data(c), deg2rad(20), deg2rad(0.6), 0), ...
    simOut.knee_kinematics.vphi_knee_l.data(end), ...
    simOut.hip_kinematics.vphi_hip_l.data(end), ...
    simOut.com_kinematics.vphi_com.data(end), ...
    simOut.hip_kinematics.vphi_hip_r.data(end), ...
    simOut.knee_kinematics.vphi_knee_r.data(end), ...
    simOut.com_kinematics.dx_com.data(end), ...
    simOut.com_kinematics.dy_com.data(end), ...
    ];


obj = sum(abs(qF - q0));

if DEBUG == true
    fprintf(strcat('q0:  ', repmat(' %.2f', 1, numel(q0)), '\n'), q0);
    fprintf(strcat('qF:  ', repmat(' %.2f', 1, numel(q0)), '\n'), qF);
    fprintf(strcat('Cost:', repmat(' %.2f', 1, numel(q0)), '\n'), ...
        abs(qF - q0));
    fprintf(strcat('Sum: %.2f, lambda: %.2f, AEA: %.2f\n\n'), obj, ...
        simOut.touchdown.mca.lambda_proj.data(c), ...
        simOut.touchdown.mca.AEA.data(c));
%     fprintf(strcat('Factor: %.2f, Magnitude: %.2f\n\n'), vcom.factor, ...
%         vcom.magnitude);
    
end

if simOut.output.status.data(end) ~= 0
    % Penalty for termination with undesired status
    obj = penalty(obj, 100, 1e-3, 0);

    if DEBUG == true
        warning('Skipping: Status: %d Params: %s', ...
            simOut.output.status.data(end), num2str(q0));
    end
end


%% Store touchdown and solution history
n_calls = n_calls + 1;
id = ['id' num2str(n_calls, '%03d')];
solution_history.(id) = simOut;
solution_history.(id).output.cost = obj;
solution_history.(id).output.status = simOut.output.status.data(end);
solution_history.(id).output.prop_const = prop_const;
solution_history.(id).output.offset = offset;
solution_history.(id).output.vcom = vcom;

names = fieldnames(simOut.touchdown);
for idx = 1:numel(names)
    solution_history.(id).touchdown.(names{idx}) = structfun(@(x) ...
        x.data(c), simOut.touchdown.(names{idx}), 'UniformOutput', false);
end

end

function y = penalty(x, convergence, slope, xshift)
    y = -convergence * (slope ^ abs(x - xshift) - 1);
end
