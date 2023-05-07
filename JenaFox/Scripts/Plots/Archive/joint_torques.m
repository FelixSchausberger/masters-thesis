figure;
subplot(2, 1, 1);
plot(solution.torques.time, solution.torques.data, 'LineWidth', 2);
title('Joint torques');
xlabel('Time');
ylabel('Joint torques');
legend('phi_knee_r', 'phi_hip_r', 'phi_torso', 'phi_hip_l', 'phi_knee_l');
grid on;
legend('show');

% Plot motor voltages
subplot(2, 1, 2);
plot(solution.voltages.time, solution.voltages.data, 'LineWidth', 2);
title('Motor voltages');
xlabel('Time');
ylabel('Motor voltages');
legend('phi_knee_r', 'phi_hip_r', 'phi_torso', 'phi_hip_l', 'phi_knee_l');
grid on;
legend('show');
