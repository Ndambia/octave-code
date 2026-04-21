clc;
clear;
close all;

% Maximum number of tosses to display
k_max = 10;

%% Probability that exactly k tosses are required
% P(N = k) = (k - 1)/2^k,  k >= 2

k = 2:k_max;
P = (k - 1) ./ (2 .^ k);

disp('Values of k and P(N = k):');
disp('   k        Probability');
for i = 1:length(k)
    fprintf('%4d    %10.6f\n', k(i), P(i));
end

%% Plot the probability mass function
figure;
stem(k, P, 'filled', 'LineWidth', 1.5);
xlabel('k');
ylabel('P(N = k)');
title('Probability that exactly k tosses are required');
grid on;

%% Generate sample space outcomes up to length k_max
% Each outcome ends exactly when the second head appears

sample_space = {};

for n = 2:k_max
    for firstH = 1:(n-1)
        seq = repmat('T', 1, n);   % start with all tails
        seq(firstH) = 'H';         % first head
        seq(n) = 'H';              % second head at last toss
        sample_space{end+1} = seq;
    end
end

disp(' ');
disp('Sample space outcomes up to k_max:');
for i = 1:length(sample_space)
    disp(sample_space{i});
end

%% Partial sum of probabilities
partial_sum = sum(P);
fprintf('\nSum of probabilities from k=2 to k=%d: %.6f\n', k_max, partial_sum);

%% Approximate full sum
k_large = 2:100;
P_large = (k_large - 1) ./ (2 .^ k_large);
fprintf('Approximate total sum up to k=100: %.6f\n', sum(P_large));
