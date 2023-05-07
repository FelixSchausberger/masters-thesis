function x_vs_vphi(solution, x, best_idx)

plot.vphiKneeR = structfun(@(y) y.output.best_IC(4), solution);
plot.vphiHipR = structfun(@(y) y.output.best_IC(5), solution);
plot.vphiTorso = structfun(@(y) y.output.best_IC(6), solution);

legend = ["vPhi knee r", "vPhi hip r", "vPhi torso"];

figure

names = fieldnames(plot);
for idx = 1:numel(names)
    subplot(3, 1, idx)
    hold on
    scatter(x.data, plot.(names{idx}), 200, 'x', 'LineWidth', 3)
    scatter(x.data(best_idx), plot.(names{idx})(best_idx), 300, 'x', 'LineWidth', 3)
    xlabel(x.name)
    ylabel([legend(idx), ' [deg/s]'])
    grid on
end

end
