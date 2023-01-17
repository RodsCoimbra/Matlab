%% Para limpar o que tinha antes no workspace
clc
clear;
close all;

%% Dados iniciais do problema
rand('state',0);  
Njogadas = 1000000; 
Ndiscard = 11;
Ncasas = 7;
z = zeros(1, Ncasas);
y = zeros(1,Njogadas);
Aluguer = [10, 10, 0, 15, 20, 25, 35];
x = 0;
renda = zeros(1, Ncasas);
Lancamentos=zeros(1,2); %cara = 1, coroa = 2

%% Simulação do jogo
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
    if k>Ndiscard
    renda(x) = Aluguer(x) + renda(x);
    end
end
for k=(Ndiscard+1):Njogadas
    z(y(k))= z(y(k))+1;
end

%% Plots para 1b)
figure(2)
Freq_relativa=z./(Njogadas-Ndiscard);
bar(Freq_relativa);
xlabel("Estados")
ylabel("Frequência relativa")
title("Frequências relativas de cada estado")

%% Adicionar as que foram descartadas para a 1a)
for k=1:Ndiscard
    z(y(k))= z(y(k))+1;
end
%% Plots para 1a)
figure(1)
subplot(2,1,1);
Jogadas=1:30;
bar(Jogadas,y(Jogadas));
xlabel("Jogada atual")
ylabel("Estado")
title("Estado em cada jogada")
subplot(2,1,2);
bar(Lancamentos);
xlabel("Face da moeda")
ylabel("Nº de jogadas")
title("Nº de ocorrência de cada face")
Moeda=["Cara","Coroa"];
set(gca,'xticklabel',Moeda)

%% Plots para 1c)
figure(3)
bar(renda./Njogadas)
xlabel("Estados")
ylabel("Renda média espectável")
title("Rendas médias espectáveis nas diversas casas")