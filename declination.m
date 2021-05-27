function d =  declination(n)

% It returns the decliantion on given day (n) in a year.
% 
% Inputs:
%     n (Float) : day number in year.
% returns:
%     declination value in radians
% """
d = deg2rad(23.45*sin((2*pi*(284+n)/365)));
end