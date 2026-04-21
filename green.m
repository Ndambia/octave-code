clc;
clear;
close all;

%% Question 12
% There are three cards:
% 1) GG  -> green on both sides
% 2) RR  -> red on both sides
% 3) GR  -> green on one side and red on the other
%
% A card is chosen at random and one side is seen at random.
% If the side we see is green, what is the probability that the other side is also green?

N = 100000;   % number of simulations

green_seen_count = 0;
other_green_count = 0;

for t = 1:N

    % Pick one card at random:
    % 1 = GG, 2 = RR, 3 = GR
    card = randi(3);

    % Randomly choose which side is seen
    side = randi(2);

    % Define the cards
    if card == 1
        % GG card
        sides = ['G', 'G'];
    elseif card == 2
        % RR card
        sides = ['R', 'R'];
    else
        % GR card
        sides = ['G', 'R'];
    end

    seen_side = sides(side);
    other_side = sides(3 - side);   % if side=1 -> 2, if side=2 -> 1

    % Condition on seeing green
    if seen_side == 'G'
        green_seen_count = green_seen_count + 1;

        if other_side == 'G'
            other_green_count = other_green_count + 1;
        end
    end
end

% Estimated conditional probability
p_est = other_green_count / green_seen_count;

% Theoretical probability
p_theory = 2/3;

%% Display results
fprintf('Question 12\n');
fprintf('--------------------------------------------------\n');
fprintf('Estimated P(other side is green | seen side is green) = %.6f\n', p_est);
fprintf('Theoretical probability                              = %.6f\n', p_theory);
fprintf('Difference                                           = %.6e\n', abs(p_est - p_theory));

%% Plot
vals = [p_est, p_theory];

figure;
bar(vals);
set(gca, 'XTick', [1 2]);
set(gca, 'XTickLabel', {'Simulation', 'Theoretical'});
ylabel('Probability');
ylim([0 1]);
grid on;

title({
    'Question 12: Three-card problem', ...
    'If the side we see is green, what is the probability the other side is also green?', ...
    'Compare simulation result with the correct answer 2/3'
});

text(1, vals(1)+0.03, sprintf('%.4f', vals(1)), 'HorizontalAlignment', 'center');
text(2, vals(2)+0.03, sprintf('%.4f', vals(2)), 'HorizontalAlignment', 'center');
