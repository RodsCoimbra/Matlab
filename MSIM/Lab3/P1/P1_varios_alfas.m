%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_varios_alfas");

%% Gráfico da posição
figure();
Tfinal=10;
plot(S.t, S.z,S.t, S.z1,S.t, S.z2,S.t, S.z3,S.t, S.z4, "linewidth", 1)
legend("Alfa = -0.6","Alfa = -0.7","Alfa = -0.8","Alfa = -0.9","Alfa = -1")
axis([0 Tfinal 0 11])
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Gráfico da distância da bola ao solo em função do tempo para vários alfas iniciais");
%% Gráfico da velocidade
figure()
plot(S.t, S.v,S.t, S.v1,S.t, S.v2,S.t, S.v3,S.t, S.v4,"linewidth", 1)
legend("Alfa = -0.6","Alfa = -0.7","Alfa = -0.8","Alfa = -0.9","Alfa = -1")
xlim([0 Tfinal]);
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Gráfico da velocidade da bola em função do tempo para vários alfas iniciais");