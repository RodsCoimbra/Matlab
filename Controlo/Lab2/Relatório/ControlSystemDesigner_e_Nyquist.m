clear
close all
clc

%% Dados do sistema
s = tf('s');
k0 = 1.382;
a = 37.04;
G = k0 * (a/(s+a));

% ControlSystem
controlSystemDesigner(G/s) %Para encontrar o z e um k1 que cumpram os parâmetros

%% Diagrama de nyquist para o atraso
z = 14.89
k1 = 6.9094
K = (k1/z) * (s+z)/s 
tau = deg2rad(110)/11.5
Sistema_com_atraso = G * K * exp(-tau*s)
nyquist(Sistema_com_atraso)