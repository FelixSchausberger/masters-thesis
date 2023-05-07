function mca = Fox_mca(solution)

%% Mechanical cost analysis
load('workspace.mat', 'g', 'IC');
% Froude number ((Lee, 2011): equation 1)
% g                 Acceleration due to gravity [m/s^2]
% IC_y              CoM height [m]
% Average forward velocity [m/s]
dx_com_avg = mean(solution.com_kinematics.dx_com);
% Froude number
mca.Fr = (dx_com_avg * dx_com_avg) / (g * IC.y_com);
% Dimensionless velocity
mca.v_dimless = sqrt(mca.Fr);

mca.v_com_avg = vecnorm([dx_com_avg, mean(solution.com_kinematics.dy_com)], 2, 2);


% Force angle ((Lee, 2011): equation 3)
F = solution.ground_contact_model.GRF.data;
F_norm = vecnorm(F, 2, 2); % Vector-wise norm
mca.Theta = sum(F_norm .* ...
    solution.mechanical_cost_analysis.theta_com.data, ...
    'omitnan') / sum(F_norm);

% Velocity angle ((Lee, 2011): equation 5)
V = [solution.com_kinematics.dx_com.data ...
    solution.com_kinematics.dy_com.data];
V_norm = vecnorm(V, 2, 2);
mca.Lambda = sum(V_norm .* ...
    solution.mechanical_cost_analysis.lambda_com.data, ...
    'omitnan') / sum(V_norm);

% Collision angle ((Lee, 2011): equation 7)
mca.Phi = sum(F_norm .* ...
    V_norm .* solution.mechanical_cost_analysis.phi_com.data, ...
    'omitnan') / sum(F_norm .* V_norm);

% Mechanical cost of transport [J/mN]
mca.cot_mech = ...
    sum(norm(dot(F, V)), 'omitnan') / sum(F_norm .* V_norm, 'omitnan');

% Collision Fraction (actual relative to potential collision)
potential_collision = mca.Phi / (mca.Lambda + mca.Theta);
mca.collision_fraction = sum(F_norm .* V_norm * potential_collision) / sum(F_norm .* V_norm);

mca.collision_fraction1 = sum(F_norm .* V_norm .* ...
    (solution.mechanical_cost_analysis.phi_com.data ./ ...
    (solution.mechanical_cost_analysis.theta_com.data + ...
    solution.mechanical_cost_analysis.lambda_com.data)), 'omitnan') / ...
    sum(F_norm .* V_norm);

end
