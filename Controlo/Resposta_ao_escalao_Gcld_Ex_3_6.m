%% Para limpar o que tinha antes no workspace
clc
clear;
close all;
%% Dados do enunciado
A = 10;
C = 10^-3;
G = 10; 
Heq = 5;
Meq = 4;



%% Variaveis dependentes
Ueq  = sqrt((Meq)/(C*sqrt(2*G*Heq)));
K1 = (-4*Heq)/Ueq;
p = Meq/(2*A*Heq);
K2 = (2 * Heq)/Meq;
Kp = 0.5;
Gcld = tf((1), [A A*p*(1-Kp*K1)]);
step(Gcld);
Max1=max(step(Gcld));
grid()
hold()
Kp = 5;
Gcld = tf((1), [A A*p*(1-Kp*K1)]);
step(Gcld);
Max2=max(step(Gcld));
Kp = 50;
Gcld = tf((1), [A A*p*(1-Kp*K1)]);
step(Gcld);
Max3=max(step(Gcld));
legend('Kp = 0.5','Kp = 5','Kp = 50')
fprintf("Máximo para Kp = 0.5:\t %f\nMáximo para Kp = 5: \t %f\nMáximo para Kp = 50:\t %f\n", Max1, Max2, Max3)