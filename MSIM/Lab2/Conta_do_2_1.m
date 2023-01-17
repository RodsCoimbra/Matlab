%% Para limpar o que tinha antes no workspace
clc
clear;
close all;

%% Conta
format rational
syms p1 p2 p3 p4 p5 p6 p7

Matriz1=[-1 , 0 , 0 , 0 , 0 , 0 , 0.5  ;
0.5 , -1 , 0 , 0 , 0 , 0 , 0.5  ;
0.5 , 0.5 , -1 , 0 , 0.5 , 0.5 , 0  ;
0 , 0.5 , 0.5 , -1 , 0 , 0 , 0  ;
0 , 0 , 0.5 , 0.5 , -1 , 0 , 0  ;
0 , 0 , 0 , 0.5 , 0.5 , -1 , 0  ;
0 , 0 , 0 , 0 , 0 , 0.5 , -1 ;
1 , 1 , 1 , 1 , 1 , 1 , 1];

Matriz2=[p1;p2;p3;p4;p5;p6;p7];

Matriz3=[0;
0;
0;
0;
0;
0;
0;
1];

A = solve(Matriz1*Matriz2==Matriz3);
x=[double(A.p1); double(A.p2); double(A.p3); double(A.p4); double(A.p5); double(A.p6); double(A.p7)];

