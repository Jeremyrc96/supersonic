function [Xp, Yp] = WallPoints(X,Y,m2,T,N)

Xi = 0;
Yi = 1;
Yp = zeros(1,N);
Xp = zeros(1,N);
A = [1 -tand(T(1,N+1)); 1 -m2(1,N)];
B = [Yi-tand(T(1,N+1))*Xi Y(1,N)-m2(1,N)*X(1,N)]';
A = linsolve(A,B);
Xp(1) = A(1); Yp(1) = A(2); 

% C = {'c','b','r','g','y',[.5 .6 .7],[.8 .2 .6]};

% fplot(@(x) Yi + tand(T(1,N+1))*(x-Xi),[0,5],C{1})
% hold on
% fplot(@(x) Y(1,N) + m2(1,N)*(x-X(1,N)),[0,5],C{1})
% hold on

for i = 2:N
A = [1 -tand(T(i,N+1)); 1 -m2(i,N)];
B = [Yp(i-1)-tand(T(i,N+1))*Xp(i-1) Y(i,N)-m2(i,N)*X(i,N)]';
A = linsolve(A,B);
Xp(i) = A(2); Yp(i) = A(1);  

% fplot(@(x) Yp(i-1) + tand(T(i,N+1))*(x-Xp(i-1)),[0,5],C{i})
% hold on
% fplot(@(x) Y(i,N) + m2(i,N)*(x-X(i,N)),[0,5],C{i})
% hold on

end
end