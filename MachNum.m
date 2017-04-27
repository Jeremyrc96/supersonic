function [M1,M2] = MachNum(At,Ae,g)
%calculates the mach number for any gamma and areas
if At == Ae, M1 = 1; M2 = 1; return; end

Mach = @(M) ((g+1)./2).^(-(g+1)./(2.*(g-1))).*(1+(g-1)./2.*M.^2).^((g+1)./(2.*(g-1)))-Ae.*M./At;
x0 = 0;
M1 = fzero(Mach,x0);
x0 = [M1+(1-M1),10];
M2 = fzero(Mach,x0);
end
