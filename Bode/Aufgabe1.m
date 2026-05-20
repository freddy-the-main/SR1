clear
clc
close all

FilterMessungen

%% Calculate Values missing in the table
%T
Messung9Struct.T = calculateT(Messung9Struct);
Messung8Struct.T = calculateT(Messung8Struct);
Messung7Struct.T = calculateT(Messung7Struct);
Messung6Struct.T = calculateT(Messung6Struct);
Messung4Struct.T = calculateT(Messung4Struct);
Messung3Struct.T = calculateT(Messung3Struct);
Messung2Struct.T = calculateT(Messung2Struct);
Messung1Struct.T = 947.1120;

%Amp A and B
[Messung9Struct.AmpA, Messung9Struct.AmpB] = calculateAmplitude(Messung9Struct);
[Messung8Struct.AmpA, Messung8Struct.AmpB] = calculateAmplitude(Messung8Struct);
[Messung7Struct.AmpA, Messung7Struct.AmpB] = calculateAmplitude(Messung7Struct);
[Messung6Struct.AmpA, Messung6Struct.AmpB] = calculateAmplitude(Messung6Struct);
[Messung4Struct.AmpA, Messung4Struct.AmpB] = calculateAmplitude(Messung4Struct);
[Messung3Struct.AmpA, Messung3Struct.AmpB] = calculateAmplitude(Messung3Struct);
[Messung2Struct.AmpA, Messung2Struct.AmpB] = calculateAmplitude(Messung2Struct);
 Messung1Struct.AmpA = 5.74104-4.20947;
 Messung1Struct.AmpB = 5.42375-4.39867;

 %

%% Daten in die Tabelle eintragen: 
 Messungen       = [1;2;3;4;6;7;8;9];
 Data_T          = [947.1120;calculateT(Messung2Struct);calculateT(Messung3Struct);calculateT(Messung4Struct);calculateT(Messung6Struct);calculateT(Messung7Struct);calculateT(Messung8Struct);calculateT(Messung9Struct)];
 Data_2y_0       = [Messung1Struct.AmpA;Messung2Struct.AmpA;Messung3Struct.AmpA;Messung4Struct.AmpA;Messung6Struct.AmpA;Messung7Struct.AmpA;Messung8Struct.AmpA;Messung9Struct.AmpA];
 Data_2x_0       = [Messung1Struct.AmpB;Messung2Struct.AmpB;Messung3Struct.AmpB;Messung4Struct.AmpB;Messung6Struct.AmpB;Messung7Struct.AmpB;Messung8Struct.AmpB;Messung9Struct.AmpB];
 Data_delta_t    = [1;2;3;4;6;7;8;9];
 Data_omega      = [1;2;3;4;6;7;8;9];
 Data_Fomega1    = [1;2;3;4;6;7;8;9];
 Data_phi        = [1;2;3;4;6;7;8;9];

%% Daten der Tabelle Berechnen

tabelleAufgabe1 = table(Messungen,Data_T,Data_2y_0,Data_2x_0,Data_delta_t,Data_omega,Data_Fomega1,Data_phi);

disp(tabelleAufgabe1)