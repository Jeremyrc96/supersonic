clc
clear 

%Given
n = 3; % number of waves
g = 1.4; thetai = 13.34; 

%Memory allocation
v = ones(n+1); Mtheta = v; theta = v; mu = v; M = v; 
M(1,1)=1.5;
nu(1,1) = PrandtlMeyer(M(1,1),g,'nu'); %calculates initial nu from M(1,1)
theta(1,1) = 0; %flow is paralle at entrance
M(1,n+1) = PrandtlMeyer(nu(1,1)+thetai,g,'M'); % M2 after expansion
nu(1,n+1) = PrandtlMeyer(M(1,n+1),g,'nu'); % nu2 after expansion
theta(1,n+1) = thetai; % vertex angle

[nu,theta] = Nutheta(nu,theta,n);
C1 = CharI(nu,theta,n);
C2 = CharII(nu,theta,n);
M = Mach(nu,n,g);
mu = MachAngle(M,n);
[minus,plus] = intermed(theta,mu,n);
[m1,m2] = Mslope(minus,plus,n);