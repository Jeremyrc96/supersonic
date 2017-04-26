function [m1,m2] = Mslope(minus,plus,n)
a = n+1; m1 = ones(a,a); m2 = ones(a,a); k=2; b=2;
for j = 1:a %Rows
for i = k:a %Columns
    m1(j,i-1) = tand((minus(j,i-1) + minus(j,i))/2);
    m2(j,i-1) = tand((plus(j,i) + plus(j+1,i))/2);
end
k = k+1;
end


