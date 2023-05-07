function velocity_vectors_touchdown(solution, GM_h)

x_hip = structfun(@(x) cat(1, x.touchdown.hip.x_hip), solution);
y_hip = structfun(@(x) cat(1, x.touchdown.hip.y_hip), solution);
dx_hip = structfun(@(x) cat(1, x.touchdown.hip.dx_hip), solution);
dy_hip = structfun(@(x) cat(1, x.touchdown.hip.dy_hip), solution);

x_knee = structfun(@(x) cat(1, x.touchdown.knee.x_knee_r), solution);
y_knee = structfun(@(x) cat(1, x.touchdown.knee.y_knee_r), solution);

x_toe = structfun(@(x) cat(1, x.touchdown.toe.x_toe_r), solution);
y_toe = structfun(@(x) cat(1, x.touchdown.toe.y_toe_r), solution);

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

% title('Hip velocity vectors at touchdown')
xlabel('Horizontal displacement x [m]')
ylabel('Vertical displacement y [m]')
legend show
legend('Location', 'best')
grid on

end