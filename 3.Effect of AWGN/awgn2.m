% Clear previous workspace, close all figures, and clear the command window
clear all;
close all;
clc;

% Sampling frequency and duration
Fs = 1000;  % Sampling frequency in Hz
T = 1;      % Duration in seconds
t = 0:1/Fs:(T-1/Fs);  % Time vector

% Signal parameters
f_signal = 10;  % Frequency of the signal in Hz
A_signal = 1;   % Amplitude of the signal

% Signal generation
% Choose one of the following signal types by uncommenting the desired line
signal = A_signal * (2 * pi * f_signal * t);  % Ramp signal
% signal = A_signal * sin(2 * pi * f_signal * t);  % Sine wave signal
% signal = A_signal * square(20 * t);  % Square wave signal

% Signal-to-noise ratio (SNR) in dB
SNR_dB = 1;    % SNR in dB for the first noisy signal
SNR_dB1 = 20;  % SNR in dB for the second noisy signal
SNR_dB2 = -10; % SNR in dB for the third noisy signal

% Calculate noise power and generate noise
noise_power = var(signal) / (10^(SNR_dB / 10));
noise_power1 = var(signal) / (10^(SNR_dB1 / 10));
noise_power2 = var(signal) / (10^(SNR_dB2 / 10));

noise = sqrt(noise_power) * randn(size(t));
noise1 = sqrt(noise_power1) * randn(size(t));
noise2 = sqrt(noise_power2) * randn(size(t));

% Add noise to the signal
noisy_signal = signal + noise;
noisy_signal1 = signal + noise1;
noisy_signal2 = signal + noise2;

% Plot original and noisy signals in a single figure with subplots
figure;

% Original signal plot
subplot(2, 3, 1);
plot(t, signal, 'r-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Noisy signal with 1 dB SNR
subplot(2, 3, 4);
plot(t, noisy_signal, 'b-', 'LineWidth', 2);
title('Noisy Signal (1 dB SNR)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Original signal plot for comparison
subplot(2, 3, 2);
plot(t, signal, 'r-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Noisy signal with 20 dB SNR
subplot(2, 3, 5);
plot(t, noisy_signal1, 'b-', 'LineWidth', 2);
title('Noisy Signal (20 dB SNR)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Original signal plot for comparison
subplot(2, 3, 3);
plot(t, signal, 'r-', 'LineWidth', 2);
title('Original Signal');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Noisy signal with -10 dB SNR
subplot(2, 3, 6);
plot(t, noisy_signal2, 'b-', 'LineWidth', 2);
title('Noisy Signal (-10 dB SNR)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;
