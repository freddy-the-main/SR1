clear
clc
close all

addpath data\

%% Messungen zusammen bauen

% Stellsprungsmessung zusammen bauen:
Messung1Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[],"t",[]);
for i=1:2
    filename = sprintf("stellsprungversuch_%1d.mat",i);
    load(filename)
    Messung1Struct.A = [Messung1Struct.A;A];
    Messung1Struct.B = [Messung1Struct.B;B];
    Messung1Struct.C = [Messung1Struct.C;C];
    [Messung1Struct.length,~] = size(Messung1Struct.A);
    Messung1Struct.t = [1:Messung1Struct.length]'.*0.002;
end

stellsprungStruct = Messung1Struct; 


% Stoersprungsmessung zusammen bauen:
Messung2Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);

filename = sprintf("störsprungversuch");
load(filename)
Messung2Struct.A = [Messung2Struct.A;A];
Messung2Struct.B = [Messung2Struct.B;B];
Messung2Struct.C = [Messung2Struct.C;C];
[Messung2Struct.length,~] = size(Messung2Struct.A);
Messung2Struct.t = [1:Messung2Struct.length]'.*0.002;

stoersprungStruct = Messung2Struct;


%% wichtige Parameter finden:
[~, stellsprungStruct.sprungIndex] = max(gradient(stellsprungStruct.A));
[~, stoersprungStruct.sprungIndex] = max(gradient(stoersprungStruct.C));
clearvars -except stellsprungStruct stoersprungStruct



%% Plot the filtered signals on the current plot:

[a, b] = butter(2, 8.0000e-04, 'low');
stellsprungStruct.Afilt = filtfilt(a, b ,stellsprungStruct.A);
stellsprungStruct.Bfilt = filtfilt(a, b ,stellsprungStruct.B);
stellsprungStruct.Cfilt = filtfilt(a, b ,stellsprungStruct.C);

[a, b] = butter(2, 8.0000e-04, 'low');
stoersprungStruct.Afilt = filtfilt(a, b ,stoersprungStruct.A);
stoersprungStruct.Bfilt = filtfilt(a, b ,stoersprungStruct.B);
stoersprungStruct.Cfilt = filtfilt(a, b ,stoersprungStruct.C);


%% Plot them baddies raw (and zero order filtered)

figure(10)
hold on
grid on

p11 = subplot(3,1,1);
hold on
plot(p11, stellsprungStruct.A)
title Stellgroesse
xlabel("time [s]")
ylabel("voltage [V]")

p12 = subplot(3,1,2);
hold on
plot(p12, stellsprungStruct.B)
plot(p12, stellsprungStruct.Bfilt )
title Regelgroesse
xlabel("time [s]")
ylabel("voltage [V]")
legend show

p13 = subplot(3,1,3);
hold on
plot(p13, stellsprungStruct.C)
title stoergroesse
xlabel("time [s]")
ylabel("voltage [V]")

linkaxes([p11 p12 p13], 'xy');


figure(20)
hold on
grid on

p21 = subplot(3,1,1);
plot(p21, stoersprungStruct.A)
title Stellgroesse
xlabel("time [s]")
ylabel("voltage [V]")

p22 = subplot(3,1,2);
hold on
plot(p22, stoersprungStruct.B)
plot(p22, stoersprungStruct.Bfilt)
title Regelgroesse
xlabel("time [s]")
ylabel("voltage [V]")
legend show

p23 = subplot(3,1,3);
plot(p23, stoersprungStruct.C)
title Stoergroesse
xlabel("time [s]")
ylabel("voltage [V]")

linkaxes([p21 p22 p23], 'xy');


%% Wendetanga verfahren
% Wendlerpunkt und geradengleichung der Tanga:
stellsprungStruct.BfiltD = gradient(stellsprungStruct.Bfilt);
[M, I] = max(stellsprungStruct.BfiltD);
B = stellsprungStruct.Bfilt(I) - M * I;
stellsprungStruct.wendeTanga = M * (1:1:length(stellsprungStruct.A)) + B;


figure(30)

p31 = subplot(3,1,1);
hold on
plot(p31, stellsprungStruct.Bfilt)
title Regelgroesse
xlabel("time [s]")
ylabel("voltage [V]")

p32 = subplot(3,1,2);
hold on
plot(p32, stellsprungStruct.BfiltD)
plot(I,M,'x')
title("Gradient der Regelgroesse")
xlabel("time [s]")
legend show

p33 = subplot(3,1,3);
hold on
plot(p33, stellsprungStruct.Bfilt)
plot(p33, I, stellsprungStruct.Bfilt(I), 'x')
plot(p33, stellsprungStruct.wendeTanga)
title stoergroesse
xlabel("time [s]")
ylabel("voltage [V]")
ylim([4.5 6])

linkaxes([p11 p12 p13], 'x');



% wendetanga werte ablesen:
figure(32)
clf
hold on
plot(stellsprungStruct.Bfilt)
plot(I, stellsprungStruct.Bfilt(I), 'x')
plot(stellsprungStruct.wendeTanga)
title("Stellgroessenwendetanga")
xlabel("samples ")
ylabel("voltage [V]")
ylim([4.5 6.2])
xlim([0 30000])
yline(max(stellsprungStruct.Bfilt))
yline(stellsprungStruct.Bfilt(stellsprungStruct.sprungIndex))
xline(stellsprungStruct.sprungIndex)

