% Plot figures.
#figure(2); clf;

stepwidth = 1
colormap(gray)

x = imread('dot.png');
d = double(rgb2gray(double(x)));
theta = -90:stepwidth:89.9;
R = radon(d,theta);

P = d; 

#imshow(P)
#title('Original image')

d = P;
theta = -90:stepwidth:89.9;
R = radon(d,theta);
imwrite(R, 'radon_dot.png');

#subplot(322);
#imagesc(1:size(R,1),theta,R);
#title('Radon Transform');
#ylabel('Angle');
#xlabel('Offset');

ram_lak = iradon(R, theta, 'linear');
imwrite(ram_lak, 'dot_default.png');
#title('Ram-Lak');