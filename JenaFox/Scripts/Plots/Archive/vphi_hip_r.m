function vphi_hip_r(solution, GM_h, offset, best_idx)

IC_vphi_hip_r = structfun(@(x) cat(1, x.hip_kinematics.vphi_hip_r_world.data(1)), solution);
touchdown_vphi_hip_r = structfun(@(x) cat(1, x.touchdown.vphi_hip_r_world), solution);
x = linspace(0, 2);

figure

subplot(2, 1, 1)
hold on

for idx = 1:length(IC_vphi_hip_r)
    
    if idx == best_idx
        LineSpec = '--';
    else
        LineSpec = '-';
    end

    plot(x, linspace(IC_vphi_hip_r(idx), touchdown_vphi_hip_r(idx)), ...
        LineSpec, 'LineWidth', (1 + idx/5), 'DisplayName', ...
        ['GM_h: ' num2str(GM_h(idx))  ', Offset: ' num2str(offset(idx))])
end

xticks([0 2])
xticklabels({'0', 'TD'})
xlabel('Time [s]')
ylabel('Angular hip velocity [deg/s]')
legend show
grid on


vphi_hip_r = structfun(@(x) cat(1, x.hip_kinematics.vphi_hip_r_world), solution);
touchdown = structfun(@(x) x.touchdown.time, solution);

subplot(2, 1, 2)
hold on
for idx = 1:numel(vphi_hip_r)

    if idx == best_idx
        LineSpec = '--';
    else
        LineSpec = '-';
    end
    
    plot(vphi_hip_r(idx).time, vphi_hip_r(idx).data, LineSpec, ...
        'LineWidth', (1 + idx/5), 'DisplayName', ...
        ['GM_h: ' num2str(GM_h(idx))  ', Offset: ' num2str(offset(idx))])
    xline(touchdown(idx), '-.b', 'LineWidth', 2, 'HandleVisibility', 'off');
end
xlabel('Time [s]')
ylabel('Angular hip velocity [deg/s]')
legend show
grid on

end