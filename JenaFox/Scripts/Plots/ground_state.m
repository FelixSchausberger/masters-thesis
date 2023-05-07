function ground_state(solution)

dx_com = structfun(@(x) x.com_kinematics.dx_com, solution);
dy_com = structfun(@(x) x.com_kinematics.dy_com, solution);
ground_state = structfun(@(x) x.ground_contact_model.ground_state, solution);

figure
hold on

plot(dx_com.time, dx_com.data, 'LineWidth', 3);
plot(dy_com.time, dy_com.data, 'LineWidth', 3);
plot(ground_state.time, ground_state.data, 'LineWidth', 3);

% title('Ground contact')
xlabel('Time$~[s]$')
ylabel('Ground state')
% legend('GC right', 'GC left')
% ylim([-.2 1.2])
% xlim([9 15])
grid on

end
