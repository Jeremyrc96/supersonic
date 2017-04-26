function [minus,plus] = intermed(alp,mu,n)
a = n+1; minus = ones(a,a); plus = minus;
for j = 1:a %Rows
for i = 1:a %Columns
    plus(j,i)= alp(j,i) + mu(j,i);
    minus(j,i)= alp(j,i) - mu(j,i);
end
end