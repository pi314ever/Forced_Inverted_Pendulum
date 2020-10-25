%% Inverted Forced Double Pendulum Main
% Project 3
%% Default value simulation
clc;clear;close all

ampl_default = 0.1; % Amplitude x[m]
freq_default = 100*2*pi(); % Frequency [rad/s]
th0_default = (20)*pi()/180; % Initial angles [rad]
thd0_default = 0; % Initial angular rate [rad/s]
h_default = 0.001; % Time step

y0_default = [th0_default thd0_default];

RKABM_Single(ampl_default,freq_default,y0_default,h_default);
%% Changing Amplitude
% ampl = [0 0.3];
% for ii = 1:2
%     RKABM_Single(ampl(ii),freq_default,y0_default,h_default);
% end

%% Changing Frequency
freq = [1 10 1000]*2*pi();
for ii = 1:length(freq)
    RKABM_Single(ampl_default,freq(ii),y0_default,h_default);
end

%% Changing theta_0
th0 = [10 30]*pi()/180;
y0 = y0_default;
for ii = 1:2
    y0(1) = th0(ii);
    RKABM_Single(ampl_default,freq_default,y0,h_default);
end

%% Changing thetad_0
% thd0 = [10 30]*pi()/180;
% y0 = y0_default;
% for ii = 1:2
%     y0(2) = thd0(ii);
%     RKABM_Single(ampl_default,freq_default,y0,h_default);
% end

%% Changing time step
h = [0.01 0.0001];
for ii = 1:2
    RKABM_Single(ampl_default,freq_default,y0_default,h(ii));
end