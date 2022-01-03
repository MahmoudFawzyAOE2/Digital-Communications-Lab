function sample_seq = GenerateSamples(bit_seq,L)
% Inputs:
%   bit_seq:    Input bit sequence
%   L:         Number of samples per bit
% Outputs:
%   sample_seq: The resultant sequence of samples

% This function takes a sequence of bits and generates a sequence of
% samples as per the input number of samples per bit

sample_seq = zeros(size(bit_seq*L));

%%% WRITE YOUR CODE FOR PART 2 HERE
n=1;
for i= 1:length(bit_seq)
    sample_seq(n:n+L-1) = bit_seq(i);
    n = n + L ;
end 
%%%