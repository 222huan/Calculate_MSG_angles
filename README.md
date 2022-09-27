# Calculate_MSG_angles
LSASAF doesn't provide  view zenith angle (VZA), view azimuth angle (VAA), sun zenith angle (SZA), and sun azimuth angle (SAA) for each MSG pixels, which may be necessary in some work. Therefore, in this project, we calculate VZA, VAA, SZA, and SAA of MSG pixels.

We obtained some angle information by contacting with the helpdesk of LSASAF. We compared the provided angles and calculated angles of each pixel, and the boxplot of errors are listed as follows (LSASAF stores azimuth angles within [-180, 180], while we calculate them within [0, 360], thus we calculate cosd(azi_calculated-azi_provided)):
