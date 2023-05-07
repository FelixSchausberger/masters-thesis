function velocity_vectors_vlo(solution, GM_h)

x_hip = structfun(@(x) cat(1, x.hip_kinematics.x_hip.data(end)), solution);
y_hip = structfun(@(x) cat(1, x.hip_kinematics.y_hip.data(end)), solution);
dx_hip = structfun(@(x) cat(1, x.hip_kinematics.dx_hip.data(end)), solution);
dy_hip = structfun(@(x) cat(1, x.hip_kinematics.dy_hip.data(end)), solution);

x_knee = structfun(@(x) cat(1, x.knee_kinematics.x_knee_r.data(end)), solution);
y_knee = structfun(@(x) cat(1, x.knee_kinematics.y_knee_r.data(end)), solution);

x_toe = structfun(@(x) cat(1, x.toe_kinematics.x_toe_r.data(end)), solution);
y_toe = structfun(@(x) cat(1, x.toe_kinematics.y_toe_r.data(end)), solution);

figure
hold on

col = hsv(numel(x_hip));
for idx = 1:numel(x_hip)
    quiver(x_hip(idx), y_hip(idx), dx_hip(idx), dy_hip(idx), 0.15, 'LineWidth', (1 + idx/5), 'color', col(idx,:), ...
        'DisplayName', ['GM_h: ' num2str(GM_h(idx))])

    xVal = [x_hip(idx), x_knee(idx), x_toe(idx)];
    yVal = [y_hip(idx), y_knee(idx), y_toe(idx)];
    plot(xVal, yVal, 'o-', 'LineWidth', (1 + idx/5), 'color', col(idx,:), 'HandleVisibility', 'off');
end

yline(-0.004, 'k', 'Displayname', 'Ground', 'LineWidth', 4);
xlim([0 0.7])
axis equal

%     title('Hip velocity vectors at VLO')
xlabel('Horizontal displacement x [m]')
ylabel('Vertical displacement y [m]')
legend show
legend('Location', 'best')
grid on

end