% schnittpunkte:
% naehster index der Tanga an den schnittpunkten:
[~, indexUpper] = min(abs(stellsprungStruct.wendeTanga - max(stellsprungStruct.Bfilt)));
[~, indexLower] = min(abs(stellsprungStruct.wendeTanga - stellsprungStruct.Bfilt(stellsprungStruct.sprungIndex)));

plot(indexUpper, stellsprungStruct.wendeTanga(indexUpper),'o',LineWidth=5)
plot(indexLower, stellsprungStruct.wendeTanga(indexLower),'o',LineWidth=5)

% werte Ausgeben:
stellsprungStruct.T1 = (indexLower - stellsprungStruct.sprungIndex) * stellsprungStruct.dt;
stellsprungStruct.T2 = (indexUpper - indexLower) * stellsprungStruct.dt;
stellsprungStruct.K = (max(stellsprungStruct.Bfilt) - (stellsprungStruct.Bfilt(stellsprungStruct.sprungIndex)))/(max(stellsprungStruct.A)-min(stellsprungStruct.A));

fprintf("Stellsprungparameter Wendetangenteverfahren: \n T1 = %2.4f\n T2 = %2.4f\n K  =  %2.4f\n",stellsprungStruct.T1,stellsprungStruct.T2,stellsprungStruct.K)



% Wendlerpunkt und geradengleichung der Tanga:
stoersprungStruct.BfiltD = gradient(stoersprungStruct.Bfilt);
[M, I] = min(stoersprungStruct.BfiltD);
B = stoersprungStruct.Bfilt(I) - M * I;
stoersprungStruct.wendeTanga = M * (1:1:length(stoersprungStruct.A)) + B;


figure(40)

p31 = subplot(3,1,1);
hold on
plot(p31, stoersprungStruct.Bfilt)
title Regelgroesse
xlabel("time [s]")
ylabel("voltage [V]")

p32 = subplot(3,1,2);
hold on
plot(p32, stoersprungStruct.BfiltD)
plot(I, M,'x')
title("Gradient der Regelgroesse")
xlabel("time [s]")
legend show

p33 = subplot(3,1,3);
hold on
plot(p33, stoersprungStruct.Bfilt)
plot(p33, I, stoersprungStruct.Bfilt(I), 'x')
plot(p33, stoersprungStruct.wendeTanga)
title stoergroesse
xlabel("time [s]")
ylabel("voltage [V]")
ylim([4.5 6])

linkaxes([p31 p32 p33], 'x');


% wendetanga werte ablesen:
figure(41)
clf
hold on
plot(stoersprungStruct.Bfilt)
plot(I, stoersprungStruct.Bfilt(I), 'x')
plot(stoersprungStruct.wendeTanga)
title("stoergroessenwendetanga")
xlabel("samples ")
ylabel("voltage [V]")
ylim([4.8 6])
xlim([0 30000])
yline(min(stoersprungStruct.Bfilt))
yline(stoersprungStruct.Bfilt(stoersprungStruct.sprungIndex))
xline(stoersprungStruct.sprungIndex)

% schnittpunkte:
% naehster index der Tanga an den schnittpunkten:
[~, indexUpper] = min(abs(stoersprungStruct.wendeTanga - min(stoersprungStruct.Bfilt)));
[~, indexLower] = min(abs(stoersprungStruct.wendeTanga - stoersprungStruct.Bfilt(stoersprungStruct.sprungIndex)));

plot(indexUpper, stoersprungStruct.wendeTanga(indexUpper),'o',LineWidth=5)
plot(indexLower, stoersprungStruct.wendeTanga(indexLower),'o',LineWidth=5)

% werte Ausgeben:
stoersprungStruct.T1 = (indexLower - stoersprungStruct.sprungIndex) * stoersprungStruct.dt;
stoersprungStruct.T2 = (indexUpper - indexLower) * stoersprungStruct.dt;
stoersprungStruct.K = ( min(stoersprungStruct.Bfilt) - stoersprungStruct.Bfilt(stoersprungStruct.sprungIndex))/(max(stoersprungStruct.C)-min(stoersprungStruct.C));

fprintf("\nStoersprungparameter Wendetangenteverfahren: \n T1 = %2.4f\n T2 = %2.4f\n K  =  %2.4f\n",stoersprungStruct.T1,stoersprungStruct.T2,stoersprungStruct.K)


%% Uebertragungsfunktionen
% stellsprung:
%stellsprungStruct.Gs = tf([stellsprungStruct.K],[stellsprungStruct.T1*stellsprungStruct.T2, stellsprungStruct.T1+stellsprungStruct.T2, 1]);

T = stellsprungStruct.T2/exp(1);

stellsprungStruct.Gs = tf([stellsprungStruct.K],[T^2, 2*T, 1])

stoersprungStruct.Gs = tf([stoersprungStruct.K],[stoersprungStruct.T1*stoersprungStruct.T2, stoersprungStruct.T1+stoersprungStruct.T2, 1]);


stellsprungStruct.Gs

stoersprungStruct.Gs

% plotten der tf un vergleichen mit echter antwort

opt = RespConfig;
opt.Amplitude = 2;

figure(35)
p1 = subplot(3,1,1)
plot(step(stellsprungStruct.Gs,opt))

p2 = subplot(3,1,2)
hold on
plot(stellsprungStruct.t(stellsprungStruct.sprungIndex:end), stellsprungStruct.B(stellsprungStruct.sprungIndex:end)-4.6)
%plot(stellsprungStruct.t(stellsprungStruct.sprungIndex:end), stellsprungStruct.A(stellsprungStruct.sprungIndex:end))

linkaxes([p1 p2],"x")
