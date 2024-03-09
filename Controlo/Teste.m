% clear
close all
clc

%% Dados do sistema
% s = tf('s');
% k = 0.1;
% a = 9;
% % G = k * (((s-a)*(s-10*a))/((s+a)*s));
% % G = (0.1/(s*(s+1)^2))*((s+10^-2)/(10^-2))*exp(-0.158396*s)
% % G = (((s-a)*(s-90))/((s+a)*s));
% % G = (0.1/(s*(s+1)^2))
% G = ((s-a)/((s+a)*s));
% nyqlog(G);
% % controlSystemDesigner(G);


%% Dados do sistema
% s = tf('s');
% k = 10;
% m = 0;
% z = 10;
% G = tf((1),[1 2]);
% K = k*tf([1 1],[1 0]);
% A = k*100/(s*(s+10)^2);
% B = (1/s^2) * (k/s^m) * ((s+z)/z)
% nyqlog(B);
% controlSystemDesigner(B);

%% Dados do sistema
s = tf('s');
% G = tf((1),[1 0 0]);
% K = 0.5*(s+1)^2/s;
% a = 0.1;
% k= 0;
% F=k *((s+a)/(a * s^2 * (s+1)));
G =(1/(s+1));
K = (10/s) * ((s+10)/(10));
F = G*K;
controlSystemDesigner(F)
% nyqlog(F);