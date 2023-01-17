%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S1 = sim("Lab3_original_P2");
S2 = sim("Lab3_P2");

%% Gráficos posição
figure();
Tfinal=15;
plot(S1.t, S1.z)
axis([0 Tfinal 0 11])
hold on
plot(S2.t,S2.z)
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Comparação da distância da bola ao solo em função do tempo com e sem atrito");
legend("Sem atrito", "Com atrito elevado");
%% Gráficos velocidade
figure(2)
plot(S1.t, S1.v)
xlim([0 Tfinal]);
hold on
plot(S2.t,S2.v)
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Comparação da velocidade da bola em função do tempo com e sem atrito");
legend("Sem atrito", "Com atrito elevado");