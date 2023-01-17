%% Só para limpar tudo
clear all
clc 
close all
%% Simulink
k = -1;
S = sim("Lab3_original_teste");
T = S.t;
Z = S.z;
for k=-0.99:0.01:-0.01
S = sim("Lab3_original_teste");
Z=cat(2,Z,S.z);
end
k = -1:0.01:-0.01;
clear S
%% Surface
mesh(k,T,Z);
ylim([0 10])
xlabel("Alfa")
ylabel("Tempo [s]")
zlabel("Altura em relação ao chão [m]")
title("Superficie com a evolução da altura em relação ao tempo fazendo variar o valor do alfa")