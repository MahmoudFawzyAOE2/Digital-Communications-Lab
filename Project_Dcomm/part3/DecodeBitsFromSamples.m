function rec_bit_seq = DecodeBitsFromSamples(rec_sample_seq,case_type,fs)
% Inputs:
%   rec_sample_seq: The input sample sequence to the channel
%   case_type:      The sampling frequency used to generate the sample sequence
%   fs:             The bit flipping probability
% Outputs:
%   rec_sample_seq: The sequence of sample sequence after passing through the channel
%
% This function takes the sample sequence after passing through the
% channel, and decodes from it the sequence of bits based on the considered
% case and the sampling frequence

if (nargin <= 2)
    fs = 1;
end

switch case_type
    
    case 'part_1'
        %%% WRITE YOUR CODE FOR PART 1 HERE
        rec_bit_seq = rec_sample_seq;
        %%%
    case 'part_2'
        %%% WRITE YOUR CODE FOR PART 2 HERE
        rec_bit_seq=[];
     
        for i= 1:fs:length(rec_sample_seq)
            mean_fs = mean(rec_sample_seq(i:i+(fs-1)));
            if mean_fs >= 0.5 
                rec_bit_seq(end+1) = 1;
            else 
                rec_bit_seq(end+1) = 0;
            end
        end
        %%%
    case 'part_3'
        %%% WRITE YOUR CODE FOR PART 3 HERE
         rec_bit_seq=[];
        
        for i= 1:fs:length(rec_sample_seq)
            rec_bit_seq(end+1) = rec_sample_seq(i) ;
        end 
        %%%
end


