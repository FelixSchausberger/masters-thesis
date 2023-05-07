figure;
plot(solution.ground_contact_model.GRF.time, solution.ground_contact_model.GRF.data, 'DisplayName', 'GRF', ...
    'LineWidth', 2); % , 'Color', [0.075 0.63 1]
title('Ground reaction forces');
xlabel('Time [$s$]');
ylabel('GRF [$N$]');
grid on;
legend('show');
