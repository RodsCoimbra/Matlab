%% Para limpar o que tinha antes no workspace
clc
clear;
close all;

%% Dados iniciais do problema
rand('state',0);  %#ok<RAND>
Njogadas = 30;  %tamanho maximo q consigo correr: 100000 x 10000
NMC = 1000000;                                                
Ndiscard = 0;
Ncasas = 7;
conta4=zeros(1,Njogadas);

%% Simulação do jogo
for r=1:NMC
    hh=waitbar(r/NMC);
    x = 0;
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
        if x==4
            conta4(k)= conta4(k)+1;  %conta 4          
        end   
    end
end
conta4=conta4./NMC;
close(hh)

%% plots para 3
figure()
bar(conta4);
hold on
yline(7/44, '--','Valor esperado');
xlabel('Jogadas');
ylabel('Probabilidade de ocorrer o estado 4');
xlim([1 32])
