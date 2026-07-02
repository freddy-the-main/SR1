clear
clc

addpath("Messung_1")
addpath("Messung_2")
addpath("Messung_3")
addpath("Messung_4")
addpath("Messung_6")
addpath("Messung_7")
addpath("Messung_8")
addpath("Messung_9")


%% Messungsstrukturen semi automatisch erstellen:

% Messugn 1:
Messung1Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[],"t",[]);
for i=1:5
    filename = sprintf("Messung_1_%1d.mat",i);
    load(filename)
    Messung1Struct.A = [Messung1Struct.A;A];
    Messung1Struct.B = [Messung1Struct.B;B];
    Messung1Struct.C = [Messung1Struct.C;C];
    [Messung1Struct.length,~] = size(Messung1Struct.A);
    Messung1Struct.t = [1:Messung1Struct.length]'.*0.002;
end


% Messugn 1:
Messung2Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:6
    filename = sprintf("Messung_2_%1d.mat",i);
    load(filename)
    Messung2Struct.A = [Messung2Struct.A;A];
    Messung2Struct.B = [Messung2Struct.B;B];
    Messung2Struct.C = [Messung2Struct.C;C];
    [Messung2Struct.length,~] = size(Messung2Struct.A);
    Messung2Struct.t = [1:Messung2Struct.length]'.*0.002;
end


% Messugn 1:
Messung3Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:6
    filename = sprintf("Messung_3_%1d.mat",i);
    load(filename)
    Messung3Struct.A = [Messung3Struct.A;A];
    Messung3Struct.B = [Messung3Struct.B;B];
    Messung3Struct.C = [Messung3Struct.C;C];
    [Messung3Struct.length,~] = size(Messung3Struct.A);
    Messung3Struct.t = [1:Messung3Struct.length]'.*0.002;
end


% Messugn 1:
Messung4Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:6
    filename = sprintf("Messung_4_%1d.mat",i);
    load(filename)
    Messung4Struct.A = [Messung4Struct.A;A];
    Messung4Struct.B = [Messung4Struct.B;B];
    Messung4Struct.C = [Messung4Struct.C;C];
    [Messung4Struct.length,~] = size(Messung4Struct.A);
    Messung4Struct.t = [1:Messung4Struct.length]'.*0.002;
end


% Messugn 1:
Messung6Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:2
    filename = sprintf("Messung_6_%1d.mat",i);
    load(filename)
    Messung6Struct.A = [Messung6Struct.A;A];
    Messung6Struct.B = [Messung6Struct.B;B];
    Messung6Struct.C = [Messung6Struct.C;C];
    [Messung6Struct.length,~] = size(Messung6Struct.A);
    Messung6Struct.t = [1:Messung6Struct.length]'.*0.002;
end


% Messugn 1:
Messung7Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:3
    filename = sprintf("Messung_7_%1d.mat",i);
    load(filename)
    Messung7Struct.A = [Messung7Struct.A;A];
    Messung7Struct.B = [Messung7Struct.B;B];
    Messung7Struct.C = [Messung7Struct.C;C];
    [Messung7Struct.length,~] = size(Messung7Struct.A);
    Messung7Struct.t = [1:Messung7Struct.length]'.*0.002;
end

% Messugn 1:
Messung8Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:4
    filename = sprintf("Messung_8_%1d.mat",i);
    load(filename)
    Messung8Struct.A = [Messung8Struct.A;A];
    Messung8Struct.B = [Messung8Struct.B;B];
    Messung8Struct.C = [Messung8Struct.C;C];
    [Messung8Struct.length,~] = size(Messung8Struct.A);
    Messung8Struct.t = [1:Messung8Struct.length]'.*0.002;
end


% Messugn 1:
Messung9Struct = struct("A",[],"B",[],"C",[],"dt",0.002,"length",[]);
for i=1:4
    filename = sprintf("Messung_9_%1d.mat",i);
    load(filename)
    Messung9Struct.A = [Messung9Struct.A;A];
    Messung9Struct.B = [Messung9Struct.B;B];
    Messung9Struct.C = [Messung9Struct.C;C];
    [Messung9Struct.length,~] = size(Messung9Struct.A);
    Messung9Struct.t = [1:Messung9Struct.length]'.*0.002;
end

clearvars -except Messung9Struct Messung8Struct Messung7Struct Messung6Struct Messung4Struct Messung3Struct Messung2Struct Messung1Struct