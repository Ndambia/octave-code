clc;
clear;
close all;

%% Question
% Suppose that A and B are independent events.
% Show that A^c and B^c are independent events.

% Number of simulations
N = 100000;

% Choose probabilities for independent events A and B
pA = 0.4;
pB = 0.7;

% Simulate A and B independently
A = rand(N,1) < pA;
B = rand(N,1) < pB;

% Complements
Ac = ~A;
Bc = ~B;

% Estimated probabilities
P_Ac = mean(Ac);
P_Bc = mean(Bc);
P_AcBc = mean(Ac & Bc);
P_product = P_Ac * P_Bc;

% Display results
fprintf('Question: Suppose that A and B are independent events.\n');
fprintf('Show that A^c and B^c are independent events.\n\n');

fprintf('Estimated P(A^c)        = %.6f\n', P_Ac);
fprintf('Estimated P(B^c)        = %.6f\n', P_Bc);
fprintf('Estimated P(A^c ∩ B^c)  = %.6f\n', P_AcBc);
fprintf('Estimated P(A^c)P(B^c)  = %.6f\n', P_product);
fprintf('Difference              = %.6e\n', abs(P_AcBc - P_product));

%% Plot comparison
vals = [P_AcBc, P_product];

figure;
bar(vals);
set(gca, 'XTick', [1 2]);
set(gca, 'XTickLabel', {'P(A^c \cap B^c)', 'P(A^c)P(B^c)'});
ylabel('Probability');
ylim([0 1]);
grid on;

title({
    'Question: Suppose that A and B are independent events', ...
    'Show that A^c and B^c are independent events', ...
    'Simulation check: compare P(A^c \cap B^c) and P(A^c)P(B^c)'
});

% Add value labels
text(1, vals(1)+0.03, sprintf('%.4f', vals(1)), 'HorizontalAlignment', 'center');
text(2, vals(2)+0.03, sprintf('%.4f', vals(2)), 'HorizontalAlignment', 'center');
