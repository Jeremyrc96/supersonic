function mu = MachAngle(M,n)
a = n+1; q = ones(a,a); mu = q;
for j = 1:a %Rows
for i = 1:a %Columns
    q(j,i)= atan(1/sqrt(M(j,i)^2 - 1));
end
end
mu = q.*(180/pi);
