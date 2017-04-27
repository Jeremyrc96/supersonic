function CharPlot(X,Y,Xi,Yi,xp,yp)
[n,m] = size(X);
% plots all of the inner point characteristics
for i = 1:n
    plot([Xi,X(1:i-1,i)',X(i,i:n),xp(i)],[Yi,Y(1:i-1,i)',Y(i,i:n),yp(i)],'b')
    hold on
    plot([Xi,X(i,1:i-1),X(i:n,i)',xp(i)],[-Yi,-Y(i,1:i-1),-Y(i:n,i)',-yp(i)],'b')
    hold on
end 
end
        