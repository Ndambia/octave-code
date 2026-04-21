clc;
clear;
close all;

%% Question 15
% The probability that a child has blue eyes is 1/4.
% Assume independence between children.
% Consider a family with 3 children.
%
% (a) If it is known that at least one child has blue eyes,
%     what is the probability that at least two children have blue eyes?
%
% (b) If it is known that the youngest child has blue eyes,
%     what is the probability that at least two children have blue eyes?

N = 100000;      % number of simulations
p = 1/4;         % probability a child has blue eyes

% Simulate families: 1 = blue eyes, 0 = not blue
families = rand(N, 3) < p;

% Number of blue-eyed children in each family
num_blue = sum(families, 2);

% Youngest child is column 3
youngest_blue = families(:, 3) == 1;

%% Part (a): P(at least 2 blue | at least 1 blue)
cond_a = (num_blue >= 1);
event_a = (num_blue >= 2);

p_a_sim = sum(event_a & cond_a) / sum(cond_a);

% Theoretical value:
% P(at least 2) / P(at least 1)
p_at_least_2 = nchoosek(3,2)*(p^2)*(1-p) + p^3;
p_at_least_1 = 1 - (1-p)^3;
p_a_theory = p_at_least_2 / p_at_least_1;

%% Part (b): P(at least 2 blue | youngest blue)
cond_b = youngest_blue;
event_b = (num_blue >= 2);

p_b_sim = sum(event_b & cond_b) / sum(cond_b);

% Theoretical value:
% Given youngest is blue, need at least 1 of first 2 also blue
p_b_theory = 1 - (1-p)^2;

%% Display results
fprintf('Question 15\n');
fprintf('--------------------------------------------------\n');
fprintf('(a) P(at least 2 blue | at least 1 blue)\n');
fprintf('    Simulation  = %.6f\n', p_a_sim);
fprintf('    Theoretical = %.6f\n\n', p_a_theory);

fprintf('(b) P(at least 2 blue | youngest blue)\n');
fprintf('    Simulation  = %.6f\n', p_b_sim);
fprintf('    Theoretical = %.6f\n', p_b_theory);

%% Plot results
data = [p_a_sim, p_a_theory;
        p_b_sim, p_b_theory];

figure;
bar(data);

set(gca, 'XTick', [1 2]);
set(gca, 'XTickLabel', {'Part (a)', 'Part (b)'});
ylabel('Conditional Probability');
ylim([0 1]);
legend('Simulation', 'Theoretical', 'Location', 'northwest');
grid on;

title({
    'Question 15: Blue-eye probability problem', ...
    'P(blue eyes) = 1/4, independent children, family of 3', ...
    '(a) P(at least 2 | at least 1),   (b) P(at least 2 | youngest blue)'
});

% Add value labels above bars
for i = 1:2
    for j = 1:2
        x = i + (j-1.5)*0.15;
        y = data(i,j);
        text(x, y+0.03, sprintf('%.4f', y), 'HorizontalAlignment', 'center');
    end
end
