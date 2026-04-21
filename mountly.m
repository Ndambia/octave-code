clc;
clear;
close all;

%% Question 10: Monty Hall Problem
% A prize is placed at random behind one of three doors.
% You always choose door 1.
% Monty opens one of the other two doors that is empty.
% Compare the probability of winning if you STAY vs if you SWITCH.

% Number of simulations
N = 100000;

stay_wins = 0;
switch_wins = 0;

for t = 1:N

    % Prize location: 1, 2, or 3
    prize = randi(3);

    % Player always chooses door 1
    choice = 1;

    % Monty must open an empty door that is not the chosen door
    possible_open = [];
    for d = 1:3
        if d ~= choice && d ~= prize
            possible_open(end+1) = d;
        end
    end

    % If Monty has two choices, choose randomly
    monty_opens = possible_open(randi(length(possible_open)));

    % Remaining unopened door
    remaining_doors = [];
    for d = 1:3
        if d ~= choice && d ~= monty_opens
            remaining_doors(end+1) = d;
        end
    end
    switch_choice = remaining_doors(1);

    % Check win if stay
    if choice == prize
        stay_wins = stay_wins + 1;
    end

    % Check win if switch
    if switch_choice == prize
        switch_wins = switch_wins + 1;
    end
end

% Estimated probabilities
p_stay = stay_wins / N;
p_switch = switch_wins / N;

% Theoretical probabilities
theory_stay = 1/3;
theory_switch = 2/3;

%% Display results
fprintf('Question 10: Monty Hall Problem\n');
fprintf('----------------------------------------\n');
fprintf('Number of simulations = %d\n\n', N);

fprintf('Estimated P(win by staying)  = %.6f\n', p_stay);
fprintf('Estimated P(win by switching)= %.6f\n\n', p_switch);

fprintf('Theoretical P(win by staying)  = %.6f\n', theory_stay);
fprintf('Theoretical P(win by switching)= %.6f\n', theory_switch);

%% Plot results
vals = [p_stay, p_switch];
theory = [theory_stay, theory_switch];

figure;
bar(vals);
hold on;
plot(1:2, theory, 'r*', 'MarkerSize', 12, 'LineWidth', 2);

set(gca, 'XTick', [1 2]);
set(gca, 'XTickLabel', {'Stay', 'Switch'});
ylabel('Probability of Winning');
ylim([0 1]);
grid on;

title({
    'Question 10: Monty Hall Problem', ...
    'Prize behind 1 of 3 doors; you always choose door 1', ...
    'Compare winning probability if you STAY or SWITCH'
});

legend('Simulation', 'Theoretical', 'Location', 'northwest');

%% Add text labels on bars
text(1, vals(1)+0.03, sprintf('%.4f', vals(1)), 'HorizontalAlignment', 'center');
text(2, vals(2)+0.03, sprintf('%.4f', vals(2)), 'HorizontalAlignment', 'center');
