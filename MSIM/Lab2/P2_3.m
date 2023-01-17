% Para limpar o que tinha antes no workspace
clc;
clear;
close all;

% Dados iniciais do problema
Njogadas = 20;
NMC = 1000; 
Ncasas = 7;
Aluguer = [10, 10, 0, 15, 20, 25, 0, 35];
rand('state',0);  %#ok<RAND>
Ndiscard = 0;
y = zeros(1,Njogadas);
z = zeros( Ncasas, Njogadas);
% Simulação do jogo
for j=1:NMC
hh=waitbar(j/NMC);
x = 0;
avanca = randi([1 2]);
x = x + avanca;
for k=1:Njogadas
    avanca = randi([1 2]);
    x = x + avanca;
    if x == 7
    x=3;
    end
    if x == 8 && avanca==2
    x=7; 
    end
    if x > Ncasas
        x = x - Ncasas;
    end
    y(k)=x;
    z(x,k)= z(x,k)+1;
end
end
close(hh)

Freq_relativa = z./NMC;
%% Plot
figure()
hold on
for j=1:7
     plot(Freq_relativa(j,:))
end
xlim([1,20])
legend("Estado 1","Estado 2","Estado 3","Estado 4","Estado 5","Estado 6","Estado 7");
xlabel("Nº da jogada")
ylabel("Probabilidade relativa de estar em cada estado")
title("Probabilidade relativa dos estados em função da jogada")
 
