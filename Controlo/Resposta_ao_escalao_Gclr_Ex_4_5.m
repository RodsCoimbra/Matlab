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
Gclr = tf((-p*K1*KI), [1 p -p*K1*KI]);
step(Gclr)
Max1=max(step(Gclr));
wn1 = sqrt(-p*K1*KI);
amort1 = p/(2*wn1);
grid()
hold()
%Sistema criticamente amortecido
KI = 1/100;
Gclr = tf((-p*K1*KI), [1 p -p*K1*KI]);
step(Gclr)
Max2=max(step(Gclr));
wn2 = sqrt(-p*K1*KI);
amort2 = p/(2*wn2);
%Sistema sobreamortecido
KI = 1/400;
Gclr = tf((-p*K1*KI), [1 p -p*K1*KI]);
step(Gclr)
Max3=max(step(Gclr));
wn3 = sqrt(-p*K1*KI);
amort3 = p/(2*wn3);
legend('Sistema subamortecido','Sistema criticamente amortecido','Sistema sobreamortecido')
fprintf("Máximo para:\nKI = 1:\t %f\nKI = 0.01: \t %f\nKI = 0.0025:\t %f\n", Max1, Max2, Max3)
fprintf("Frequência natural para:\nKI = 1:\t %f\nKI = 0.01: \t %f\nKI = 0.0025:\t %f\n", wn1(1), wn2(1), wn3(1))
fprintf("Coeficiente de amortecimento para:\nKI = 1:\t %f\nKI = 0.01: \t %f\nKI = 0.0025:\t %f\n", amort1(1), amort2(1), amort3(1))