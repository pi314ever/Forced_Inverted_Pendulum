function [] = RKABM_Single(ampl,freq,y0,h)
%RKABM_Single Simulates and plots the solution to an inverted single
%pendulum using RK4 and ABM4
% Default set values: g = 9.81 m/s^2
% Length = 1 m
% Mass = 1 kg
% tspan = [0 20] seconds
P.g = 9.81;
P.l = 1;
P.m = 1;
P.ampl = ampl;
P.freq = freq;
tspan = [0 8];
solRK = RK4(@(t,x)Inverted_Single(t,x,P),tspan,y0,h);
solABM = ABM4(@(t,x)Inverted_Single(t,x,P),tspan,y0,h);

timeRK = solRK.x;
stateRK = solRK.y;
timeABM = solABM.x;
stateABM = solABM.y;
% time = linspace(tspan(1),solRK.x(end),1000);
% state = deval(solRK,time);
%% Plots
figure % Theta Time plot
plot(timeRK,stateRK(1,:),timeABM,stateABM(1,:),'--','Linewidth',2)
title('Time plot of \theta')
xlabel('Time [s]')
ylabel('Angle [rad]')
legend('\theta_{RK}','\theta_{ABM}')
Label = sprintf('Freq = %.2f [Hz]\ntheta_0 = %.2f [deg]\nh = %f [s]',...
    freq/(2*pi),y0(1)*180/pi(),h);
annotation('textbox',[0.01 0.92 0 0],'string',Label,'FitBoxToText','on','Fontsize',14)
set(gca,'fontsize',18)

% figure % Thetad Time plot
% plot(timeRK,stateRK(2,:),timeABM,stateABM(2,:),'--','Linewidth',2)
% title('Time plot of \theta''')
% xlabel('Time [s]')
% ylabel('Angular rate [rad/s]')
% legend('\theta''_{RK}','\theta''_{ABM}')
% annotation('textbox',[0.01 0.92 0 0],'string',Label,'FitBoxToText','on','Fontsize',14)
% set(gca,'fontsize',18)

figure % Phase portrait
plot(stateRK(1,:),stateRK(2,:),'b',stateABM(1,:),stateABM(2,:),'r--','Linewidth',2)
title('Phase portrait')
xlabel('Angle [rad]')
ylabel('Angular rate [rad/s]')
legend('RK4','ABM4')
annotation('textbox',[0.01 0.92 0 0],'string',Label,'FitBoxToText','on','Fontsize',14)
set(gca,'fontsize',18)
end

