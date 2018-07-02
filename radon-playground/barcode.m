% Plot figures.
figure(2); clf;

stepwidth = 1
colormap(gray)

x = imread('barcode_0.png');
d = double(rgb2gray(x));
theta = -90:stepwidth:89.9;
R = radon(d,theta);

subplot(221);
imagesc(1:size(R,1),theta,R');
title('0 deg');
xlabel('Offset');
ylabel('Angle');

x = imread('barcode_45.png');
d = double(rgb2gray(x));
theta = -90:stepwidth:89.9;
R = radon(d,theta);

subplot(222);
imagesc(1:size(R,1),theta,R');
title('45 deg');
xlabel('Offset');
ylabel('Angle');

x = imread('barcode_90.png');
d = double(rgb2gray(x));
theta = -90:stepwidth:89.9;
R = radon(d,theta);

subplot(223);
imagesc(1:size(R,1),theta,R');
title('90 deg');
xlabel('Offset');
ylabel('Angle');

x = imread('barcode_0.png');
subplot(224);
imagesc(x);
title('Actual Barcode');
