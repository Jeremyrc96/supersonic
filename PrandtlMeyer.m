function MorNu = PrandtlMeyer(MNu,g,C)
% enter nu in degrees
% M calculates the mach number from a given angle and nu calculates nu
% from a mach number

if isempty(g),g = 1.4; end % default specific heat ratio

if strcmp(C,'M')
MNu = MNu * (pi/180);
MorNu = fzero(@(M) sqrt((g+1)/(g-1))*atan(sqrt((g-1)/(g+1)*(M^2-1)))-atan(sqrt(M^2-1))-MNu,[1,20]);
elseif strcmp(C,'nu')
    MorNu = (sqrt((g+1)/(g-1))*atan(sqrt((g-1)/(g+1)*(MNu^2-1)))-atan(sqrt(MNu^2-1)))*(180/pi);
else
    error('C must be M or nu')
end
