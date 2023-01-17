%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_varias_velocidades");

%% Gráfico da posição
figure();
Tfinal=10;
plot(S.t, S.z,S.t, S.z1,S.t, S.z2,S.t, S.z3, "linewidth", 1)
legend("Vel. inicial = 10","Vel. inicial = 5","Vel. inicial = 0","Vel. inicial = -5");
xlim([0 Tfinal]);
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Gráfico da distância da bola ao solo em função do tempo para várias velocidades iniciais");
%% Gráfico da velocidade
figure()
plot(S.t, S.v,S.t, S.v1,S.t, S.v2,S.t, S.v3,"linewidth", 1)
legend("Vel. inicial = 10","Vel. inicial = 5","Vel. inicial = 0","Vel. inicial = -5");
xlim([0 Tfinal]);
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Gráfico da velocidade da bola em função do tempo para várias velocidades iniciais");