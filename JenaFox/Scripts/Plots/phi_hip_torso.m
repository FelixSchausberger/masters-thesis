function phi_hip_torso(solution, best_idx)

phi.com = structfun(@(x) x.com_kinematics.phi_com, solution);
% phi.com_world = structfun(@(x) x.com_kinematics.phi_com_world, solution);
% phi.hip_r = structfun(@(x) cat(1, x.hip_kinematics.phi_hip_r), solution);
% phi.hip_r_world = structfun(@(x) cat(1, x.hip_kinematics.phi_hip_r_world), solution);
ground_state = structfun(@(x) x.ground_contact_model.ground_state, solution);
touchdown = structfun(@(x) x.touchdown.time.time, solution);

figure

hold on

names = fieldnames(phi);
for idx = 1:numel(names)
    plot(phi.(names{idx})(best_idx).time, rad2deg(phi.(names{idx})(best_idx).data), ...
    'LineWidth', 1)
end

xline(touchdown(best_idx), '-.b', 'LineWidth', 2, ...
    'DisplayName', 'Touchdown')

y = get(gca, 'YLim');

for gs = 1:max(ground_state(best_idx).data)
    if rem(gs, 2) == 0
        x = ground_state(best_idx).time(ground_state(best_idx).data == gs);
        patch([min(x) max(x) max(x) min(x)], [y(1) y(1) y(2) y(2)], ...
                'b', 'EdgeColor', 'b', 'FaceAlpha', .1, 'EdgeAlpha', .1);
    end
end

% x = get(gca, 'XLim')
% xlim([0 0.512552])
% ylim(y)

% title('Hip and torso angle of one step')
xlabel('Time [s]')
ylabel('$\vec{q}~[^\circ]$')
legend(["$\vec{q}_{3}$", "$\vec{q}_{4}$", "Touchdown", "Double support"]) % , "$\vec{q}_{3, world}$", "$\vec{q}_{4, world}$"
legend('Location', 'southoutside', 'Interpreter', 'latex')
grid on

end