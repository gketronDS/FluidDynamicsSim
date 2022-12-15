%% Fluid Velocity Profile
syms n x
deltaP= 933.277;%in Pascal
h = 0.002/2;% half total height in meters
w= 0.003/2; %half total width in meters
u = 0.95; % viscosity in Pascal seconds
L = 0.005; %length of channel in meters
V =0;
Q = 0;
y = 0; %desired y value velocity
z = 0; %desired z value velocity
if h/w <= 0.1
    V = ((deltaP*h^2)/(2*u*L))*(1-(z^3/(h^2)));
    V = double(V);
    intermed1 = symsum((192*h)/(w*(((2*n)+1)^5)*(pi)^5),n,0,30);
    Q = ((4*deltaP*h^3*w)/(3*u*L))*(1-intermed);
    Q = double(Q);
end
if h/w > 0.1
    intermedV = symsum(((-1)^n)/((2*n+1)^3)*cos(((2*n+1)*pi*z)/(2*h))*(cosh(((2*n+1)*pi*y)/(2*h))/cosh(((2*n+1)*pi*w)/(2*h))),n,0,30);
    V = (deltaP/(2*u*L))*(1-(z^2/(h^2)))-(((16*deltaP*h^2)/(u*L*(pi)^3))*intermedV);
    V = double(V);
    intermed2 = symsum((192*h*tanh(((2*n+1)*pi*w)/(2*h))/((2*n+1)^5*(pi)^5*w)),n,0,30);
    Q =((4*deltaP*h^3*w)/(3*u*L))*(1-intermed2);
    Q = double(Q);
end
%% Dynamic Similarity
ArteryL = 0.017;
CapillaryL = 0.0006;
g = 9.81;
bloodDensity = 1050;
bloodu = 3.5*10^-3;
DMEMDensity= 1011;
bodybps = 1; %1 beat per second = 60bpm 100 bmp = 100/60 bps
Vart = 0.1; %0.1-0.13m/s
Vcap = 0.00114; %1.14 mm/s
averageV = Q/(4*w*h)
chipbps = 4;%Changable value

ReynoldsHeldVforCap = (Vcap*bloodDensity*CapillaryL*u)/(bloodu*DMEMDensity*L);
ReynoldsHeldVforArt = (Vart*bloodDensity*ArteryL*u)/(bloodu*DMEMDensity*L);

WormsleyOnCapforL = (CapillaryL*((bodybps*bloodDensity)/bloodu)^(1/2)*((chipbps*DMEMDensity)/u)^(-1/2));
WormsleyOnCapforBPS = ((CapillaryL^2)/(L^2))*((bodybps*bloodDensity*u)/(bloodu*DMEMDensity));
WormsleyOnArtforL =(ArteryL*((bodybps*bloodDensity)/bloodu)^(1/2)*((chipbps*DMEMDensity)/u)^(-1/2));
WormsleyOnArtforBPS =((ArteryL^2)/(L^2))*((bodybps*bloodDensity*u)/(bloodu*DMEMDensity));

FroudeV= (Vcap*(L^(-1/2)))/((CapillaryL)^(-1/2));

