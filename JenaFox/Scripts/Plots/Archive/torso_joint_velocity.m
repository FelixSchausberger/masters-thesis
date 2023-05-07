figure;
plot(solution.kinematics.w.time, solution.kinematics.w.data, 'LineWidth', 2);
title('Torso joint velocity');
xlabel('Time');
ylabel('Angular velocity of the torso');
grid on;
