function [signal_t_Rx  ] = Analysis( signal_t, Fc, Fs, axis_t, axis_f, T_sq  )
% This Function Makes a low pass filter at Fc 
%   Detailed explanation goes here

%% Original Signal
N = length(signal_t);
signal_f = fft(signal_t);
signal_f = signal_f(1:N/2+1);

figure;
subplot(2,3,1)
plot(axis_t,signal_t,'r','linewidth',2)
grid on
xlim([0 T_sq]*1.2*2)
title('Original/Tx Time Domain')
xlabel('Time (ms)')
ylabel('Magnitude')

subplot(2,3,2)
plot(axis_f,abs(signal_f),'linewidth',2)
grid on
xlim([0 1/T_sq]*5)
title('Original/Tx Frequency Responce')
xlabel('Frequency (kHz)')
ylabel('Magnitude')

%% Filter

n = 99999 ;                 %filter order
wn = Fc /(Fs/2) ;
coef = fir1(n,wn) ; 

[h,w] = freqz(coef,1,length(signal_f),Fs);
filter = abs(h)';

subplot(2,3,3)
plot(w ,filter)
grid on
xlim([0 Fc]*2.5)
title('Channel')
xlabel('Frequency (kHz)')
ylabel('Magnitude')

%% Recived Signal

signal_f_Rx = filter .*signal_f;

left_fourier = fliplr(signal_f_Rx(1:end-1));
signal_t_Rx = [ left_fourier , signal_f_Rx];
signal_t_Rx = abs(ifft(signal_t_Rx));

subplot(2,3,4)
plot(axis_t,signal_t_Rx,'r','linewidth',2)
grid on
xlim([0 T_sq]*1.2*2)
title('Filterd/Rx Time Domain')
xlabel('Time (ms)')
ylabel('Magnitude')

subplot(2,3,5)
plot(axis_f,abs(signal_f_Rx),'linewidth',2)
grid on
xlim([0 1/T_sq]*5)
title('Filterd/Rx Frequency Responce')
xlabel('Frequency (kHz)')
ylabel('Magnitude')

end

