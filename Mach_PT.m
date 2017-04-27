function [P_ratio, T_ratio] = Mach_PT(M,g)
% calculates P/Po and T/To from the mach number and gamma
T_ratio = (1+(g-1)./2.*M.^2).^-1;
P_ratio = T_ratio.^(g./(g-1));
end
