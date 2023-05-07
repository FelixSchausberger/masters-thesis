figure;
subplot(2, 1, 1);
hold on;
AEA_actual = touchdown_history.alpha_hip - touchdown_history.phi_knee_r;
plot(touchdown_history.alpha_hip, AEA_actual, 'x', 'LineWidth', 3, ...
    'MarkerSize', 15, 'HandleVisibility', 'off');
xlabel('$\alpha_{hip}$');
ylabel('$\phi_{hip} + \phi_{knee}$');
ref_min = min([touchdown_history.alpha_hip; AEA_actual]) - 2;
ref_max = max([touchdown_history.alpha_hip; AEA_actual]) + 2;
plot(ref_min:ref_max, ref_min:ref_max, 'k--', ...
    'DisplayName', 'Reference', 'LineWidth', 3);

yline(touchdown_history.AEA(end), '-.b', 'DisplayName', ...
    'AEA_{setpoint}', 'LineWidth', 3);
plot(touchdown_history.alpha_hip(end), AEA_actual(end), 'x', ...
    'DisplayName', 'Best', 'LineWidth', 3, 'MarkerSize', 20);
axis equal;
legend show;
grid on;

subplot(2, 1, 2);
hold on;
plot(touchdown_history.alpha_com, AEA_actual, 'x', 'LineWidth', 3, ...
    'MarkerSize', 15, 'HandleVisibility', 'off');
xlabel('$\alpha_{CoM}$');
ylabel('$\phi_{hip} + \phi_{knee}$');
ref_min = min([touchdown_history.alpha_com; AEA_actual]) - 2;
ref_max = max([touchdown_history.alpha_com; AEA_actual]) + 2;
plot(ref_min:ref_max, ref_min:ref_max, 'k--', ...
    'DisplayName', 'Reference', 'LineWidth', 3);

yline(touchdown_history.AEA(end), '-.b', 'DisplayName', ...
    'AEA_{setpoint}', 'LineWidth', 3);

plot(touchdown_history.alpha_com(end), AEA_actual(end), 'x', ...
    'DisplayName', 'Best', 'LineWidth', 3, 'MarkerSize', 20);
axis equal;
legend show;
grid on;
