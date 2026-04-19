clc;
clear;
close all;

% Parameters
A   = 1;      % peak amplitude
tau = 1;      % period between zeros in the rectified waveform
N   = 8;      % number of harmonics to show on each side

F0 = 1/tau;

%% -------------------------------
%% 1) Time-domain signal x_a(t)
%% x_a(t) = A * |sin(pi t / tau)|
%% -------------------------------
t = linspace(-tau, 2*tau, 2000);
xa = A * abs(sin(pi * t / tau));

figure(1);
plot(t, xa, 'linewidth', 2);
grid on;
xlabel('t');
ylabel('x_a(t)');
title('Full-Wave Rectified Sinusoid');
ylim([0, 1.2*A]);

%% -----------------------------------------
%% 2) Line spectrum X_a(F)
%% c0 = 2A/pi
%% c_{±n} = -2A / (pi*(4n^2 - 1))
%% -----------------------------------------
k = -N:N;
ck = zeros(size(k));

for i = 1:length(k)
    if k(i) == 0
        ck(i) = 2*A/pi;
    else
        n = abs(k(i));
        ck(i) = -2*A / (pi * (4*n^2 - 1));
    end
end

F = k * F0;

figure(2);
stem(F, ck, 'filled', 'linewidth', 1.5);
grid on;
xlabel('Frequency F');
ylabel('c_k');
title('Line Spectrum X_a(F)');
xlim([-(N+1)*F0, (N+1)*F0]);

%% -----------------------------------------
%% 3) Power Spectral Density S_x(F)
%% |c0|^2 = (2A/pi)^2
%% |c_{±n}|^2 = [2A/(pi*(4n^2-1))]^2
%% -----------------------------------------
Sk = abs(ck).^2;

figure(3);
stem(F, Sk, 'filled', 'linewidth', 1.5);
grid on;
xlabel('Frequency F');
ylabel('|c_k|^2');
title('Power Spectral Density S_x(F)');
xlim([-(N+1)*F0, (N+1)*F0]);

%% -----------------------------------------
%% 4) Print values for manual sketching
%% -----------------------------------------
disp('Frequency locations F = k/tau and Fourier coefficients c_k:');
disp([F(:), ck(:)]);

disp('Frequency locations F = k/tau and PSD line heights |c_k|^2:');
disp([F(:), Sk(:)]);
