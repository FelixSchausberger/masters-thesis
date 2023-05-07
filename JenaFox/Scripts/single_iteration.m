function single_iteration
%% trajectory_optimization.m  --  JenaFox Trajectory Optimization
% This function sets up and then solves the optimal trajectory for the
% JenaFox biped.
%
% Felix Schausberger, 15.11.2022
%%

clear all

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
cellfun(@(x) addpath(fullfile(fileparts(mfilename('fullpath')), [symb, x])), folders);

cd(Scripts);


%% Initialize variables
IC.phi.knee_r = deg2rad(-29);       % [rad]  
IC.phi.hip_r = deg2rad(-15);        % [rad]    
IC.phi.com = deg2rad(15);           % [rad]   

IC.y_knee = 0.1514;                 % [m]
IC.y_hip = 0.2666;                  % [m]

prop_const = 0.2;
offset = 4;

IC.limit.phi_knee = deg2rad(-110);
IC.limit.phi_hip = deg2rad(70);
IC.limit.phi_com = deg2rad(20);

GM_h = 1.6;

vcom.magnitude = 0.6;               % [m/s]
vcom.lambda = deg2rad(10);          % [rad]
IC.vphi.knee_r = 0.0;               % [rad/s]  % vcom.magnitude / IC.y_knee;
IC.vphi.hip_r = 0.0;                % [rad/s]   % vcom.magnitude / IC.y_knee;
IC.vphi.com = 0.0;                  % [rad/s]


%% Initial guess
x0 = [IC.phi.knee_r, ...
    IC.phi.hip_r, ...
    IC.phi.com, ...
    vcom.lambda, ...
    IC.vphi.knee_r, ...
    IC.vphi.hip_r, ...
    IC.vphi.com, ...
    ];

clearvars -global solution_history;
global solution_history;

Fox_simulation(x0, 'on', GM_h, vcom.magnitude, prop_const, offset, IC.limit);

for fieldname = fieldnames(solution_history).'
    solution = solution_history.(fieldname{:});
end

mca = Fox_mca(solution);

for fieldname = fieldnames(mca).'
    solution.mechanical_cost_analysis.(fieldname{:}) ...
        = mca.(fieldname{:});
end

fileName = [datestr(now, 'dd-mmm-yyyy_HHMMSS'), '_solution.mat'];
save([fullfile(baseFolder, '/Scripts/Output/'), fileName], ...
    'solution', '-v7.3');

Fox_plot(load(fileName), 1);

end
