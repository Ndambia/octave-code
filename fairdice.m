clc;
clear;
close all;

%% Question 17
% Show that
% P(ABC) = P(A | BC) P(B | C) P(C)

N = 200000;   % number of simulations

% Simulate two fair dice
d1 = randi(6, N, 1);
d2 = randi(6, N, 1);

% Define events A, B, C
% A: sum of dice >= 8
% B: first die is even
% C: second die >= 3
A = (d1 + d2 >= 8);
B = mod(d1, 2) == 0;
C = (d2 >= 3);

% Intersections
ABC = A & B & C;
BC  = B & C;

% Empirical probabilities
P_ABC = mean(ABC);
P_C   = mean(C);

% Conditional probabilities
P_A_given_BC = sum(ABC) / sum(BC);
P_B_given_C  = sum(BC) / sum(C);

% Right-hand side
RHS = P_A_given_BC * P_B_given_C * P_C;

%% Display results
fprintf('Question 17\n');
fprintf('--------------------------------------------------\n');
fprintf('Verify: P(ABC) = P(A|BC) P(B|C) P(C)\n\n');

fprintf('Estimated P(ABC)          = %.6f\n', P_ABC);
fprintf('Estimated P(A|BC)         = %.6f\n', P_A_given_BC);
fprintf('Estimated P(B|C)          = %.6f\n', P_B_given_C);
fprintf('Estimated P(C)            = %.6f\n', P_C);
fprintf('Right-hand side           = %.6f\n', RHS);
fprintf('Difference                = %.6e\n', abs(P_ABC - RHS));

%% Plot comparison
vals = [P_ABC, RHS];

figure;
bar(vals);
set(gca, 'XTick', [1 2]);
set(gca, 'XTickLabel', {'P(ABC)', 'P(A|BC)P(B|C)P(C)'});
ylabel('Probability');
ylim([0 1]);
grid on;

title({
    'Question 17: Show that P(ABC) = P(A|BC)P(B|C)P(C)', ...
    'Simulation using events from two fair dice', ...
    'Compare left-hand side and right-hand side'
});

text(1, vals(1)+0.03, sprintf('%.4f', vals(1)), 'HorizontalAlignment', 'center');
text(2, vals(2)+0.03, sprintf('%.4f', vals(2)), 'HorizontalAlignment', 'center');
