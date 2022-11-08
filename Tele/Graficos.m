%% Limpar
clc
clear
close all

%% código BPSK
%Criar uma figura só com o nome do ficheiro e sem figura 1 escrito
figure('NumberTitle', 'off', 'Name', 'BPSK') 
x = [0 0.2 0.4 0.6 0.8 1.0]; 
y = [0 0 0 0 0 0];
ax1 = nexttile;
plot(ax1,x,y, '.b-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 0V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

ax2 = nexttile;
plot(ax2,x,y, '.g-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 0.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

ax3 = nexttile;
plot(ax3,x,y, '.r-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 1V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 2
x2 = [0 0.2 0.4 0.6 0.8 1.0];
y2 = [2 0 1 0 1 45];
xi2 = (0:0.01:1); %Fazer pontos de 0.01 em 0.01 entre 0 e 1
yi2=pchip(x2,y2,xi2); %Fazer um smooth aos gráficos
ax4 = nexttile;
plot (ax4,xi2,yi2,'c-','LineWidth',1.5)
hold on
plot (x2,y2,'.c', 'MarkerSize', 12) %Meter só os pontos de dados com marcas
title('Noise Voltage = 1.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 3

x3 = [0 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.6 0.8 1.0];
xi3 = (0:0.01:1);
y3 = [11 6 5 5 5 6 6 5 6 6 6 6 43 80 11];
yi3=pchip(x3,y3,xi3);
ax5 = nexttile;
plot (ax5,xi3,yi3,'m-','LineWidth',1.5)
hold on
plot (x3,y3,'.m', 'MarkerSize', 12)
title('Noise Voltage = 2V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 6
x6 = [0 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.6 0.8 1.0];
xi6 = (0:0.01:1);
y6 = [16 14 14 14 14 14 14 12 14 12 13 16 15 16 16 16 16 19 104 103];
yi6=pchip(x6,y6,xi6);
ax6 = nexttile;
plot (ax6,xi6,yi6,'k-','LineWidth',1.5)
hold on
plot (x6,y6,'.k', 'MarkerSize', 12)
title('Noise Voltage = 2.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on



%% 7
x7 = [0 0.1 0.12 0.14 0.16 0.18 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.6 0.8 1];
xi7 = (0:0.01:1);
y7 = [24 27 25 24 24 22 21 21 23 22 25 28 27 27 27 28 26 87 80 97];
yi7=pchip(x7,y7,xi7);
ax7 = nexttile;
plot (ax7,xi7,yi7,'b-','LineWidth',1.5)
hold on
plot (x7,y7,'.b', 'MarkerSize', 12)
title('Noise Voltage = 3V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 8
x8 = [0 0.2 0.22 0.24 0.26 0.28 0.3 0.32 0.34 0.36 0.38 0.4 0.6 0.8 1.0];
xi8 = (0:0.01:1);
y8 = [37 36 35 34 35 38 65 84 84 80 71 96 111 93 87];
yi8=pchip(x8,y8,xi8);
ax8 = nexttile;
plot (ax8,xi8,yi8,'g-','LineWidth',1.5)
hold on
plot (x8,y8,'.g', 'MarkerSize', 12)
title('Noise Voltage = 3.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on


%% 9
x9 = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.4 0.6 0.8 1];
xi9 = (0:0.01:1);
y9 = [43 43 42 43 40 41 41 43 44 46 63 99 100 104 94];
yi9=pchip(x9,y9,xi9);
ax9 = nexttile;
plot (ax9,xi9,yi9,'r-','LineWidth',1.5)
hold on
plot (x9,y9,'.r', 'MarkerSize', 12)
title('Noise Voltage = 4V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

















%% código QPSK
figure('NumberTitle', 'off', 'Name', 'QPSK')
a = [0 0.2 0.4 0.6 0.8 1.0];
b = [0 0 0 0 0 0];
axi1 = nexttile;
plot(axi1,a,b, '.b-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 0V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 2
a4 = [0 0.2 0.4 0.6 0.8 1.0];
b4 = [0 0 0 8 18 0];
axi2 = nexttile;
plot(axi2,a4,b4, '.g-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 0.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 3
a5 = [0 0.2 0.4 0.6 0.8 0.82 0.84 0.86 0.88 0.9 0.92 0.94 0.96 0.98 1.0];
b5 = [6 1 1 6 4 3 2 1 1 1 1 1 1 1 0];
axi3 = nexttile;
plot(axi3,a5,b5, '.r-','LineWidth',1.5, 'MarkerSize', 12)
title('Noise Voltage = 1V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on


%% 4
a2 = [0 0.2 0.4 0.6 0.8 0.82 0.84 0.86 0.88 0.9 0.92 0.94 0.96 0.98 1.0];
b2 = [14 10 10 14 9 9 9 9 9 8 8 8 9 9 7];
ai2 = (0:0.01:1);
bi2=pchip(a2,b2,ai2);
axi4 = nexttile;
plot (axi4,ai2,bi2,'c-','LineWidth',1.5)
hold on
plot (a2,b2,'.c', 'MarkerSize', 12)
title('Noise Voltage = 1.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 5

a3 = [0 0.2 0.4 0.6 0.62 0.64 0.66 0.68 0.7 0.72 0.74 0.76 0.78 0.8 1.0];
ai3 = (0:0.01:1);
b3 = [25 21 28 33 23 21 19 20 17 17 18 17 16 16 88];
bi3=pchip(a3,b3,ai3);
axi5 = nexttile;
plot (axi5,ai3,bi3,'m-','LineWidth',1.5)
hold on
plot (a3,b3,'.m', 'MarkerSize', 12)
title('Noise Voltage = 2V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 6
a6 = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.4 0.6 0.8 1];
ai6 = (0:0.01:1);
b6 = [35 34 33 33 32 33 32 30 31 32 34 53 51 97 78];
bi6=pchip(a6,b6,ai6);
axi6 = nexttile;
plot (axi6,ai6,bi6,'k-','LineWidth',1.5)
hold on
plot (a6,b6,'.k', 'MarkerSize', 12)
title('Noise Voltage = 2.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on



%% 7
a7 = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.4 0.6 0.8 1];
ai7 = (0:0.01:1);
b7 = [43 42 42 42 41 43 44 43 43 43 41 47 111 91 79];
bi7=pchip(a7,b7,ai7);
axi7 = nexttile;
plot (axi7,ai7,bi7,'b-','LineWidth',1.5)
hold on
plot (a7,b7,'.b', 'MarkerSize', 12)
title('Noise Voltage = 3V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on

%% 8
a8 = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.4 0.6 0.8 1];
ai8 = (0:0.01:1);
b8 = [50 50 49 49 49 48 46 52 51 50 55 108 120 93 94];
bi8=pchip(a8,b8,ai8);
axi8 = nexttile;
plot (axi8,ai8,bi8,'g-','LineWidth',1.5)
hold on
plot (a8,b8,'.g', 'MarkerSize', 12)
title('Noise Voltage = 3.5V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on


%% 9
a9 = [0 0.02 0.04 0.06 0.08 0.1 0.12 0.14 0.16 0.18 0.2 0.4 0.6 0.8 1];
ai9 = (0:0.01:1);
b9 = [59 59 58 58 55 56 54 53 62 63 67 82 112 95 107];
bi9=pchip(a9,b9,ai9);
axi9 = nexttile;
plot (axi9,ai9,bi9,'r-','LineWidth',1.5)
hold on
plot (a9,b9,'.r', 'MarkerSize', 12)
title('Noise Voltage = 4V')
xlabel('Loop Bandwidth')
ylabel('Nº erros')
grid on
%% Eixos
%Para meter tudo na mesma figura (os ax) e definir os eixos de 0 a 1(x) e a
%125 o (y). Caso quisesse meter até onde bate em vez de 125 mudar para inf
axis([ax1 ax2 ax3 ax4 ax5 ax6 ax7 ax8 ax9 axi1 axi2 axi3 axi4 axi5 axi6 axi7 axi8 axi9],[0 1 0 125])
