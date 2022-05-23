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


%% Resolução
Ueq  = sqrt((Meq)/(C*sqrt(2*G*Heq)));
K1 = (-4*Heq)/Ueq;
p = Meq/(2*A*Heq);
K2 = (2 * Heq)/Meq;
%Sistema subamortecido
KI = 1;
Gclr1 = tf((-p*K1*KI), [1 p -p*K1*KI]);
%Sistema criticamente amortecido
KI = 1/100;
Gclr2 = tf((-p*K1*KI), [1 p -p*K1*KI]);
%Sistema sobreamortecido
KI = 1/400;
Gclr3 = tf((-p*K1*KI), [1 p -p*K1*KI]);
rlocus(Gclr1, Gclr2, Gclr3) 
grid()
legend('Sistema subamortecido','Sistema criticamente amortecido','Sistema sobreamortecido')