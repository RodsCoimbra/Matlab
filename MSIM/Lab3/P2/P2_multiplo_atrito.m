%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_P2_atrito_variavel");

%% Gráficos posição
figure();
Tfinal=8;
plot(S.t, S.z,S.t, S.z1,S.t, S.z2,S.t, S.z3, "linewidth", 1)
xlim([0 Tfinal])
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Comparação da distância da bola ao solo em função do tempo e do seu atrito");
legend("Atrito de 0.25v", "Atrito de 0.5v","Atrito de 1v","Atrito de 2v");
%% Gráficos velocidade
figure()
plot(S.t, S.v,S.t, S.v1,S.t, S.v2,S.t, S.v3,"linewidth", 1)
xlim([0 Tfinal]);
ylim([-14 12]);
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Comparação da velocidade da bola em função do tempo e do seu atrito");
legend("Atrito de 0.25v", "Atrito de 0.5v","Atrito de 1v","Atrito de 2v");

%% Gráfico velocidade do 2Beta
figure()
plot(S.t, S.v3,"linewidth", 1)
xlim([0 Tfinal]);
ylim([-6 6]);
yline(-4.905,"--", "Velocidade igual a -4.905", "linewidth", 1)
grid on
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Comparação da velocidade da bola em função do tempo e do seu atrito");