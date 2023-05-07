function com_velocity(solution)

dx_com = structfun(@(x) x.com_kinematics.dx_com, solution);
dx_com_mean = mean(dx_com.data);
dx_com_max = max(dx_com.data);
dx_com_min = min(dx_com.data);

dy_com = structfun(@(x) x.com_kinematics.dy_com, solution);
dy_com_mean = mean(dy_com.data);
dy_com_max = max(dy_com.data);
dy_com_min = min(dy_com.data);

figure

hold on
plot(dx_com.time, dx_com.data, 'LineWidth', 1, 'HandleVisibility', 'off')
yline(dx_com_mean, '-.k', 'Displayname', 'Average horizontal velocity $\left[\frac{m}{s}\right]$', 'LineWidth', 2);
yline(dx_com_max, '-.r', 'HandleVisibility', 'off');
yline(dx_com_min, '-.r', 'HandleVisibility', 'off');
yticks([-1 dx_com_min 0 dx_com_mean dx_com_max 2])
ylim([-1 2])
xlim([0 10])
xlabel('Time $t~[s]$')
ylabel('Horizontal velocity $\left[\frac{m}{s}\right]$')
legend show
legend('Location', 'southoutside', 'Interpreter', 'latex')
grid on

figure

hold on
plot(dy_com.time, dy_com.data, 'LineWidth', 1, 'HandleVisibility', 'off')
yline(dy_com_mean, '-.k', 'Displayname', 'Average vertical velocity $\left[\frac{m}{s}\right]$', 'LineWidth', 2);
yline(dy_com_max, '-.r', 'HandleVisibility', 'off');
yline(dy_com_min, '-.r', 'HandleVisibility', 'off');
yticks([-1 dy_com_min dy_com_mean 0 dy_com_max 1.2])
ylim([-1 1.2])
xlim([0 10])
xlabel('Time $t~[s]$')
ylabel('Vertical velocity $\left[\frac{m}{s}\right]$')
legend show
legend('Location', 'southoutside', 'Interpreter', 'latex')
grid on

end
