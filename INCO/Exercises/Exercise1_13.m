disp('Exercise 1.13')

%An analogue channel perturbed by AWGN has a bandwidth B = 25 kHz and a
%power signal-to-noise ratio SNR of 18 dB. What is the capacity of this 
%channel in bits per second?

B = 25000;
SNR = 18;

C = B*log2(1+SNR)/1000