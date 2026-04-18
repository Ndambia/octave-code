clc;
clear;
close all;

% If you have the signal package, load it
% pkg load signal

% Coefficients of X(z) = sum_{n=0}^{9} (1/2)^n z^{-n}
b = (1/2).^(0:9);

% Zeros
z = roots(b);

% Poles: 9 poles at origin
p = zeros(9,1);

disp('Zeros:');
disp(z);

disp('Poles:');
disp(p);

% Create figure
figure(1);
clf;
hold on;
grid on;
axis equal;

% Unit circle
th = linspace(0, 2*pi, 500);
plot(cos(th), sin(th), 'k--', 'linewidth', 1.2);

% Plot zeros
plot(real(z), imag(z), 'bo', 'markersize', 8, 'linewidth', 2);

% Plot poles
plot(real(p), imag(p), 'rx', 'markersize', 10, 'linewidth', 2);

xlabel('Real Part');
ylabel('Imaginary Part');
title('Pole-Zero Plot');

legend('Unit Circle', 'Zeros', 'Poles');
xlim([-1 1]);
ylim([-1 1]);

hold off;
drawnow;
