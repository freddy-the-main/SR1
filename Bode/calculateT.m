function [T] = calculateT(Messung)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
arguments (Input)
    Messung
end

arguments (Output)
    T
end

crossingTimes = 0;
for i = 2:Messung.length
    if Messung.Afilt(i-1)<5 && Messung.Afilt(i)>=5 
        crossingTimes = [crossingTimes; Messung.t(i)];
    end
end
crossingTimes = crossingTimes(2:end);
avgT = 0;
for i = 2:length(crossingTimes)
    avgT(i-1) = crossingTimes(i)-crossingTimes(i-1);
end

T = mean(avgT);

end