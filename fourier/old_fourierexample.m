Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 1500;             % Length of signal
t = (0:L-1)*T;        % Time vector

% signal containing
% 50Hz sinusoid amplitude 0.7 hz and
% 120 Hz sinusoid with amplitude 1
S = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);

% some noise
X = S + 2*randn(size(t));

subplot(221);
plot(1000*t(1:50),X(1:50))
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('t (milliseconds)')
ylabel('X(t)')

Y = fft(X);
subplot(222);

P2 = abs(Y/L);
plot(0:L-1, P2);
xlim([0 length(P2)]);
ylim([0 1]);
title('Double-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P2(f)|')

% halbes Signal, Abtasttheorem
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

% sampling rate * 
% frequenzbucket / 
% Länge des Signals 
f = Fs*(0:(L/2))/L;
subplot(223);
plot(f,P1);
xlim([0 length(P1)]);
ylim([0 1]);
title('Single-Sided Amplitude Spectrum of X(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')

Y = fft(S);
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);

subplot(224);
plot(f,P1);
xlim([0 length(P1)]);
ylim([0 1]);
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')