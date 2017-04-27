function [xp,yp] = boundarypoints(x,m2,theta,n)  
    xp = ones(n,1); yp = xp;
    for i = 1:n
    xp(i) = (-m2(i,n)*x(i,n)) / (tand(theta(i,n)) - m2(i,n));
    yp(i) = xp(i)* tand(theta(i,n));
    end
    plot(xp,yp)
end