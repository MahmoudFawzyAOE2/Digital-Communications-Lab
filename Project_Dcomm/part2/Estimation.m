function [ X_Estimated ] = Estimation( Tx_bit_seq , Rx_bit_seq_eql)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

X_Estimated =[]; 
%Decision Maker 
for i=1:length(Tx_bit_seq)
    if Rx_bit_seq_eql(i) > 0
        B =1; 
    else
        B=-1;
    end
    X_Estimated =[X_Estimated ; B];   %Estimated_Transmitted_signal
end


end

