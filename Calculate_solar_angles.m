function [SZA, SAA] = Calculate_solar_angles(lat,lon,doy,hour,minute,timezone)
% Reference: "General Solar Position Calculations" by NOAA Global Monitoring Division
% Reference: https://en.wikipedia.org/wiki/Solar_azimuth_angle

% calculate the solar zenith angle SZA and solar azimuth angle SAA (in degrees)
% the hour and minute is in local time system (if in UTC system, timezone=0)
% the hour and minute can be a list

% calculate the fractional year(gama)
gama=2*pi/365*(doy-1+(hour-12)/24);

% calculate the equation of time (in minutes)
eqtime=229.18*(0.000075+0.001868*cos(gama)-0.032077*sin(gama)...
    -0.014615*cos(2*gama)-0.040849*sin(2*gama));

% calculate the solar declination angle (in radians)
decl=0.006918-0.399912*cos(gama)+0.070257*sin(gama)-0.006758*cos(2*gama)...
    +0.000907*sin(2*gama)-0.002697*cos(3*gama)+0.00148*sin(3*gama);

% longitude is in degrees (positive to the east of the Prime Meridian)
time_offset=eqtime+4*lon-60*timezone;
tst=hour*60+minute+time_offset;

% calculate the solar hour angle, in degrees
ha=tst/4-180;

lat=deg2rad(lat);
ha=deg2rad(ha);

cos_SZA=sin(lat).*sin(decl)+cos(lat).*cos(decl).*cos(ha);
SZA=acosd(cos_SZA);

sin_SZA = sqrt(1-cos_SZA.^2);
% cos_SAA_supangle = (sin(decl)-sin(lat).*cos_SZA) ./ (cos(lat) .* sin_SZA);
% SAA = 180 - acosd(cos_SAA_supangle);

cos_SAA = (sin(decl)-sin(lat).*cos_SZA) ./ (cos(lat) .* sin_SZA);
SAA_initial = acosd(cos_SAA);    % acosd range [0, 180]
SAA = -sign(ha) .* SAA_initial;  % range [-180, 180]
SAA(SAA<0) = SAA(SAA<0) + 360;   % range [0, 360]

end