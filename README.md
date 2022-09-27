# Calculate_MSG_angles
LSASAF doesn't provide  view zenith angle (VZA), view azimuth angle (VAA), sun zenith angle (SZA), and sun azimuth angle (SAA) for each MSG pixels, which may be necessary in some work. Therefore, in this project, we calculate VZA, VAA, SZA, and SAA of MSG pixels.

**Calculate_view_angles.m** : calculate VZA and VAA for each MSG pixels (for each pixel, the view angles are fixed and changeless regardless of time)

**Calculate_solar_angles.m** : calculate SZA and SAA for each MSG pixels

We obtained some angle information by contacting with the helpdesk of LSASAF. Taking the angle information in 12:00 UTC 1/1/2021 as example, we calculated angles of each pixel, and compared them with the helpdesk provided angles. The boxplot of errors are listed as follows:

![image](https://github.com/222huan/Calculate_MSG_angles/blob/main/azi.jpg)
![image](https://github.com/222huan/Calculate_MSG_angles/blob/main/zenith.jpg)

For zenith angles, the error is described with absolute error.  For azimuth angles, LSASAF stores azimuth angles within [-180, 180], while we calculate them within [0, 360], thus we calculated the cosine value of the difference between calculated and provided azimuth angls.

Because earth curvature, atmospheric refraction and other factors are not considered in our calculation, thus there are some difference but within the reasonable range.
