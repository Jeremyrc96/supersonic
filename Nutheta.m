function [nu,Theta] = Nutheta(nu,Theta,N)
% populates entire matrix with nu and theta
Dtheta = (Theta(1,N+1)-Theta(1,1))/N; % change in theta in first row 
Dnu = (nu(1,N+1)-nu(1,1))/N; % change in nu in first row
for i = 1:N+1 % counts rows
for j = i:N+1 % counts columns, starting at diagonals
    if i == 1 && j < N % since first and last elements of first row are already defined...
                       % this conditions skips those elements
    nu(i,j+1) = nu(i,j)+Dnu;
    Theta(i,j+1) = Theta(i,j)+Dnu;
    elseif i ~= 1 % uses standard procedure everything other than first row
        if i == j % defines corner points
            nu(i,j) = Theta(i-1,j)+nu(i-1,j);
            Theta(i,j) = 0;
        else % all other points
            nu(i,j) = (nu(i-1,j)+Theta(i-1,j)+nu(i,j-1)-Theta(i,j-1))/2; % main calculations across characteristics
            Theta(i,j) = (nu(i-1,j)+Theta(i-1,j)-nu(i,j-1)+Theta(i,j-1))/2; % need to make seperate function
        end
    end
end
end
end