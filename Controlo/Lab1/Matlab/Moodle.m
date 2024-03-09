%% Para limpar o que tinha antes no workspace
clc
clear;
close all;
%% Dados do enunciado
A = 10;
C = 10^-3;
G = 10; 
Heq = 180;
Meq = 13.5;



%% Variáveis dependentes
Ueq  = sqrt((Meq)/(C*sqrt(2*G*Heq)));
K1 = (-4*Heq)/Ueq;
p = Meq/(2*A*Heq);
K2 = (2 * Heq)/Meq;

%% Moodle 1 e 2
fprintf("Pergunta 1:\nUeq=%f\n",Ueq)
fprintf("K1=%f\n",K1)
fprintf("K2=%.4f\n",K2)
fprintf("p=%.6f\n",p)

%% Moodle 2 e 4
clear;
A = 10;
C = 10^-3;
G = 10; 
Ueq  = 20;
Meq = 4;

Heq = (Meq^2)/(Ueq^4*C^2 * 2 * G);
K1 = (-4*Heq)/Ueq;
p = Meq/(2*A*Heq);
K2 = (2 * Heq)/Meq;

fprintf("\nPergunta 2:\nHeq = (Meq^2)/(Ueq^4*C^2 * 2 * G), logo não depende de A\n")

Heq = 5;
Kp= 6;
Gclr = (-Kp*K1)/(1-Kp*K1);
Tau1 = 1/((1-Kp*K1)*p); 
Gcld = 1/(p*A*(1-Kp*K1));
Tau2 = 1/((1-Kp*K1)*p);
fprintf("\nPergunta 4:\nInstável para Kp <= -1\nGclr(0) = %.10f\nConst. de tempo de Gclr = %.10f\n", Gclr, Tau1)
fprintf("Gcld(0) = %.10f\nConst. de tempo de Gcld = %.10f\n",Gcld, Tau2)
fprintf("Quando Kp aumenta:\n\tGclr(0) aumenta, estando cada vez mais próximo de 1.\n\tConst. de tempo diminui\n")
fprintf("Quando Kp diminui:\n\tGclr(0) diminui, estando cada vez mais próximo de 0.\n\tConst. de tempo aumenta\n\n")

%% Pergunta 5
KI =0.01;
wn1 = sqrt(-p*K1*KI);
amort1 = p/(2*wn1);
wn2 = sqrt(-p*K1*KI);
amort2 = p/(2*wn2);
fprintf("Pergunta 5:\nKI > 0\nGclr(0) = 1\nFrequência natural = %f\nCoeficiente de amortecimento =%f\n", wn1,amort1)
fprintf("Gcld(0) = 0\nFrequência natural = %f\nCoeficiente de amortecimento =%f\n", wn2,amort2)
