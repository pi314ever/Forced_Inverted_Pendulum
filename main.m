%% Inverted Forced Double Pendulum Main
% Project 3
%% Setup
P.g = 9.81; % Gravity [m/s^2]
P.l = [1 1]; % Lengths [m]
P.m = [1 1]; % Masses [kg]
P.ampl = 3; % Amplitude [m]
P.freq = 5; % Frequency [rad/s]
th0 = [0 0]; % Initial angles [rad]
thd0 = [0 0]; % Initial angular rate [rad/s]
tspan = [0 40]; % Time span [s]

y0 = [th0 thd0];
%% Simulate
