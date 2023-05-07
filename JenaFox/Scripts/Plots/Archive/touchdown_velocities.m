function touchdown_velocities(solution, best_idx)

dx_hip = structfun(@(x) cat(1, x.touchdown.dx_hip), solution);
dy_hip = structfun(@(x) cat(1, x.touchdown.dy_hip), solution);

dx_toe_r = structfun(@(x) cat(1, x.touchdown.dx_toe_r), solution);
dy_toe_r = structfun(@(x) cat(1, x.touchdown.dy_toe_r), solution);

figure
hold on
scatter(dx_hip, dy_hip, 200, 'x', 'DisplayName', 'Hip', 'LineWidth', 3)
scatter(dx_toe_r, dy_toe_r, 200, 'x', 'DisplayName', 'Toe', 'LineWidth', 3)
scatter(dx_hip(best_idx), dy_hip(best_idx), 300, 'x', 'DisplayName', 'Best hip', 'LineWidth', 3)
scatter(dx_toe_r(best_idx), dy_toe_r(best_idx), 300, 'x', 'DisplayName', 'Best toe', 'LineWidth', 3)

for idx = 1:size(dx_hip)
    xVal = [dx_hip(idx), dx_toe_r(idx)];
    yVal = [dy_hip(idx), dy_toe_r(idx)];
    
    plot(xVal, yVal, 'bo-', 'HandleVisibility', 'off');
end

xlabel('dy')
ylabel('dx')
legend show
grid on
    
end