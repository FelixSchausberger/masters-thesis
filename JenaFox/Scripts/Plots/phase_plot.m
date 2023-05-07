function phase_plot(solution)

hdis = structfun(@(x) x.com_kinematics.y_com, solution);
hvel = structfun(@(x) x.com_kinematics.dy_com, solution);

ground_state = structfun(@(x) x.ground_contact_model.ground_state, solution);

[hdis, ground_state] = synchronize(hdis, ground_state, 'union');
[hdis, hvel] = synchronize(hdis, hvel, 'union');

figure
hold on

% surf([hdis.data hdis.data], ...
%     [hvel.data hvel.data], ...
%     [ground_state.data ground_state.data], ...  % Reshape and replicate data
%      'FaceColor', 'none', ...    % Don't bother filling faces with color
%      'EdgeColor', 'flat', ... % 'interp', ...  % Use interpolated color for edges
%      'LineWidth', 1);            % Make a thicker line
% view(2);   % Default 2-D view
% 
% colormap([0 0.57 1; 1 0.25 0; 0.25 0 1;  1 0.8 0.2])
% 
% c = colorbar('southoutside', 'Ticks', [1.375, 2.125, 2.875, 3.625]);
% % c.TickLabelInterpreter = 'latex';
% c.TickLabels = {'Single\newlinesupport (Left)', ...
%     'Double\newlinesupport', ...
%     'Single\newlinesupport (Right)', ...
%     'Double\newlinesupport'};

surf([hdis.data hdis.data], ...
    [hvel.data hvel.data], ...
    [hdis.time hdis.time], ...  % Reshape and replicate data
     'FaceColor', 'none', ...    % Don't bother filling faces with color
     'EdgeColor', 'interp', ...  % Use interpolated color for edges
     'LineWidth', 1);            % Make a thicker line
view(2);   % Default 2-D view
c = colorbar('southoutside');
c.Label.Interpreter = 'latex';
c.Label.String = 'Time $t~[s]$';
colormap(flipud(winter))

xlabel('Vertical displacement $y~[m]$')
ylabel('Vertical velocity $\dot{y}~\left[\frac{m}{s}\right]$')
grid on

end
