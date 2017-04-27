function CharPlot(X,Y)
Xi = 0;
Yi = 1;
[n,m] = size(X);
% add n sized vector of wall points 
for i = 1:n
    plot([Xi,X(1:i-1,i)',X(i,i:n)],[Yi,Y(1:i-1,i)',Y(i,i:n)])
    hold on
    plot([Xi,X(i,1:i-1),X(i:n,i)'],[-Yi,-Y(i,1:i-1),-Y(i:n,i)'])
    hold on
end 
end
        