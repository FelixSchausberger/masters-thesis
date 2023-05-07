figure;
subplot(2, 1, 1);
scatter(touchdown_history(:, 1), touchdown_history(:, 4));
title('phi hip vs. alpha hip');
xlabel('$\alpha_{hip}~[^\circ]$');
ylabel('$\phi_{hip}~[^\circ]$');
grid on;

subplot(2, 1, 2);
scatter(touchdown_history(:, 2), touchdown_history(:, 4));
title('phi hip vs. alpha CoM');
xlabel('$\alpha_{com}~[^\circ]$');
ylabel('$\phi_{hip}~[^\circ]$');
grid on;

subplot(2, 2, 3);
scatter(touchdown_history(:, 1), touchdown_history(:, 3));
xlabel('$\alpha_{hip}~[^\circ]$');
ylabel('$rho~[^\circ]$');
grid on;

subplot(2, 2, 4);
scatter(touchdown_history(:, 2), touchdown_history(:, 3));
xlabel('$\alpha_{com}~[^\circ]$');
ylabel('$rho~[^\circ]$');
grid on;
