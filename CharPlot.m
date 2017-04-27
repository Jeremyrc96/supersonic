function CharPlot(X,Y,Xi,Yi)
[n,m] = size(X);
% plots all of the inner point characteristics
for i = 1:n
    plot([Xi,X(1:i-1,i)',X(i,i:n)],[Yi,Y(1:i-1,i)',Y(i,i:n)],'b')
    hold on
    plot([Xi,X(i,1:i-1),X(i:n,i)'],[-Yi,-Y(i,1:i-1),-Y(i:n,i)'],'b')
    hold on
end 
end
        