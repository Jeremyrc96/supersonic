clc
clear all

 g = 1.4; xi = 0; yi = 1; Mi = 1; Me = 3; n = 10; e = 1;

while e >= 0.1  
    [xp,yp] = ExpansionCalcF(n,g,xi,yi,Mi,Me);
    e = sqrt((xp(floor(n/3))-xp(floor(n/3)-1))^2+(yp(floor(n/3))-yp(floor(n/3)-1))^2);
    fprintf('error: %f waves: %f\n',e,n)
    scatter(n,e,'o','b')
    hold on
    n = n + 1;
end
    title('Error vs Number of Waves')
    ylabel('error (distance between points)')
    xlabel('number of waves')
    
    