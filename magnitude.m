clc;
clear;
close all;

N = 6;
k = 0:N-1;

mag = [0 2 0 0 0 2];
ph  = [NaN 5*pi/6 NaN NaN NaN -5*pi/6];

figure;

subplot(2,1,1);
stem(k, mag, 'filled', 'LineWidth', 2);
grid on;
xlabel('k');
ylabel('|a_k|');
title('Magnitude Spectrum');

subplot(2,1,2);
stem(k, ph, 'filled', 'LineWidth', 2);
grid on;
xlabel('k');
ylabel('Phase(a_k) [rad]');
title('Phase Spectrum');
ylim([-pi pi]);
yticks([-pi -5*pi/6 0 5*pi/6 pi]);
yticklabels({'-\pi','-5\pi/6','0','5\pi/6','\pi'});
