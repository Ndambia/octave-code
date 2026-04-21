clc;
clear;
close all;

%% Question 23
% (Computer Experiment)
% Simulate draws from a fair die and verify that
% P(AB) = P(A)P(B) for
% A = {2,4,6},  B = {1,2,3,4}
% Then find two events that are not independent and compare
% empirical and theoretical probabilities.

N = 100000;   % number of simulations

% Simulate fair die rolls
X = randi(6, N, 1);

%% Part 1: Independent events from the question
A = (X == 2 | X == 4 | X == 6);        % A = {2,4,6}
B = (X == 1 | X == 2 | X == 3 | X == 4); % B = {1,2,3,4}

% Empirical probabilities
P_A_hat  = mean(A);
P_B_hat  = mean(B);
P_AB_hat = mean(A & B);
P_prod_hat = P_A_hat * P_B_hat;

% Theoretical probabilities
P_A_theory  = 1/2;
P_B_theory  = 2/3;
P_AB_theory = 1/3;
P_prod_theory = P_A_theory * P_B_theory;

%% Part 2: Choose dependent events
% Let C = {1,2}, D = {2,3}
% Then C and D are NOT independent
C = (X == 1 | X == 2);
D = (X == 2 | X == 3);

% Empirical probabilities
P_C_hat  = mean(C);
P_D_hat  = mean(D);
P_CD_hat = mean(C & D);
P_prod_CD_hat = P_C_hat * P_D_hat;

% Theoretical probabilities
P_C_theory  = 2/6;   % 1/3
P_D_theory  = 2/6;   % 1/3
P_CD_theory = 1/6;   % only outcome 2
P_prod_CD_theory = P_C_theory * P_D_theory; % 1/9

%% Display results
fprintf('Question 23 Results\n');
fprintf('--------------------------------------------------\n');

fprintf('Independent case:\n');
fprintf('P_hat(A)      = %.6f\n', P_A_hat);
fprintf('P_hat(B)      = %.6f\n', P_B_hat);
fprintf('P_hat(AB)     = %.6f\n', P_AB_hat);
fprintf('P_hat(A)P_hat(B) = %.6f\n', P_prod_hat);
fprintf('Theoretical P(A)      = %.6f\n', P_A_theory);
fprintf('Theoretical P(B)      = %.6f\n', P_B_theory);
fprintf('Theoretical P(AB)     = %.6f\n', P_AB_theory);
fprintf('Theoretical P(A)P(B)  = %.6f\n\n', P_prod_theory);

fprintf('Dependent case:\n');
fprintf('P_hat(C)      = %.6f\n', P_C_hat);
fprintf('P_hat(D)      = %.6f\n', P_D_hat);
fprintf('P_hat(CD)     = %.6f\n', P_CD_hat);
fprintf('P_hat(C)P_hat(D) = %.6f\n', P_prod_CD_hat);
fprintf('Theoretical P(C)      = %.6f\n', P_C_theory);
fprintf('Theoretical P(D)      = %.6f\n', P_D_theory);
fprintf('Theoretical P(CD)     = %.6f\n', P_CD_theory);
fprintf('Theoretical P(C)P(D)  = %.6f\n', P_prod_CD_theory);

%% Plot results
figure;

% Independent case
subplot(2,1,1);
vals1_sim = [P_A_hat, P_B_hat, P_AB_hat, P_prod_hat];
vals1_theory = [P_A_theory, P_B_theory, P_AB_theory, P_prod_theory];

bar([vals1_sim; vals1_theory]');
set(gca, 'XTickLabel', {'P(A)', 'P(B)', 'P(AB)', 'P(A)P(B)'});
ylabel('Probability');
legend('Simulation', 'Theoretical', 'Location', 'northwest');
grid on;
title({
    'Question 23: Independent events', ...
    'A = {2,4,6}, B = {1,2,3,4}', ...
    'Verify that P(AB) = P(A)P(B)'
});

% Dependent case
subplot(2,1,2);
vals2_sim = [P_C_hat, P_D_hat, P_CD_hat, P_prod_CD_hat];
vals2_theory = [P_C_theory, P_D_theory, P_CD_theory, P_prod_CD_theory];

bar([vals2_sim; vals2_theory]');
set(gca, 'XTickLabel', {'P(C)', 'P(D)', 'P(CD)', 'P(C)P(D)'});
ylabel('Probability');
legend('Simulation', 'Theoretical', 'Location', 'northwest');
grid on;
title({
    'Question 23: Dependent events', ...
    'C = {1,2}, D = {2,3}', ...
    'Compare P(CD) with P(C)P(D)'
});
