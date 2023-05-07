figure;
hold on;

xline(0, 'k-', 'HandleVisibility', 'off');
yline(0, 'k-', 'HandleVisibility', 'off');

scatter(touchdown_history.V_proj_x, touchdown_history.V_proj_y, 200, 'x', 'LineWidth', 3, ...
    'DisplayName', 'V_{proj}');
scatter(touchdown_history.dx_torso, touchdown_history.dy_torso, 200, 'x', 'LineWidth', 3, ...
    'DisplayName', 'V_{com}');
scatter(touchdown_history.dx_hip, touchdown_history.dy_hip, 200, 'x', 'LineWidth', 3, ...
    'DisplayName', 'V_{hip}');
% scatter(touchdown_history.dx_toe_r, touchdown_history.dy_toe_r, 200, 'x', 'LineWidth', 3, ...
%     'DisplayName', 'V_{toe r}');

for idx = 1:size(touchdown_history.V_proj_x)
    xVal = [touchdown_history.V_proj_x(idx), touchdown_history.dx_torso(idx), touchdown_history.dx_hip(idx)];
    yVal = [touchdown_history.V_proj_y(idx), touchdown_history.dy_torso(idx), touchdown_history.dy_hip(idx)];
    
    plot(xVal, yVal, 'bo-', 'HandleVisibility', 'off');
end

plot(touchdown_history.V_proj_x(end), touchdown_history.V_proj_y(end), 'x', 'DisplayName', ...
    'Best V_{proj}', 'LineWidth', 3, 'MarkerSize', 20);
plot(touchdown_history.dx_torso(end), touchdown_history.dy_torso(end), 'x', 'DisplayName', ...
    'Best V_{com}', 'LineWidth', 3, 'MarkerSize', 20);
plot(touchdown_history.dx_hip(end), touchdown_history.dy_hip(end), 'x', 'DisplayName', ...
    'Best V_{hip}', 'LineWidth', 3, 'MarkerSize', 20);
plot(touchdown_history.dx_toe_r(end), touchdown_history.dy_toe_r(end), 'x', 'DisplayName', ...
    'Best V_{toe r}', 'LineWidth', 3, 'MarkerSize', 20);

xlabel('Velocity in x [$m/s$]');
ylabel('Velocity in y [$m/s$]');

title('Velocity vectors at touchdown');
legend show;
axis equal;
grid on;
