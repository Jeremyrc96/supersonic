function ColorFill(X,Y,P,xi,yi,l)
% P is the property to be mapped in the regions defined by X and Y, l is
% the line property

if isempty(l), l = 'none'; end
[n,m] = size(X);

C = parula; % colormap
R = [min(min(P)) max(max(P))]; % min and max values of property to define edges of colormap
for i = 1:n
    for j = i:n
        if i == 1 % fills first rows
            if i == j % fills corners
               xf = [xi xi X(i,j)];
               yf = [yi -yi Y(i,j)]; 
               fill(xf,yf,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
            else
                xf = [xi X(i,j-1) X(i,j)]; 
                yfu = [yi Y(i,j-1) Y(i,j)]; yfl = [-yi -Y(i,j-1) -Y(i,j)];
               fill(xf,yfl,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
               fill(xf,yfu,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
            end
 
        else % all other 
            if i == j 
                if i == n
               xf = [X(i,j) X(i-1,j-1) X(i,j)];
               yf = [Y(i-1,j) Y(i-1,j-1) Y(i,j-1)];
               fill(xf,yf,C(ceil(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
                else
               xf = [X(i,j) X(i-1,j) X(i-1,j-1) X(i-1,j)];
               yf = [Y(i,j) Y(i-1,j) Y(i-1,j-1) -Y(i-1,j)];
               fill(xf,yf,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
                end
            else
               xf = [X(i,j) X(i-1,j) X(i-1,j-1) X(i,j-1)];
               yfu = [Y(i,j) Y(i-1,j) Y(i-1,j-1) Y(i,j-1)]; yfl = -[Y(i,j) Y(i-1,j) Y(i-1,j-1) Y(i,j-1)];
               fill(xf,yfu,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
               fill(xf,yfl,C(round(64-(64-R(1))*(R(2)-P(i,j))/(R(2)-R(1))),:),'linestyle',l); hold on
            end
        end
    end
end
end

            
         
        