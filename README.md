# Solar-Analysis-Tilt-Surface
Annual radiation falling on a tilted surface.

Example on calculating annual radiation falling on a tilted surface.

```matlab
Test: For delhi city
        p - 28.7
        b - 30.1 % optimal tilt angle for maximum radiation
        g - 0 % south facing 
        % monthly average sushine hours over a year
        s_yr - [8.7, 8.7, 9, 9.7, 9.7, 9.4, 8.4, 7.8, 8.6, 9.6, 8.7, 8.1]
        % Toal annual radiation on tilted surface.
        yearly_rad(p,b,g,s_yr) radiation in KWh/m^2
```

