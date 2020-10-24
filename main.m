%% Inverted Forced Double Pendulum Main
% Project 3
%% Setup
clc;clear;close all
P.g = 9.81; % Gravity [m/s^2]
P.l = [1 1]; % Lengths [m]
P.m = [1 1]; % Masses [kg]
P.ampl = 3; % Amplitude [m]
P.freq = 10; % Frequency [rad/s]
th0 = [0 1]*pi()/180; % Initial angles [rad]
thd0 = [0 0]; % Initial angular rate [rad/s]
tspan = [0 40]; % Time span [s]

y0 = [th0 thd0];
%% Simulate
sol = ode45(@(t,x)Inverted_Double(t,x,P),tspan,y0);

time = linspace(tspan(1),sol.x(end));
state = deval(sol,time);