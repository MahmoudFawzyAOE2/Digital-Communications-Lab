clc
clear all

%%
% Alexandria University
% Faculty of Engineering
% Electrical and Electronic Engineering Department
% Course: Digital Communications Lab 
% Project Part 3: coding technique,Repetition code

%% Part 1: BER for simple bit-flipping channel with multiple samples
display('### Part 1 ###')

% System parameters
L      = 10;    % Number of samples per symbol (bit)
N_bits = 10000 ; % Total number of bits
p      = 0.2   % Channel parameter (probability of bit flipping)

% Generate a bit sequence
bit_seq = GenerateBits(N_bits); % Generate a sequence of bits equal to the total number of bits

% Generate samples from bits
sample_seq = GenerateSamples(bit_seq,L); % Generate a sequence of samples for each bit (*L)

% Pass the sample sequence through the channel
rec_sample_seq = BSC(sample_seq,L,p);   % Generate the received samples after passing through the bit flipping channel (0.2p)

% Decode bits from received bit sequence
rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,'part_2',L);    % Decode the received bits

% Compute the BER
BER = ComputeBER(bit_seq,rec_bit_seq)   % Calculate the bit error rate

% Compute the r 
r = length(bit_seq)/ length(sample_seq) % Calculate the Coding Rate

%% Part 2: Effect of bit flipping probability p on BER
display('### Part 2 ###')

% plot for the BER versus different values of the channel parameter p

p_vect          = 0:0.05:1;           % Use this vector to extract different values of p in your code
BER_case_2_vec  = zeros(size(p_vect));  % Use this vector to store the resultant BER

for p_ind = 1:length(p_vect)
    rec_sample_seq = BSC(sample_seq,L,p_vect(p_ind));
    rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,'part_2',L);
    BER_case_2_vec(p_ind) = ComputeBER(bit_seq,rec_bit_seq);
end

% Plotting results
figure;
subplot(2,1,1)
plot(p_vect,BER_case_2_vec,'r','linewidth',2); hold on;
xlabel('Values of p','fontsize',10)
ylabel('BER','fontsize',10)
title('Part 2: Effect of bit flipping probability p on BER')

%% Part 3: Effect of number of repetitions L on BER
display('### Part 3 ###')

% plot for the BER versus the number of repetitions used in the transmitter 

% System parameters
L_vect = 1:1:L ;    % Number of samples per symbol (bit)

% Generate a bit sequence
bit_seq = GenerateBits(N_bits); % Generate a sequence of bits equal to the total number of bits 

BER_case_3_vec = zeros(size(L_vect));  % Use this vector to store the resultant BER
    
for L_ind = 1:length(L_vect)
    
    % Generate samples from bits
    sample_seq = GenerateSamples(bit_seq,L_vect(L_ind)); % Generate a sequence of samples for each bit (*fs)

    % Pass the sample sequence through the channel
    rec_sample_seq = BSC(sample_seq,L_vect(L_ind),p);   % Generate the received samples after passing through the bit flipping channel

    % Decode bits from received bit sequence
    rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,'part_2',L_vect(L_ind));    % Decode the received bits

    % Compute the BER
    BER_case_4_vec(L_ind) = ComputeBER(bit_seq,rec_bit_seq);   % Calculate the bit error rate

end

% Plotting results
subplot(2,1,2)
plot(L_vect,BER_case_4_vec,'d-b','linewidth',2); hold on;
xlabel('Values of L','fontsize',10)
ylabel('BER','fontsize',10)
title('Part  3: Effect of number of repetitions L on BER')
