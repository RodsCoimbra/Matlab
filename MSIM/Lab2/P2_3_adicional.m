%% Para limpar o que tinha antes no workspace
clc;
clear;
close all;

%% Dados iniciais do problema
Njogadas = 5000;
NMC = 100; 
Ncasas = 7;
rand('state',0);  %#ok<RAND>
Ndiscard = 20;
y = zeros(1,Njogadas);
Freq_relativa = zeros(Ncasas, NMC);
p1 = 1/22;
p2 = 3/44;
p3 = 1/4;
p4 = 7/44;
p5 = 9/44;
p6 = 2/11;
p7 = 1/11;
p = [1/22,3/44, 1/4, 7/44, 9/44, 2/11, 1/11];


%% Simulação do jogo
for NMC=1:NMC
hh=waitbar(NMC/1000);
z = zeros(1, Ncasas);
for j=1:NMC
x = 0;
% avanca = randi([1 2]);
% x = x + avanca;
Lancamentos=zeros(1,2); %cara = 1, coroa = 2
for k=1:Njogadas
    avanca = randi([1 2]);
    x = x + avanca;
    Lancamentos(avanca)= Lancamentos(avanca) + 1; %Para o histograma com a face da moeda
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
end
for k=(Ndiscard+1):Njogadas
    z(y(k))= z(y(k))+1;
end
end
Freq_relativa(:,NMC) = z./((Njogadas-Ndiscard)*NMC);
end
close(hh)

%% Plot e erros
Erro = zeros(Ncasas,NMC);
Media_erros = zeros(1,NMC);
for k=1:NMC
    for j=1:Ncasas
Erro(j,k) = (abs(Freq_relativa(j,k)- p(j)))/p(j);
Media_erros(1,k)= Media_erros(1,k) + Erro(j,k);
    end 
    Media_erros(1,k) = Media_erros(1,k)/Ncasas;
end
Simulacoes= 1:NMC;
figure(1)
plot(Simulacoes,Media_erros)
hold on
yline(0.01,'--','1% do erro relativo')
xlabel("Nº de jogadas")
ylabel("Erro relativos")
title("Probabilidade relativa média de todos os estados em função do número de jogadas")
 