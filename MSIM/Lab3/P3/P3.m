%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S1 = sim("Lab3_original_P3");
S2 = sim("Lab3_P3");

%% Gráficos posição
figure();
Tfinal=20;
axis([0 Tfinal 0 15])
plot(S1.t, S1.z)
hold on
plot(S2.t,S2.z)

%% Gráficos velocidade
figure(2)
plot(S1.t, S1.v)
hold on
plot(S2.t,S2.v)