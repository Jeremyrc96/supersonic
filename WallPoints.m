function [Xp, Yp] = WallPoints(X,Y,m2,T,N,Xi,Yi)
% computes the wall points and plots characteristics from last inner points to wall 

Yp = zeros(1,N); % initialize wall points
Xp = zeros(1,N); 
A = [1 -tand(T(1,N+1)); 1 -m2(1,N)]; % matrixes to solve 2x2 system for first wall point
B = [Yi-tand(T(1,N+1))*Xi Y(1,N)-m2(1,N)*X(1,N)]';
A = linsolve(A,B);
Xp(1) = A(2); Yp(1) = A(1); 

fplot(@(x) Y(1,N) + m2(1,N)*(x-X(1,N)),[X(1,N) Xp(1)],'b') % plots first characteristics
hold on
fplot(@(x) -(Y(1,N) + m2(1,N)*(x-X(1,N))),[X(1,N) Xp(1)],'b')
hold on

for i = 2:N % all other points
A = [1 -tand(T(i,N+1)); 1 -m2(i,N)];
B = [Yp(i-1)-tand(T(i,N+1))*Xp(i-1) Y(i,N)-m2(i,N)*X(i,N)]';
A = linsolve(A,B);
Xp(i) = A(2); Yp(i) = A(1);  

fplot(@(x) Y(i,N) + m2(i,N)*(x-X(i,N)),[X(i,N) Xp(i)],'b')
hold on
fplot(@(x) -(Y(i,N) + m2(i,N)*(x-X(i,N))),[X(i,N) Xp(i)],'b')
hold on

end
end