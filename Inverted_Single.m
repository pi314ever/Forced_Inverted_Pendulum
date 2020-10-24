function [dx] = Inverted_Single(t,x,P)
%Inverted Double Pendulum EoM
Ampl = P.ampl;
Freq = P.freq;
l = P.l;
m = P.m;
g = P.g;
ydd = -Ampl*Freq^2*sin(Freq*t); % Forcing motion
I = 1/12*m.*l.^2;

dx = [x(2) (m*ydd*l/2*sin(x(1))-l/2*m*g)/
end

