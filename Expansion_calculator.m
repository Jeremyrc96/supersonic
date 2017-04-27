clc
clear 

%Given
n = 10; % number of waves
g = 1.2; xi = 0; yi = 1; Mi = 1; Me = 3;
thetai = PrandtlMeyer(Me,g,'nu')/2; % vertex angle for minimum length with a given exit mach
 
%Memory allocation
v = ones(n+1); Mtheta = v; theta = v; mu = v; M = v; 
M(1,1)=Mi;
nu(1,1) = PrandtlMeyer(M(1,1),g,'nu'); %calculates initial nu from M(1,1)
theta(1,1) = 0; %flow is paralle at entrance
M(1,n+1) = PrandtlMeyer(nu(1,1)+thetai,g,'M'); % M2 after expansion
nu(1,n+1) = PrandtlMeyer(M(1,n+1),g,'nu'); % nu2 after expansion
theta(1,n+1) = thetai; % vertex angle

[nu,theta] = Nutheta(nu,theta,n); % populates upper half of the  nu and theta matrix
M = Mach(nu,n,g); % creates a mach number matrix
mu = MachAngle(M,n); % mach angle matrix
[minus,plus] = intermed(theta,mu,n); % compute theta+mu and theta-mu
[m1,m2] = Mslope(minus,plus,n); % computes characteristic slopes
[X,Y] = Points(m1,m2,n,xi,yi); % computes the inner points
subplot(1,2,1)
[xp,yp] = WallPoints(X,Y,m2,theta,n,xi,yi); % computes the wall points and plots characteristics from last inner points to wall 
XX = DiagFill(X,'p'); YY = DiagFill(Y,'p'); MM = DiagFill(M,'p'); % populates the diagonals 
CharPlot(XX,YY,xi,yi) % plots all of the inner point characteristics
hold on
plot([xi xp],[yi yp],'r') % plots the nozzle walls
hold on 
plot([xi xp],[-yi,-yp],'r')

% adds the wall points to the XX and YY matrices
XF = zeros(n+1); XF(1:n,1:n) = XX; XF(:,n+1) = [xp xp(n)]'; XF(n+1,:) = [xp xp(n)]; 
YF = zeros(n+1); YF(1:n,1:n) = DiagFill(Y,'n') ; YF(:,n+1) = [yp yp(n)]'; YF(n+1,:) = [-yp,-yp(n)];
subplot(1,2,2)
% creating pressure temperature and velocity matrices
[PPo,TTo] = Mach_PT(MM,g);
V = MM.*(TTo.*g.*287).^(1/2);
% plots property field
ColorFill(XF,YF,MM,xi,yi,'-')

