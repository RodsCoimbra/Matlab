%% Para limpar o que tinha antes no workspace
clc
clear;
close all;

%% Cenas de equações diferenciais
syms v(t) u;
a = 0.09;
Kt = 10;
b = 1;
s = diff(v,t) == a*v*(1-v/Kt)-b*u*v; 
y(u) = dsolve(s);  %meter o solver com uma função que varia u
y(u);