function trajectory_optimization
%% trajectory_optimization.m  --  JenaFox Trajectory Optimization
% This function sets up and then solves the optimal trajectory for the
% JenaFox biped.
%
% Felix Schausberger, 15.11.2022
%%

%% Add necessary paths
if(isunix)                                                                          
    symb = '/';                   
else
    symb = '\'; 
end 

Scripts = fullfile(fileparts(mfilename('fullpath')));
baseFolder = [Scripts, symb, '..', symb, '..', symb, 'JenaFox'];
addpath(baseFolder); 
addingfolders = dir(baseFolder);
for folderid = 3:size(addingfolders, 1)
  foldername = [baseFolder, symb, addingfolders(folderid).name];
  if isfolder(foldername)
    addpath(foldername);
  end
end

folders = {'Plots', 'Output'};
cellfun(@(x) addpath(fullfile(fileparts(mfilename('fullpath')), ...
    [symb, x])), folders);

cd(Scripts);


%% Initialize variables
IC.phi.knee_r = deg2rad(-29);           % [rad]  
IC.phi.hip_r = deg2rad(-15);            % [rad]    
IC.phi.com = deg2rad(15);               % [rad]

IC.y_knee = 0.1514;                     % [m]
IC.y_hip = 0.2666;                      % [m]

IC.limit.phi_knee = deg2rad(-110);      % [rad]
IC.limit.phi_hip = deg2rad(70);         % [rad]
IC.limit.phi_com = deg2rad(20);         % [rad]
IC.limit.vcom.lambda = deg2rad(30);     % [rad]
IC.limit.vphi = 3;                      % [rad/s]

prop_const = 0.2;
offset = 4;

persistent n_calls;
if isempty(n_calls)
    n_calls = 0;
end


% Set up parameters and options
problem.solver = 'fmincon';
problem.options = optimoptions(... % 'MaxIterations', 0, ...
    'fmincon', ...
    'Display', 'iter-detailed');

if problem.options.MaxIterations ~= 1000
    warning('MaxIterations is set to non-default value (%d).', ...
        problem.options.MaxIterations)
end


%% Constraints
% Lower / upper limits of the angles
problem.lb = [IC.limit.phi_knee, ...
    -IC.limit.phi_hip, ...
    0.0, ...
    -IC.limit.vcom.lambda, ...
    -IC.limit.vphi * ones(1, 3), ...
    ];

problem.ub = [deg2rad(-10), ...
    IC.limit.phi_hip, ...
    IC.limit.phi_com, ...
    IC.limit.vcom.lambda, ...
    IC.limit.vphi * ones(1, 3), ...
    ];


%% Optimization
tic

GM_h = 1.6;
% for GM_h = 1.2:0.2:1.6

    vcom.magnitude = 0.6;       % [m/s]
    vcom.lambda = deg2rad(10);  % [rad]
    IC.vphi.knee_r = 0.0;       % [rad/s]
    IC.vphi.hip_r = 0.0;        % [rad/s]
    IC.vphi.com = 0.0;          % [rad/s]
    

    %% Initial guess
    problem.x0 = [IC.phi.knee_r, ...
        IC.phi.hip_r, ...
        IC.phi.com, ...
        vcom.lambda, ...
        IC.vphi.knee_r, ...
        IC.vphi.hip_r, ...
        IC.vphi.com, ...
        ];

    clearvars -global solution_history;
    global solution_history;

    
    %% Objective function
    problem.objective = @(x)Fox_simulation(x, 'off', GM_h, ...
        vcom.magnitude, prop_const, offset, IC.limit);


    %% Solve
    [x, fval] = fmincon(problem);

    n_calls = n_calls + 1;
    id = ['id' num2str(n_calls, '%03d')];
    for fieldname = fieldnames(solution_history).'
        if eq(solution_history.(fieldname{:}).output.cost, fval)
            solution.(id) = solution_history.(fieldname{:});
        end
    end
    solution.(id).output.best_IC = x;
    solution.(id).output.GM_h = GM_h;
    mca = Fox_mca(solution.(id));

    for fieldname = fieldnames(mca).'
        solution.(id).mechanical_cost_analysis.(fieldname{:}) ...
            = mca.(fieldname{:});
    end
% end
disp(['Elapsed time is ' num2str(round(toc / 60, 1)) ' minutes.'])


%% Save solution
fileName = [datestr(now, 'dd-mmm-yyyy_HHMMSS'), '_solution.mat'];
save([fullfile(baseFolder, '/Scripts/Output/'), fileName], '-struct', ...
    'solution', '-v7.3');
% save('solution_history.mat', '-struct', 'solution_history', '-v7.3');


%% Visualize solution
cost = structfun(@(x) x.output.cost, solution);
[~, best_idx] = min(cost);
name = fieldnames(solution);

Fox_plot(solution, best_idx);
Fox_simulation(solution.(name{best_idx}).output.best_IC, ...
    'on', GM_h, vcom.magnitude, prop_const, offset, IC.limit);

end
