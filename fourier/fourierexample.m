dt = 0.008;             % Sampling period   
Fs = 1/dt;    % Sampling frequency 
N = 500;             % Length of signal
dF = Fs/N;
t = (0:N-1)*dt;        % Time vector
f = (-Fs/2:dF:Fs/2-dF)';

% signal containing
% 50Hz sinusoid amplitude 0.7 hz and
% 120 Hz sinusoid with amplitude 1
S = 0.7*sin(2*pi*20*t) + sin(2*pi*50*t);

% some noise
X = S + 2*randn(size(t));

subplot(321);
plot(Fs*t(1:500),X(1:500));
title('Original Signal');
xlabel('t (milliseconds)');
ylabel('S(t)');

spektrum = fftshift(fft(X))/N;

subplot(322);
plot(f,abs(spektrum));
title('Original Amplitudenspektrum');
xlabel('f (Hz)');
ylabel('|S(f)|');
ylim([0 0.8]);
xlim([-65 65]);

subplot(323);
BPF = ((20 < abs(f)) & (abs(f) < 30));
filteredSpektrum = BPF'.*spektrum;
filteredSignal = ifft(ifftshift(filteredSpektrum)) * N;
plot(Fs*t(1:500),filteredSignal(1:500));
title('BPF (20 < f < 30) Signal');
xlabel('t (milliseconds)');
ylabel('S(t)');

subplot(324);
plot(f, abs(filteredSpektrum));
title('BPF Amplitudenspektrum');
xlabel('f (Hz)');
ylabel('|S(f)|');
ylim([0 0.8]);
xlim([-65 65]);

subplot(325);
thresdholdFilter = (abs(spektrum) > 0.3);
filteredSpektrum = thresdholdFilter.*spektrum;
filteredSignal = ifft(ifftshift(filteredSpektrum)) * N;
plot(Fs*t(1:500),filteredSignal(1:500));
title('Threshold (|S(f)| > 0.3) Signal');
xlabel('t (milliseconds)');
ylabel('S(t)');

subplot(326);
plot(f, abs(filteredSpektrum));
title('Threshold Amplitudenspektrum');
xlabel('f (Hz)');
ylabel('|S(f)|');
ylim([0 0.8]);
xlim([-65 65]);