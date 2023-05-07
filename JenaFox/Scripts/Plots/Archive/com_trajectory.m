figure;
plot(solution.kinematics.x.data, solution.kinematics.y.data, 'DisplayName', ...
    'CoM', 'LineWidth', 2);
title('CoM trajectory');
y_max = max(solution.kinematics.y.data);
y_min = min(solution.kinematics.y.data);
yline(y_max, '-.r', 'DisplayName', 'Max');
yline(y_min, '-.r', 'DisplayName', 'Min');
ylim([(y_min - .01), (y_max + .01)]);
xlabel('Distance x [$m$]');
ylabel('Distance y [$m$]');
grid on;
