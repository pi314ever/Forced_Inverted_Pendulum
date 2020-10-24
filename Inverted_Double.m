function [dx] = Inverted_Double(t,x,P)
%Inverted Double Pendulum EoM
Ampl = P.ampl;
Freq = P.freq;
l = P.l;
m = P.m;
g = P.g;
ydd = -Ampl*Freq^2*sin(Freq*t); % Forcing motion
I = 1/12*m.*l.^2;


A = [(l(1)/2)^2*m(1)+m(2)*l(1)^2-I(1) m(2)*l(1)*l(2)/2*cos(x(1)-x(2));
    l(2)/2*m(2)*l(1)*cos(x(2)-x(1)) m(2)*(l(2)/2)^2-I(2)];
b = [l(1)/2*m(1)*g*sin(x(1))*3-m(2)*l(1)*l(2)/2*sin(x(1)-x(2))*x(4)^2+(l(1)/2*m(1)*sin(x(1))+m(2)*l(1)*sin(x(1)))*ydd;
    l(2)/2*m(2)*g*sin(x(2))-m(2)*l(2)*l(1)/2*sin(x(2)-x(1))*x(3)^2+m(2)*l(2)/2*sin(x(2))*ydd];

dx = [x(3);x(4);A\b];
end

