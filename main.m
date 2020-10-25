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
h = 0.01; % Time step
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
solRK = RK4(@(t,x)Inverted_Single(t,x,P),tspan,y0,h);
solABM = ABM4(@(t,x)Inverted_Single(t,x,P),tspan,y0,h);

timeRK = solRK.x;
stateRK = solRK.y;
timeABM = solABM.x;
stateABM = solABM.y;
% time = linspace(tspan(1),solRK.x(end),1000);
% state = deval(solRK,time);
%% Plots
figure % Time plot
plot(timeRK,stateRK,timeABM,stateABM,'--','Linewidth',2)
title('Time plot of states')
xlabel('Time [s]')
ylabel('Angle [rad]/Angular rate [rad/s]')
legend('\theta_{RK}','\theta''_{RK}','\theta_{ABM}','\theta''_{ABM}')

figure % Phase portrait
plot(stateRK(1,:),stateRK(2,:),stateABM(1,:),stateABM(2,:),'--','Linewidth',2)
title('Phase portrait')
xlabel('Angle [rad]')
ylabel('Angular rate [rad/s]')
legend('RK4','ABM4')
