function [xp,yp] = ExpansionCalcF(n,g,xi,yi,Mi,Me)
% **GIVEN INPUTS**
thetai = PrandtlMeyer(Me,g,'nu')/2; % vertex angle for minimum length with a given exit mach
 
% **MEMORY ALLOCATION**
v = ones(n+1); Mtheta = v; theta = v; mu = v; M = v; % initialize matrices
M(1,1)=Mi;
nu(1,1) = PrandtlMeyer(M(1,1),g,'nu'); %calculates initial nu from M(1,1)
theta(1,1) = 0; %flow is paralle at entrance
M(1,n+1) = PrandtlMeyer(nu(1,1)+thetai,g,'M'); % Mach and nu after row of expansions
nu(1,n+1) = PrandtlMeyer(M(1,n+1),g,'nu'); 
theta(1,n+1) = thetai; % vertex angle

% **CORE COMPUTATIONS**
[nu,theta] = Nutheta(nu,theta,n); % populates upper half of the  nu and theta matrix
M = Mach(nu,n,g); % populates a mach number matrix
mu = MachAngle(M,n); % mach angle matrix
[minus,plus] = intermed(theta,mu,n); % computes theta+mu and theta-mu
[m1,m2] = Mslope(minus,plus,n); % computes characteristic slopes

% **POINT COMPUTATIONS**
[X,Y] = Points(m1,m2,n,xi,yi); % computes the inner points
[xp,yp] = WallPoints(X,Y,m2,theta,n,xi,yi); hold on % computes the wall points and plots characteristics from last inner points to wall 
end