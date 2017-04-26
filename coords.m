function [xp,yp] = coords(alp,mu,n)
a = n+1; m1 = ones(a,a); m2 = ones(a,a); 
for j = 1:a %Rows
for i = 1:a %Columns
    m1(j,i) = tand(alp(j,i) - mu(j,i));
    m2(j,i) = tand(alp(j,i) + mu(j,i));
end
end