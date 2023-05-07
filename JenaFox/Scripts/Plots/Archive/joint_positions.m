figure;
plot(solution.q.time, solution.q.data, 'LineWidth', 2);
title('Joint positions');
xlabel('Time');
ylabel('Joint Angles [rad]');
legend('knee_r', 'hip_r', 'torso', 'hip_l', 'knee_l');
grid on;
