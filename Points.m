function [X,Y] = Points(M1,M2,N)
X = ones(N);
Y = ones(N);
Xi = 0;
Yi = 1;

YP = @(xa,ya,xb,yb,m2) (m2*(2*xa-2*xb+yb)-2*ya)/(m2-2);
XP = @(YP,xb,yb,m1) (YP-yb)/m1+xb;

% Loops
for i = 1:N
    for j = i:N
        
        if i == 1 % first row is different because it references vertex point
            if i == j % if it is the first point
                Y(i,j) = 0;
                X(i,j) = XP(0,Xi,Yi,M1(i,j)); 
            else % all other points in first row
           Y(i,j) = YP(X(i,j-1),Y(i,j-1),Xi,Yi,M2(i,j));
           X(i,j) = XP(Y(i,j),Xi,Yi,M1(i,j));
            end
            
        else % Calculations for all other rows are the same
            if i == j
                Y(i,j) = 0;
                X(i,j) = XP(0,X(j,i-1),Y(j,i-1),M1(i,j));
            else
           Y(i,j) = YP(X(i,j-1),Y(i,j-1),X(j,i-1),Y(j,i-1),M1(i,j));
           X(i,j) = XP(Y(i,j),X(j,i-1),Y(j,i-1),M2(i,j));
            end
        end
        
     end
end
end
    

