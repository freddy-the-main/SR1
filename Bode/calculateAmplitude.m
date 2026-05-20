function [amplitudeA,amplitudeB] = calculateAmplitude(Messung)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    Messung
end

arguments (Output)
    amplitudeA
    amplitudeB
end


intervals = floor(Messung.t(end)/Messung.T);
T_IDs = floor(Messung.T/Messung.dt);

ampAVGA = 0;
ampAVGB = 0;

for i = 1:intervals-1
    ampAVGA = [ampAVGA; peak2peak(Messung.Afilt(i*T_IDs:((1+i)*T_IDs)))];
    ampAVGB = [ampAVGB; peak2peak(Messung.Bfilt(i*T_IDs:((1+i)*T_IDs)))];
end

amplitudeA = mean(ampAVGA(2:end));
amplitudeB = mean(ampAVGB(2:end));

end