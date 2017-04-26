function [v,theta] = Nutheta(v,theta,N)
% populates entire matrix with nu and theta
Dtheta = (theta(1,N+1)-theta(1,1))/N; % change in theta in first row 
Dnu = (v(1,N+1)-v(1,1))/N; % change in nu in first row
for i = 1:N+1 % counts rows
for j = i:N+1 % counts columns, starting at diagonals
    if i == 1 && j < N % since first and last elements of first row are already defined...
                       % this conditions skips those elements
    v(i,j+1) = v(i,j)+Dnu;
    theta(i,j+1) = theta(i,j)+Dnu;
    elseif i ~= 1 % uses standard procedure everything other than first row
        if i == j % defines corner points
            v(i,j) = theta(i-1,j)+v(i-1,j);
            theta(i,j) = 0;
        else % all other points
            v(i,j) = (v(i-1,j)+theta(i-1,j)+v(i,j-1)-theta(i,j-1))/2; % main calculations across characteristics
            theta(i,j) = (v(i-1,j)+theta(i-1,j)-v(i,j-1)+theta(i,j-1))/2; % need to make seperate function
        end
    end
end
end
end