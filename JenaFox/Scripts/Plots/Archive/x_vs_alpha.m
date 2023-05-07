function x_vs_alpha(solution, x, best_idx)

alpha = structfun(@(x) x.touchdown.alpha.alpha, solution);
AEA = structfun(@(x) x.touchdown.mca.AEA, solution);
lambda_proj = structfun(@(x) x.touchdown.mca.lambda_proj, solution);

figure

hold on
scatter(x.data, AEA, 200, 'x', 'DisplayName', 'AEA', 'LineWidth', 3)
scatter(x.data, alpha, 200, 'x', 'DisplayName', 'Angle of Attack', 'LineWidth', 3)
scatter(x.data, lambda_proj, 200, 'x', 'DisplayName', 'Projected lambda', 'LineWidth', 3)
% scatter(x.data(best_idx), AEA(best_idx), 300, 'x', 'DisplayName', 'Best AEA', 'LineWidth', 3, 'color', 'g')
% scatter(x.data(best_idx), alpha(best_idx), 300, 'x', 'DisplayName', 'Best alpha', 'LineWidth', 3, 'color', 'g')
% scatter(x.data(best_idx), lambda_proj(best_idx), 300, 'x', 'DisplayName', 'Best lambda proj', 'LineWidth', 3, 'color', 'g')
xlabel(x.name)
legend show
grid on

end