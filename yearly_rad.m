function year_rad = yearly_rad(p,b,g,s_yr)
% This function calculates total annual radiation (KWh/m^2) falling on 
% tiled plane surface.
% INPUTS:
%       p - (Phi)Latitude of location. (Degrees)
%       b - (Beta) Tilt angle of surface angle. (Degrees)
%       g - (Gamma) Surface azimuth angle. (Degrees)
%       s_yr  - Monthly average sunshine hours of every month, Array of
%       length 12.
%       
% OUTPUTS:
%      Annual solar radiation falling on tilted plane. (KWh/m^2)
%
%
% Test: For delhi city
%     p - 28.7
%     b - 30.1 optimal tilt angle for maximum radiation
%     g - 0 south facing 
%     s_yr - [8.7, 8.7, 9, 9.7, 9.7, 9.4, 8.4, 7.8, 8.6, 9.6, 8.7, 8.1]
%     monthly average sushine hours over a year.
%     yearly_rad(p,b,g,s_yr) radiation in KWh/m^2
 

p = deg2rad(p);
b = deg2rad(b);
g = deg2rad(g);
% Day number in the year, for month average days
n_yr = [17, 47, 75, 105, 135, 162, 198, 228, 258, 288, 318, 344];
% reflection factor
rho = 0.2;
%Calculation
year_rad = 0;
for i = 1:1:12
    n = n_yr(i);
    s = s_yr(i);
    m = monthly_rad(n,p,b,g,s,rho);
%     month_rad.append(m)
    year_rad = year_rad+m;
end
year_rad = (year_rad/12)*365;
end
