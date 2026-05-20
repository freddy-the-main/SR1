clear
clc
clf

MessungenZusammenBauen


%% filtern
%Messung1
for i = 2:Messung1Struct.length
    if abs(Messung1Struct.A(i,1)-Messung1Struct.A(i-1,1))>=0.03 
        Messung1Struct.A(i,1) = Messung1Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung1Struct.Afilt = filtfilt(a, b ,Messung1Struct.A);
Messung1Struct.Bfilt = filtfilt(a, b ,Messung1Struct.B);

%Messung1
for i = 2:Messung2Struct.length
    if abs(Messung2Struct.A(i,1)-Messung2Struct.A(i-1,1))>=0.03 
        Messung2Struct.A(i,1) = Messung2Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung2Struct.Afilt = filtfilt(a, b ,Messung2Struct.A);
Messung2Struct.Bfilt = filtfilt(a, b ,Messung2Struct.B);

%Messung3
for i = 2:Messung3Struct.length
    if abs(Messung3Struct.A(i,1)-Messung3Struct.A(i-1,1))>=0.03 
        Messung3Struct.A(i,1) = Messung3Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung3Struct.Afilt = filtfilt(a, b ,Messung3Struct.A);
Messung3Struct.Bfilt = filtfilt(a, b ,Messung3Struct.B);

%Messung4
for i = 2:Messung4Struct.length
    if abs(Messung4Struct.A(i,1)-Messung4Struct.A(i-1,1))>=0.03 
        Messung4Struct.A(i,1) = Messung4Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung4Struct.Afilt = filtfilt(a, b ,Messung4Struct.A);
Messung4Struct.Bfilt = filtfilt(a, b ,Messung4Struct.B);

%Messung6
for i = 2:Messung6Struct.length
    if abs(Messung6Struct.A(i,1)-Messung6Struct.A(i-1,1))>=0.03 
        Messung6Struct.A(i,1) = Messung6Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung6Struct.Afilt = filtfilt(a, b ,Messung6Struct.A);
Messung6Struct.Bfilt = filtfilt(a, b ,Messung6Struct.B);

%Messung7
for i = 2:Messung7Struct.length
    if abs(Messung7Struct.A(i,1)-Messung7Struct.A(i-1,1))>=0.03 
        Messung7Struct.A(i,1) = Messung7Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung7Struct.Afilt = filtfilt(a, b ,Messung7Struct.A);
Messung7Struct.Bfilt = filtfilt(a, b ,Messung7Struct.B);

%Messung8
for i = 2:Messung8Struct.length
    if abs(Messung8Struct.A(i,1)-Messung8Struct.A(i-1,1))>=0.05 
        Messung8Struct.A(i,1) = Messung8Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung8Struct.Afilt = filtfilt(a, b ,Messung8Struct.A);
Messung8Struct.Bfilt = filtfilt(a, b ,Messung8Struct.B);

%Messung9
for i = 2:Messung9Struct.length
    if abs(Messung9Struct.A(i,1)-Messung9Struct.A(i-1,1))>=0.09 
        Messung9Struct.A(i,1) = Messung9Struct.A(i-1,1);
    end
end
[a, b] = butter(2, 8.0000e-04, 'low');
Messung9Struct.Afilt = filtfilt(a, b ,Messung9Struct.A);
Messung9Struct.Bfilt = filtfilt(a, b ,Messung9Struct.B);


%% Plotten

%Messung1
figure(1)
clf
subplot(3,1,1)
plot(Messung1Struct.t,Messung1Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung1Struct.t,Messung1Struct.Afilt)

subplot(3,1,2)
plot(Messung1Struct.t,Messung1Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung1Struct.t,Messung1Struct.Bfilt)

subplot(3,1,3)
plot(Messung1Struct.t,Messung1Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung2
figure(2)
clf
subplot(3,1,1)
plot(Messung2Struct.t,Messung2Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung2Struct.t,Messung2Struct.Afilt)

subplot(3,1,2)
plot(Messung2Struct.t,Messung2Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung2Struct.t,Messung2Struct.Bfilt)

subplot(3,1,3)
plot(Messung2Struct.t,Messung2Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung3
figure(3)
clf
subplot(3,1,1)
plot(Messung3Struct.t,Messung3Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung3Struct.t,Messung3Struct.Afilt)

subplot(3,1,2)
plot(Messung3Struct.t,Messung3Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung3Struct.t,Messung3Struct.Bfilt)

subplot(3,1,3)
plot(Messung3Struct.t,Messung3Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung4
figure(4)
clf
subplot(3,1,1)
plot(Messung4Struct.t,Messung4Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung4Struct.t,Messung4Struct.Afilt)

subplot(3,1,2)
plot(Messung4Struct.t,Messung4Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung4Struct.t,Messung4Struct.Bfilt)

subplot(3,1,3)
plot(Messung4Struct.t,Messung4Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung6
figure(6)
clf
subplot(3,1,1)
plot(Messung6Struct.t,Messung6Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung6Struct.t,Messung6Struct.Afilt)

subplot(3,1,2)
plot(Messung6Struct.t,Messung6Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung6Struct.t,Messung6Struct.Bfilt)

subplot(3,1,3)
plot(Messung6Struct.t,Messung6Struct.C)
ylabel("voltage")
xlabel("time [s]")

% Messung3
figure(7)
clf
subplot(3,1,1)
plot(Messung7Struct.t,Messung7Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung7Struct.t,Messung7Struct.Afilt)

subplot(3,1,2)
plot(Messung7Struct.t,Messung7Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung7Struct.t,Messung7Struct.Bfilt)

subplot(3,1,3)
plot(Messung7Struct.t,Messung7Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung3
figure(8)
clf
subplot(3,1,1)
plot(Messung8Struct.t,Messung8Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung8Struct.t,Messung8Struct.Afilt)

subplot(3,1,2)
plot(Messung8Struct.t,Messung8Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung8Struct.t,Messung8Struct.Bfilt)

subplot(3,1,3)
plot(Messung8Struct.t,Messung8Struct.C)
ylabel("voltage")
xlabel("time [s]")


% Messung3
figure(9)
clf
subplot(3,1,1)
plot(Messung9Struct.t,Messung9Struct.A)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung9Struct.t,Messung9Struct.Afilt)

subplot(3,1,2)
plot(Messung9Struct.t,Messung9Struct.B)
ylabel("voltage")
xlabel("time [s]")
hold on 
plot(Messung9Struct.t,Messung9Struct.Bfilt)

subplot(3,1,3)
plot(Messung9Struct.t,Messung9Struct.C)
ylabel("voltage")
xlabel("time [s]")

clearvars b a i