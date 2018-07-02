stepwidth = 10;

phantomsize = 256;
P = phantom(phantomsize); 

d = P;
theta = -90:stepwidth:89.9;
R = radon(d,theta);

subplot(321);
ram_lak = iradon(R, theta, 'linear', 'ram-lak');
imwrite(ram_lak, 'ramlak.png');

subplot(322);
shepp_logan = iradon(R, theta, 'linear', 'shepp-logan');
imwrite(shepp_logan, 'shepp_logan.png');
#title('Shepp Logan');

subplot(323);
hann = iradon(R, theta, 'linear', 'hann');
imwrite(shepp_logan, 'hann.png');
#title('Hann');

subplot(324);
cosine = iradon(R, theta, 'linear', 'cosine');
imwrite(cosine, 'cosine.png');
#title('Cosine');

subplot(325);
hamming = iradon(R, theta, 'linear', 'hamming');
imwrite(hamming, 'hamming.png');
#title('Hamming');