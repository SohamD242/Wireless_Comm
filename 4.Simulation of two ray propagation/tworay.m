% Clear the workspace, close all figures, and clear the command window
clear all;
close all;
clc;

% Define constants and parameters
freq = 9e8;  % Frequency in Hz (9 x 10^8 Hz)
c = 3e8;    % Speed of light in m/s (3 x 10^8 m/s)
lambda = c / freq;  % Wavelength in meters
d = 1:0.1:100000;  % Distance range from 1 to 100,000 meters with step size 0.1
ht = 50;    % Transmitter height in meters
hr = 2;     % Receiver height in meters
Gref = 1;   % Reflection gain
Glos = 1;   % Line-of-sight gain
Pt = 1e-3;  % Transmitter power in watts (10^-3 W)

% Calculate distances for line-of-sight and reflected rays
dlos = sqrt(d.^2 + (ht - hr)^2);  % Line-of-sight distance
dref = sqrt(d.^2 + (ht + hr)^2);  % Reflected ray distance

% Two-ray ground reflection model
gamma = -1;  % Reflection coefficient (ground reflection)
phi = (2 * pi * (dref - dlos)) / lambda;  % Phase shift due to reflection

% Calculate received power
Pr = Pt * (lambda / (4 * pi))^2 * ...
    abs((sqrt(Glos) ./ dlos) + (gamma * sqrt(Gref) * exp(-1i * phi)) ./ dref).^2;

% Plot received power vs. distance (linear scale)
figure;
semilogx(d, Pr, 'b-', 'LineWidth', 2);
xlabel("Distance (m)");
ylabel("Received Power (W)");
title("Received Power vs. Distance");
grid on;

% Convert received power to decibels (dB)
Pr_db = 10 * log10(Pr);

% Plot received power vs. distance (logarithmic scale)
figure;
semilogx(d, Pr_db, 'r-', 'LineWidth', 2);
xlabel("Distance (m)");
ylabel("Received Power (dB)");
title("Received Power vs. Distance (in Decibels)");
grid on
