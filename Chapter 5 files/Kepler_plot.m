% Plot Kepler's Equation: E-e*sin(E) = M
% August 23, 2016
% Brent Deschamp

e = 0.048;  % eccentricity for Jupiter
M = pi/4;   % mean anomaly

%Create values for E
E_vals = linspace(0,2*pi);
E_vals_finer = linspace(0,1);
E_vals_finer_still = linspace(0.7,0.9);

% Define function
Kepler = E_vals - e*sin(E_vals) - M;
Kepler_finer = E_vals_finer - e*sin(E_vals_finer) - M;
Kepler_finer_still = E_vals_finer_still - e*sin(E_vals_finer_still) - M;

subplot(3,1,1);
plot(E_vals,Kepler);
grid
title(['Plotting Kepler''s Equation with e=' num2str(e)]);

subplot(3,1,2)
plot(E_vals_finer,Kepler_finer);
grid

subplot(3,1,3)
plot(E_vals_finer_still,Kepler_finer_still);
grid