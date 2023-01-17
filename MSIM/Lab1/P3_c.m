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


%% Parte 2

c2conc = c22 + 7.1903;
u = c22 ./ c2conc;

%% Quiver
a = 0.09;
b = 1;
Kt = 10;
length_x= 1000 + 1;
length_y= 2000 + 1;
alfa = zeros(length_y,length_x);
[x,y] = meshgrid(0:1/(length_x-1):1,-10:20/(length_y-1):10);
Derivada = a*y.*(1-y/Kt)- b*x.*y;
for k=1:length_y
    for f=1:length_x
        if Derivada(k,f)>0
            Derivada(k,f) = 1;
        
        elseif Derivada(k,f)<0
            Derivada(k,f) = -1;  
        end
    end
end
s= surf(x,y,Derivada);
set(s,'edgecolor','none')
xlabel("Efeito do fármaco")
ylabel("Volume do tumor [mm^3]")
title("Derivada do volume com o volume e com o efeito")
xlim([-0.01 1.01])