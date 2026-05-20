clear
clc

% Furuta-Pendel
% physikalische Systemparameter
m1 = 0.257;     % Die Masse von Glied 1
m2 = 0.127;     % Die Masse von Glied 2
J1 = 0.000998;  % Das Träheitsmoment von Glied 1 um die z-Achse von {1}
J2x = 0.0012;   % Das Träheitsmoment von Glied 2 um die x-Achse von {2}
J2y = 0.0012;   % Das Träheitsmoment von Glied 2 um die y-Achse von {2}
J2z = 0.000003; % Das Träheitsmoment von Glied 2 um die z-Achse von {2}
l1 = 0.2159;    % 
lc1 = 0.0619;   % 
lc2 = 0.1556;   %
b1 = 0.0024;    % Die viskose Reibungskonstante von Gelenk 1
b2 = 0.0024;    % Die viskose Reibungskonstante von Gelenk 2
g = 9.81;       %Erdbeschleunigung
k = 0.1285;     %Motoverstärkung von u nach M
sigma = 0.069;  %Motorverstärkung von nach M
%_________________________________________________________________
c1 = m1*lc1^2 + m2*l1^2 + J1 + J2z;
c2 = m2*lc2^2 + J2x - J2z;
c3 = m2*l1*lc2;
c4 = m2*lc2^2 + J2y;
c5 = m2*g*lc2;
delta = c1*c4 - c3^2;
%__________________________________________________________________
% Die Anfangswerte der Systemzustände
theta_0 = deg2rad(180);
alpha_0 = deg2rad(90);
theta_p0 = 0;
alpha_p0 = 0;


%% Bearbeitung durch Frederik von Baeyer 1340064
% Aufgabe 2:

A = [0 0 1 0; 0 0 0 1; 0 (c3*c5)/delta -(c4*(sigma + b1))/delta -c3*b2/delta; 0 c1*c5/delta -(c3*(sigma + b1))/delta -c1*b2/delta];
B = [0; 0; c4*k/delta; c3*k/delta];

eigenwerte = eig(A);

EigenVorgabe =  [-4; -4; -4; -4];

K = acker(A, B, EigenVorgabe);

Acl = (A-B*K); 

eigenAcl = eig(Acl);

sysOL = ss(A,B,[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1],0);
sysCL = ss(Acl,B,[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1],0);


figure(1)
step(sysOL)

figure(2)
step(sysCL)







