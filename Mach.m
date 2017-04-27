function M = Mach(v,n,g)
a = n+1; M = ones(a,a);
for j = 1:a %Rows
for i = 1:a %Columns
    M(j,i)= PrandtlMeyer(v(j,i),g,'M');
end
end
