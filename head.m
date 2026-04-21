clc;
clear;
close all;

%% Question 21
% (Computer Experiment)
% Suppose a coin has probability p of falling heads up.
% Take p = 0.3 and n = 1000, and simulate n coin flips.
% Plot the proportion of heads as a function of n.
% Repeat for p = 0.03.

n = 1000;
k = 1:n;

%% Case 1: p = 0.3
p1 = 0.3;
flips1 = rand(1, n) < p1;          % 1 = head, 0 = tail
cum_heads1 = cumsum(flips1);
prop_heads1 = cum_heads1 ./ k;

figure;
plot(k, prop_heads1, 'b', 'LineWidth', 1.5);
hold on;
plot(k, p1 * ones(1, n), 'r--', 'LineWidth', 1.5);
grid on;
xlabel('Number of flips, n');
ylabel('Proportion of heads');
title({
    'Question 21: Coin-flip computer experiment', ...
    'p = 0.3, n = 1000', ...
    'Plot of running proportion of heads as a function of n'
});
legend('Simulated proportion', 'True p = 0.3', 'Location', 'best');

%% Case 2: p = 0.03
p2 = 0.03;
flips2 = rand(1, n) < p2;
cum_heads2 = cumsum(flips2);
prop_heads2 = cum_heads2 ./ k;

figure;
plot(k, prop_heads2, 'b', 'LineWidth', 1.5);
hold on;
plot(k, p2 * ones(1, n), 'r--', 'LineWidth', 1.5);
grid on;
xlabel('Number of flips, n');
ylabel('Proportion of heads');
title({
    'Question 21: Coin-flip computer experiment', ...
    'p = 0.03, n = 1000', ...
    'Plot of running proportion of heads as a function of n'
});
legend('Simulated proportion', 'True p = 0.03', 'Location', 'best');

%% Display final proportions
fprintf('Question 21 Results\n');
fprintf('-------------------------------------\n');
fprintf('For p = 0.30, final simulated proportion = %.4f\n', prop_heads1(end));
fprintf('For p = 0.03, final simulated proportion = %.4f\n', prop_heads2(end));
