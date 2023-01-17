%% Para limpar o que tinha antes no workspace
clc
clear;
close all;
%% Dados iniciais do problema
K12 = 0.3*3600;
K21 = 0.2455*3600;
K10 = 0.0643*3600;
V1 = 3110;
V2 = 3110;
delta = 1000;
d = 3*ones(1,15);
d = upsample(d,6);
% a1 = 3*ones(1,3);
% a2 = upsample(a1,2);
% a3 = upsample(a1,3);
% a4 = upsample(a1,4);
% d = cat(2,a4,a3);
% d = cat(2,d,a2);
h = 1;
c1_inicial = 0;
c2_inicial = 0;

%% Matriz com as funções
syms c1 c2 d1;
Matriz1 = [(1/V1)*(-K12-K10) (1/V1)*K21; (1/V2)*K12 (-1/V2)*K21];
Matriz2 = [c1;c2];
Matriz3 = [1/V1; 0];
Matriz_funcao = Matriz1*Matriz2 + Matriz3*delta*d1; %%Matriz da derivada de c1 e c2
f1(c1,c2,d1) = Matriz_funcao(1);   
f2(c1,c2,d1) = Matriz_funcao(2);

%% Método de Euler
x(1) = 0; % Definição da condição inicial
kfinal = length(d);
%Prealocação do espaço dos arrays t, c11 e c22
t = zeros(1,kfinal);   
c11 = zeros(1,kfinal); %c1
c22 = zeros(1,kfinal); %c2
for k=1:kfinal-1
    t(k+1) = k;   % t é o vetor de tempo discreto entre 0 e kfinal-1
    c11(k+1)=c11(k)+h*f1(c11(k),c22(k),d(k));
    c22(k+1)=c22(k)+h*f2(c11(k),c22(k),d(k));
end

% %% Plot 1
figure()
subplot(2,2,1);     %Para criar dois plots separados na mesma figura
plot(t,c11,'r',t,c22,'g', 'linewidth', 1.5);
title("Evolução das concentrações dos compartimentos no tempo com doses a cada 6 dias");
legend("Compartimento 1","Compartimento 2");
ylabel("Concentrações [mg/kg]");
xlabel("Tempo [dias]");
xlim([0 inf]);
grid on
% subplot(2,1,2);
% plot(t,d,'b', 'linewidth', 1.5);
% ylabel("Concentrações [mg/dia]");
% title("Evolução das concentrações da dose no tempo");
% xlabel("Tempo [dias]");
% xlim([0 inf]);
% grid on

% %% Parte 2
c2conc = c22 + 7.1903;
u = c22 ./ c2conc;
% figure()
subplot(2,2,2);
plot(u)
title('Modelo farmacodinâmico')
xlabel('Dias')
grid on;
ylabel('Efeito do fármaco')
% legend('Doses de 3mg', 'Doses de 6mg', 'Doses de 9mg', 'Doses de 12mg')
legend('Doses de 3mg')
%% Parte 4
a = 0.09;
b = 1;
Kt = 10;
V1= ones(1,kfinal);
for k=1:kfinal-1
V1(k+1) = V1(k) + h*(a*V1(k)*(1-V1(k)/Kt)- b*u(k)*V1(k));
end

% figure()
subplot(2,2,[3 4]);
hold on;
grid on;
plot(t, V1,'g','linewidth', 1);
% yline(0.1,'--','10% do valor inicial do tumor');
ylim([0 inf]);
xlim([0 80])
ylabel("Volume do tumor [mm^3]");
xlabel("Tempo [dias]");
title("Evolução do tumor com doses a cada 6 dias")

%% Parte 5
