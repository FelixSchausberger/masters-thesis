function x_vs_cost(x, cost, best_idx)

figure
hold on
scatter(x.data, cost, 200, 'x', 'LineWidth', 3)
scatter(x.data(best_idx), cost(best_idx), 300, 'x', 'LineWidth', 3)
xlabel(x.name)
ylabel('Cost')
grid on

end