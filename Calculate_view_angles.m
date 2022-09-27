function [VZA, VAA] = Calculate_view_angles(lat, lon)
% calculate VZA of MSG-Disk
sub_lon = 0;  % for MSG
SatHeight=35786;
R = 6371.23;
lon_diff = lon - sub_lon;

cosy = cosd(lat) .* cosd(lon_diff);
siny = sqrt(1 - cosy.*cosy);
r = SatHeight + R;
d = sqrt(R * R + r * r - 2 * R * r * cosy);
sin_VZA = r * siny ./ d;
VZA = asind(sin_VZA);


% calculate VAA of MSG-Disk
sin_b = sind(abs(lon_diff)) ./ siny;
b = asind(sin_b);

% idx1 = find(lon_diff<=0 & lat<=0);
idx2 = find(lon_diff<=0 & lat>0);
idx3 = find(lon_diff>0 & lat>0);
idx4 = find(lon_diff>0 & lat<=0);

VAA = b;
VAA(idx2) = 180 - b(idx2);
VAA(idx3) = 180 + b(idx3);
VAA(idx4) = 360 - b(idx4);

VAA(isnan(VAA)) = 0;  % for sub satellite pixel, set VAA = 0;

return
