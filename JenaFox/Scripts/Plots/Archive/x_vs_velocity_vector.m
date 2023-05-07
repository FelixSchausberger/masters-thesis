function x_vs_velocity_vector(solution, x, best_idx)

% plot.vx = structfun(@(x) x.touchdown.mechanical_cost_analysis.V_proj_x, solution);
% plot.vy = structfun(@(x) x.touchdown.mechanical_cost_analysis.V_proj_y, solution);

% plot.vx = structfun(@(x) x.touchdown.hip.dx_hip, solution);
% plot.vy = structfun(@(x) x.touchdown.hip.dy_hip, solution);

% plot.vx = structfun(@(x) x.touchdown.com.dx_com, solution);
% plot.vy = structfun(@(x) x.touchdown.com.dy_com, solution);

plot.vx = structfun(@(x) cat(1, x.com_kinematics.dx_com.data(end)), solution);
plot.vy = structfun(@(x) cat(1, x.com_kinematics.dy_com.data(end)), solution);

% plot.vx = structfun(@(x) x.touchdown.orbital_v_com_x, solution);
% plot.vy = structfun(@(x) x.touchdown.orbital_v_com_y, solution);

% plot.vx = structfun(@(x) x.touchdown.orbital_v_hip_x, solution);
% plot.vy = structfun(@(x) x.touchdown.orbital_v_hip_y, solution);

plot.v = vecnorm([plot.vx, plot.vy], 2, 2);
% lambda = structfun(@(x) x.touchdown.lambda_proj, solution);

figure

labels = ["Hip velocity in x [m/s]", "Hip velocity in y [m/s]", "Hip velocity [m/s]"];

names = fieldnames(plot);
for idx = 1:numel(names)
    subplot(3, 1, idx)
    hold on
    scatter(x.data, plot.(names{idx}), 200, 'x', 'LineWidth', 3)
    scatter(x.data(best_idx), plot.(names{idx})(best_idx), 300, 'x', 'LineWidth', 3)
    xlabel(x.name)
    ylabel(labels(idx))
    grid on
end

% subplot(2, 2, 4)
% hold on
% scatter(x.data, lambda, 200, 'x', 'LineWidth', 3)
% scatter(x.data(best_idx), lambda(best_idx), 300, 'x', 'LineWidth', 3)
% xlabel(x.name)
% ylabel('Projected lambda [deg]')
% grid on

end
