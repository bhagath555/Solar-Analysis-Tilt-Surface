function ws = sunshine_angle(p,d)

%     Input:
%         All degrees are in radians
%         p - Phi, Latitude of location
%         d - Declination on a day
%     Output:
%         sunshine hours on a day, in radians

ws = acos(-1*tan(p)*tan(d));
end