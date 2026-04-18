clc;
clear;

disp('Gaussian Elimination Solver');
disp('---------------------------');

% Number of variables
n = input('Enter the number of variables: ');

% Input matrix A
disp('Enter the coefficient matrix A row by row, using MATLAB format:');
disp('Example for 3 variables: [2 1 -1; -3 -1 2; -2 1 2]');
A = input('A = ');

% Input vector b
disp('Enter the constant vector b in column form:');
disp('Example: [8; -11; -3]');
b = input('b = ');

% Check dimensions
if size(A,1) ~= n || size(A,2) ~= n
    error('Matrix A must be %d x %d.', n, n);
end

if size(b,1) ~= n || size(b,2) ~= 1
    error('Vector b must be %d x 1.', n);
end

% Form augmented matrix
Aug = [A b];

disp(' ');
disp('Initial Augmented Matrix:');
disp(Aug);

% Gaussian elimination with partial pivoting
for k = 1:n-1
    % Find pivot row
    [~, max_row] = max(abs(Aug(k:n, k)));
    max_row = max_row + k - 1;

    % Check for zero pivot
    if Aug(max_row, k) == 0
        error('The system has no unique solution.');
    end

    % Swap rows if needed
    if max_row ~= k
        temp = Aug(k, :);
        Aug(k, :) = Aug(max_row, :);
        Aug(max_row, :) = temp;
    end

    % Eliminate entries below pivot
    for i = k+1:n
        factor = Aug(i, k) / Aug(k, k);
        Aug(i, :) = Aug(i, :) - factor * Aug(k, :);
    end
end

disp(' ');
disp('Upper Triangular Matrix:');
disp(Aug);

% Back substitution
x = zeros(n,1);

if Aug(n,n) == 0
    error('The system has no unique solution.');
end

x(n) = Aug(n,n+1) / Aug(n,n);

for i = n-1:-1:1
    x(i) = (Aug(i,n+1) - Aug(i,i+1:n)*x(i+1:n)) / Aug(i,i);
end

disp(' ');
disp('Solution:');
disp(x);
