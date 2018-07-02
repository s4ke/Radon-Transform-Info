stepwidth = 1;

phantomsize = 256;
P = phantom(phantomsize); 

d = P;
theta = -90:stepwidth:89.9;
R = radon(d,theta);

#ram_nearest = iradon(R, theta, 'nearest', 'ram-lak');
#imwrite(nearest, 'ramlak_nearest.png');

ram_linear = iradon(R, theta, 'linear', 'ram-lak');
imwrite(ram_linear, 'ramlak_linear.png');

ram_spline = iradon(R, theta, 'spline', 'ram-lak');
imwrite(ram_spline, 'ramlak_spline.png');

ram_pchip = iradon(R, theta, 'pchip', 'ram-lak');
imwrite(ram_pchip, 'ramlak_pchip.png');

ram_cubic = iradon(R, theta, 'cubic', 'ram-lak');
imwrite(ram_cubic, 'ramlak_cubic.png');

shepp_linear = iradon(R, theta, 'linear', 'shepp-logan');
imwrite(shepp_linear, 'shepp_linear.png');

shepp_spline = iradon(R, theta, 'spline', 'shepp-logan');
imwrite(shepp_spline, 'shepp_spline.png');

shepp_pchip = iradon(R, theta, 'pchip', 'shepp-logan');
imwrite(shepp_pchip, 'shepp_pchip.png');

shepp_cubic = iradon(R, theta, 'cubic', 'shepp-logan');
imwrite(shepp_cubic, 'shepp_cubic.png');