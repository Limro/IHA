clc, clear
disp('Exercise 1.12')

%Consider transmission over a telephone line with a bandwidth B = 3 kHz. This
%is an analogue channel which can be considered as perturbed by AWGN, and
%for which the power signal-to-noise ratio is at least 30 dB.
%   (a) What is the capacity of this channel, in the above conditions?
%   (b) What is the required signal-to-noise ratio to transmit an M-ary signal able to
%       carry 19,200 bps?

%Gaussian noise (AWGN) channel:
B = 3000; %Bandwidth
SNR = 30; %Signal-noise ratio
C = B*log2(1+SNR)/1000;
disp('C = ') 
disp(C)
disp('kbps')

C_db = 10*log10(C) %dB

Carry = 19200;
Entropy = log2(1+Carry) %H(X)
