clc
clear
close all
%% Fitting
% f=[3.7 35.19 61.96 99.73 109.3 133.8 156.1 173.9]'; %frequências registadas no lab
% Hf=[2.05 -0.39 -2.19 -6.03 -6.25 -7.54 -8.65 -9.51]'; %Ganhos registadas no lab
% HfL=10 .^(Hf/20);
%  
% F = @(x,xdata)(x(2)./sqrt(x(1)^2+(2*pi*xdata).^2)); %Função de fitting
%  
% x0=[25 20]; % Parâmetros iniciais
% [x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,f,HfL);
%  
% Hf_fit=x(2) ./sqrt(x(1)^2+(2*pi*f).^2);
incr = 0.01;
f_more=(0:incr:200);
% Hf_fit_more=x(2) ./sqrt(x(1)^2+(2*pi*f_more).^2);

%% Dados do sistema
s = tf('s');
K0 = 1.5;
a = 37.04;
z = 5;
G = K0*a/(s+a);

%% Gráficos
%Gráfico dos Dados experimentais,Dados aproximados e do Fitting dos dados
% semilogx(f,20*log10(HfL),'ro',f,20*log10(Hf_fit),'bo', ...
% f_more,20*log10(Hf_fit_more),'b-')
% hold()

gr = -20*log10(f_more)+ 1; %Assintota das altas frequências 
gy = 0 + 0*(0:0.01:1); %Assintota das baixas frequências
semilogx(f_more,gy, 'r')
hold()
grid()
semilogx(f_more,gr,'m')
%%%%%%%%%%%%%%%

yline(40, 'c--') %Curva a menos 3db do fitting original, para descobrir frequência de corte
grid()
yline(-40, 'c--') %Curva a menos 3db do fitting original, para descobrir frequência de corte
%limites para eixo do x e para o eixo do y
% % ylim([-12 4]) 
% % xlim([1 1000])
% legend('Dados experimentais','Dados aproximados','Fitting dos dados','Assintota das baixas frequências','Assintota das altas frequências','Amplitude de corte')