%% Fluid Velocity Profile
deltaP= 1;%in Pascal
h = 0.001/2;% half total height in meters
w= 0.01/2; %half total width in meters
u = 9.4*(10)^-4; % viscosity in Pascal seconds
L = 0.05; %length of channel in meters
V =0;
Qart = 0;
y = 0; %desired y value velocity
z = 0; %desired z value velocity
if h/w <= 0.1
    V = ((deltaP*h^2)/(2*u*L))*(1-(9/(h^2)));
    Qart = (4*deltaP*h^3*w)/(3*u*L))*(1-((h/w)*symsum((192)/((2*n+1)^5*(pi)^5))
else
    V = ((deltaP*h^2)/(2*u*L))*(1-(9/(h^2)));
    