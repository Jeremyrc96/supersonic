function C2 = CharII(v,alp,n)
a = n+1; C2 = ones(a,a);
for j = 1:a %Rows
for i = 1:a %Columns
    C2(j,i)= v(j,i) - alp(j,i);
end
end
