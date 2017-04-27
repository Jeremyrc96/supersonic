clc
clear all

% **GIVEN INPUTS**
n = 4; % number of waves
g = 1.4; xi = 0; yi = 1; Mi = 1; Me = 3; % Mi is the throat mach
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
XX = DiagFill(X,'p'); YY = DiagFill(Y,'p'); MM = DiagFill(M,'p'); % populates lower half of matrices

% *PLOTTING AND VISUALIZATION
subplot(1,2,1)
CharPlot(XX,YY,xi,yi,xp,yp) % plots all of the inner point characteristics
hold on
plot([xi xp],[yi yp],'r') % plots the nozzle walls
hold on 
plot([xi xp],[-yi,-yp],'r')
hold on
% adds the wall points to the XX and YY matrices 
XF = zeros(n+1); XF(1:n,1:n) = XX; XF(:,n+1) = [xp xp(n)]'; XF(n+1,:) = [xp xp(n)]; 
YF = zeros(n+1); YF(1:n,1:n) = DiagFill(Y,'n') ; YF(:,n+1) = [yp yp(n)]'; YF(n+1,:) = [-yp,-yp(n)]; YF(n+1,n+1) = 0;
subplot(1,2,2)
[PPo,TTo] = Mach_PT(MM,g); % creating pressure temperature and velocity matrices
V = MM.*(TTo.*g.*287).^(1/2);
% plots property field
ColorFill(XF,YF,MM,xi,yi,'none')



