function displacement(solution, best_idx)

x = structfun(@(x) cat(1, x.com_kinematics.x_com), solution);
y = structfun(@(x) cat(1, x.com_kinematics.y_com), solution);

figure

plot(x(best_idx).data, y(best_idx).data, 'LineWidth', 1)

y_max = max(y.data);
y_min = min(y.data);
yline(y_max, '-.r', 'Displayname', 'Max');
yline(y_min, '-.r', 'Displayname', 'Min');
yticks([y_min .22 .24 .26 .28 y_max]);

xlim([8 10])
% title('Displacement')
xlabel('Horizontal displacement $[m]$')
ylabel('Vertical displacement $[m]$')
grid on

end