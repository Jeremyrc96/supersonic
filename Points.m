function [X,Y] = Points(M1,M2,N)
X = ones(N);
Y = ones(N);
Xi = 0;
Yi = 1;

YP = @(xa,ya,xb,yb,m2,m1) (m2*(yb+m1*(xa-xb)-ya*m1/m2))/(m2-m1);
XP = @(YP,xa,ya,m2) xa+(YP-ya)/m2;
CornerX = @(m1,xb,yb) xb-yb/m1;

% Loops
for i = 1:N
    for j = i:N
        
        if i == 1 % first row is different because it references vertex point
            if i == j % if it is the first point
                Y(i,j) = 0;
                X(i,j) = CornerX(M1(i,j),Xi,Yi);
            else % all other points in first row
           Y(i,j) = YP(X(i,j-1),Y(i,j-1),Xi,Yi,M2(i,j-1),M1(i,j));
           X(i,j) = XP(Y(i,j),X(i,j-1),Y(i,j-1),M2(i,j-1));
            end
            
        else % Calculations for all other rows are the same
            if i == j
                Y(i,j) = 0;
                X(i,j) = CornerX(M1(i,j),X(i-1,j),Y(i-1,j));
            else
           Y(i,j) = YP(X(i,j-1),Y(i,j-1),X(i-1,j),Y(i-1,j),M2(i,j-1),M1(i,j));
           X(i,j) = XP(Y(i,j),X(i,j-1),Y(i,j-1),M2(i,j-1));
            end
        end
        
     end
end
end
    

