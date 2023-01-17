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
d = 3*ones(1,10);
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

%% Efeito
c2conc = c22 + 7.1903;
u = c22 ./ c2conc;
figure(1)
plot(u)
title('Evolução do efeito dos fármacos com e sem resistência')
xlabel('Dias')
ylabel('Efeito do fármaco')
%% Volume
a = 0.09;
b = 1;
Kt = 10;
V1= ones(1,kfinal);
for k=1:kfinal-1
V1(k+1) = V1(k) + h*(a*V1(k)*(1-V1(k)/Kt)- b*u(k)*V1(k));
end

figure(2)
hold on;
grid on;
plot(t, V1,'r','linewidth', 1);
ylabel("Volume do tumor [mm^3]");
xlabel("Tempo [dias]");
title("Evolução do tumor com e sem resistência do mesmo ao fármaco")

%% Parte 6 
R_irrecuperavel = 0;
R = 0;
c_threshold = 0.75;  
omega = 0.3; %Para compensar que a linearidade dá valores de R que sobem muito rapidamente
for k=1:kfinal-1
if c22(k) < c_threshold && c22(k) ~= 0
   R = R_irrecuperavel + omega*(c_threshold-c22(k));
   R_irrecuperavel = R;
end
end 
u1 = (c22 ./ c2conc)*(c_threshold/(R+c_threshold)); 
for k=1:kfinal-1
V1(k+1) = V1(k) + h*(a*V1(k)*(1-V1(k)/Kt)- b*u1(k)*V1(k));
end

%% Plot concentração
figure()
plot(t,c22,'g', 'linewidth', 1.25)
yline(c_threshold, '--','Concentração limite');
title("Evolução das concentração 2 no tempo");
legend("Compartimento 2")
ylabel("Concentrações [mg/kg]");
xlabel("Tempo [dias]");
xlim([0 inf]);
grid on
hold on

%% Plot volume
figure(2)
plot(t, V1,'b','linewidth', 1);
legend("Sem resistência","Com resistência");

%% Plot efeito
figure(1)
grid on
hold on
plot(u1)
legend('Sem resistência', "Com resistência");
