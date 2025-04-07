%% 找出Random-SBL的收敛点
function plot_converge_sbl(map, target_index)
    % 加载数据
    load(sprintf('output/map_%d/result%d.mat', map, map));
    
    % 获取目标信号的 mu_norm 数据
    target_signal = result_random_sbl(target_index);
    
    % 绘制 SBL 中 mu_norm 随迭代次数变化图
    figure('Visible', 'off');
    hold on;
    plot(target_signal.beta_cur, '-o', 'MarkerFaceColor', 'b', 'MarkerSize', 5, 'DisplayName', ...
        sprintf('Sampling rate = %.2f', sample_rate_values(target_index)));  % 使用圆点标记数据点
    
    % % 获取收敛点并绘制
    % converge_iter = target_signal.converge_point;
    % if converge_iter ~= 1
    %     % 红色圆点表示收敛点
    %     plot(converge_iter, target_signal.beta_cur(converge_iter), 'ro', 'MarkerFaceColor', 'r', ...
    %         'MarkerSize', 5, 'DisplayName', 'Converge point');  
    %     % 标注迭代次数
    %     text(converge_iter+7, target_signal.beta_cur(converge_iter)+1, ...
    %         sprintf('converge at %d-th iteration', converge_iter), ...
    %         'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10, 'Color', 'r');
    % end
    
    hold off;
    
    xlabel('iteration time');
    ylabel('beta');
    title('Beta value vs. Iteration times');
    legend('show');
    grid on;
    
    set(gcf, 'Position', [350, 150, 1000, 600]);  % 设置窗口大小和位置
%     saveas(gcf, sprintf('output/map_%d/RandomSBL_rate=%.2f.png', map, sample_rate_values(target_index)));

end

