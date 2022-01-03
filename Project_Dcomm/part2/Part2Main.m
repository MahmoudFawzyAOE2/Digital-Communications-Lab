clc
clear all 

%%
% Alexandria University
% Faculty of Engineering
% Electrical and Electronic Engineering Department
% Course: Digital Communications Lab
% Project Part 2: Inter-Symbol Interference due to multi-path channels

%%
% System parameters
L = 1000;     %No of paths
Eb_No_db = 0;       % The specified Eb/No value in dB
Energy_per_bit=1;
No=Energy_per_bit/( 10^(Eb_No_db/10) );

% Generate of Transmitted symbols (BPSK)
Tx_bit_seq = GenerateBits(L);

%%
% Generate Matrix of channel coeffients 
H_matrix=MultipathChannel(L,1);

noise = randn(size(Tx_bit_seq))*sqrt(No/2); %generate Noise
Rx_bit_seq = (H_matrix * Tx_bit_seq) + noise ;     %getting the received signal Y

%%
% Estimation of transmitted signal from Received signal 
Equalizer = inv(H_matrix);
Rx_bit_seq_eql= Equalizer * Rx_bit_seq; 

X_Estimated =  Estimation( Tx_bit_seq , Rx_bit_seq_eql);
%Calculation of BER between transmitted symbols & estimated signal when variance = 1
BER = ComputeBER(Tx_bit_seq, X_Estimated);

%%
% Estimation of BER vs Eb/No 
Eb_No_dB_vector = -15:0;
BER1=zeros(size(Eb_No_dB_vector));

for i= 1:length(Eb_No_dB_vector)
    
    No=Energy_per_bit/( 10^(Eb_No_dB_vector(i)/10) );
    noise= randn(size(Rx_bit_seq))*sqrt(No/2);
    Rx_bit_seq = (H_matrix * Tx_bit_seq) + noise ;
    Rx_bit_seq_eql= Equalizer * Rx_bit_seq;
    X_Estimated = Estimation( Tx_bit_seq , Rx_bit_seq_eql);
    
    BER1(i) = ComputeBER(Tx_bit_seq, X_Estimated);
end
%Plotting BER vs Eb/No
figure
semilogy(Eb_No_dB_vector,BER1,'-xk','linewidth',2)
ylim([1e-3 1])
xlabel('Eb/No','linewidth',2)
ylabel('BER','linewidth',2)