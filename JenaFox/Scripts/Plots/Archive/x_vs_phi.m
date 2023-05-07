function x_vs_phi(solution, x, best_idx)

plot.phiKneeR = structfun(@(y) y.output.best_IC(1), solution);
plot.phiHipR = structfun(@(y) y.output.best_IC(2), solution);
plot.phiTorso = structfun(@(y) y.output.best_IC(3), solution);

legend = ["Phi knee r", "Phi hip r", "Phi torso"];

figure

names = fieldnames(plot);
for idx = 1:numel(names)
    subplot(3, 1, idx)
    hold on
    scatter(x.data, plot.(names{idx}), 200, 'x', 'LineWidth', 3)
    scatter(x.data(best_idx), plot.(names{idx})(best_idx), 300, 'x', 'LineWidth', 3)
    xlabel(x.name)
    ylabel([legend(idx), ' [deg]'])
    grid on
end

end
