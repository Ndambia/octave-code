clc;
clear;
close all;

% Parameters
A = 1;
a = 2;

% Frequency axis
F = linspace(-5, 5, 2000);   % adjust range if needed

%% ----------------------------------
%% 4.2(a)  x_a(t) = A e^{-at} u(t)
%% X_a(F) = A / (a + j2piF)
%% ----------------------------------
Xa = A ./ (a + 1j*2*pi*F);

mag_Xa   = abs(Xa);
phase_Xa = angle(Xa);   % in radians

figure(1);

subplot(2,1,1);
plot(F, mag_Xa, 'LineWidth', 2);
grid on;
xlabel('F');
ylabel('|X_a(F)|');
title('4.2(a) Magnitude Spectrum');

subplot(2,1,2);
plot(F, phase_Xa, 'LineWidth', 2);
grid on;
xlabel('F');
ylabel('Phase(X_a(F)) [rad]');
title('4.2(a) Phase Spectrum');

%% ----------------------------------
%% 4.2(b)  x_a(t) = A e^{-a|t|}
%% X_a(F) = 2Aa / (a^2 + (2piF)^2)
%% ----------------------------------
Xb = (2*A*a) ./ (a^2 + (2*pi*F).^2);

mag_Xb   = abs(Xb);
phase_Xb = angle(Xb);   % should be zero

figure(2);

subplot(2,1,1);
plot(F, mag_Xb, 'LineWidth', 2);
grid on;
xlabel('F');
ylabel('|X_a(F)|');
title('4.2(b) Magnitude Spectrum');

subplot(2,1,2);
plot(F, phase_Xb, 'LineWidth', 2);
grid on;
xlabel('F');
ylabel('Phase(X_a(F)) [rad]');
title('4.2(b) Phase Spectrum');
