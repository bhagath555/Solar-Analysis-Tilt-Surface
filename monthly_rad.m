function h_total =  monthly_rad(n,p,b,g,s,rho)
% This is function calculates the total radiation falling on a inclined plane,
% between given time periods.
% 
% Input: All the degrees are in radians
%     p - Latitude
%     d - Declination on a day
%     b - tilt angle
%     g - surface azimuth angle
%     s - day length on a day
%     s_max - maximumm possible
% Returns:
%     Monthly average daily radiation.

    
% Declination on day n -- Radians
d = declination(n);
% Sunshine hours
ws = sunshine_angle(p,d);
% Maximum sunshine hours
s_max = sunshine_hours(p,d);
% solar radiation
s_r = s/s_max;
    
%  h_o : Radiation falling on horizontal surface in extra terrestrial condition (J/m^2)
angle_factor = cos(p)*cos(d)*sin(ws)+ws*sin(d)*sin(p);
h_o = 1366.1*(1+0.033*cos(2*pi*n/365))*(24*3600/pi)*angle_factor;
    
% h_g : Global radiation falling on horizontal plate
h_g = h_o*(0.25+0.57*(s_r));
    
% k_t : clearness index
k_t = h_g/h_o;
    
% h_d is diffuse radiation falling on plate

h_d = h_g*(1.411-1.696*k_t);
    
% h_b : beam component of solar radiation.
h_b = h_g - h_d;

% ----------- Transposing radiation onto inclined surface
    
% Beam radiation factor  r_b
% ws_min = min([ws, acos(-1*tan(p-b)*tan(d))])
ws_min = ws;
cos_avg_n = sin(p)*(sin(d)*cos(b)*ws_min + cos(d)*cos(g)*sin(ws_min)*sin(b))+...
            cos(p)*(cos(d)*sin(ws_min)*cos(b)-ws_min*sin(d)*cos(g)*sin(b))-...
            cos(d)*sin(g)*sin(b)*cos(ws_min);
r_b = cos_avg_n/angle_factor;
% Diffuse radiation factor
r_d = (1+cos(b))/2;
% Reflective radiation factor
r_r = rho*(1-cos(b))/2;
% Total radiatin on tilted plane
h_total = h_b*r_b+h_d*r_d+h_g*r_r;
% Converting Joules to KWH
h_total = h_total/(1000*3600);
 end