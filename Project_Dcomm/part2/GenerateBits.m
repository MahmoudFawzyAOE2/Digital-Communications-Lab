 function bit_seq = GenerateBits(L)
% Inputs:
%   L:     Number of bits in the sequence
% Outputs:
%   bit_seq:    The sequence of generated bits

% This function generates a sequence of bits with length equal to N_bits

bit_seq = randi([0 1],[L 1]);

for i = 1:length(bit_seq)
    if bit_seq(i) == 0
        bit_seq(i)= -1;
    end    
end

%%%