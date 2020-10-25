%% Inverted Forced Double Pendulum Main
% Project 3
%% Setup
clc;clear;close all
% Single pendulum
P.g = 9.81; % Gravity [m/s^2]
P.l = 1; % Lengths [m]
P.m = 1; % Masses [kg]
P.ampl = 0.1; % Amplitude [m]
P.freq = 100*2*pi(); % Frequency [rad/s]
th0 = (20)*pi()/180; % Initial angles [rad]
thd0 = 0; % Initial angular rate [rad/s]
tspan = [0 20]; % Time span [s]

% % Double pendulum
% P.g = 9.81; % Gravity [m/s^2]
% P.l = [1 1]; % Lengths [m]
% P.m = [1 1]; % Masses [kg]
% P.ampl = 0.1; % Amplitude [m]
% P.freq = 300; % Frequency [rad/s]
% th0 = [0 1]*pi()/180; % Initial angles [rad]
% thd0 = [0 0]; % Initial angular rate [rad/s]
% tspan = [0 10]; % Time span [s]

y0 = [th0 thd0];
%% Simulate
sol = ode45(@(t,x)Inverted_Single(t,x,P),tspan,y0);

time = linspace(tspan(1),sol.x(end),1000);
state = deval(sol,time);
%% Plots
figure % Time plot
plot(time,state)
title('Time plot of states')
xlabel('Time [s]')
ylabel('Angle [rad]/Angular rate [rad/s]')
legend('\theta','\theta''')

figure % Phase portrait
plot(state(1,:),state(2,:))
title('Phase portrait')
xlabel('Angle [rad]')
ylabel('Angular rate [rad/s]')
