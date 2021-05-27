function s_max =  sunshine_hours(p,d)

%     Input:
%         All degrees are in radians
%         p - Phi, Latitude of location
%         d - Declination on a day
%     Output:
%         sunshine hours on a day

s_max = 2*rad2deg(acos(-1*tan(p)*tan(d)))/15;
end