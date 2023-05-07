function GM_h(solution, best_idx)

GM_h = structfun(@(x) cat(1, x.output.GM_h), solution);
plot.uMotorHipR = structfun(@(x) cat(1, max(x.U_motor_hip_r.data)), solution);
plot.lambdaProj = structfun(@(x) cat(1, max(x.mechanical_cost_analysis.lambda_proj.data)), solution);

legend = ["Hip motor voltage [V]", "Lambda proj [deg]"];

figure

names = fieldnames(plot);
for idx = 1:numel(names)
    subplot(2, 1, idx)
    hold on
    scatter(GM_h, plot.(names{idx}), 200, 'x', 'LineWidth', 3)
    scatter(GM_h(best_idx), plot.(names{idx})(best_idx), 300, 'x', 'LineWidth', 3)
    xlabel('Hip Motor Gain')
    ylabel(legend(idx))
    grid on
end

end
