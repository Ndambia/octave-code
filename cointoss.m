clc;
clear;
close all;

% Maximum number of tosses to display
k_max = 10;

%% Question 5
% Suppose we toss a fair coin until we get exactly two heads.
% Probability that exactly k tosses are required:
% P(N = k) = (k - 1)/2^k, for k >= 2

k = 2:k_max;
P = (k - 1) ./ (2 .^ k);

disp('Values of k and P(N = k):');
disp('   k        Probability');
for i = 1:length(k)
    fprintf('%4d    %10.6f\n', k(i), P(i));
end

%% Plot
figure;
stem(k, P, 'filled', 'LineWidth', 1.5);
xlabel('Number of tosses, k');
ylabel('P(N = k)');
title('Question 5: Probability that exactly k tosses are required');
grid on;

%% Generate sample space outcomes up to length k_max
sample_space = {};

for n = 2:k_max
    for firstH = 1:(n-1)
        seq = repmat('T', 1, n);
        seq(firstH) = 'H';
        seq(n) = 'H';
        sample_space{end+1} = seq;
    end
end

disp(' ');
disp('Sample space outcomes up to k_max:');
for i = 1:length(sample_space)
    disp(sample_space{i});
end

%% Partial sum check
partial_sum = sum(P);
fprintf('\nSum of probabilities from k=2 to k=%d: %.6f\n', k_max, partial_sum);
