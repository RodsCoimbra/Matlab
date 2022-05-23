%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lab IM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

fs = 20000;                  %Sample frequency (samples per unit time or space)


%%  Aquisição dos dados   
dq = daq("ni");             %The daq command creates a DataAcquisition object.

%By default, run at a scan rate of 1000 scans per second. To acquire at a higher rate, change the Rate property.
dq.Rate = fs;               %Define a frequência de amostragem

ch = addinput(dq,"Dev2", "ai0","Voltage"); %The addinput command attaches an input channel to the DataAcquisition.

%The read command starts the acquisition and returns the results as a timetable.
data = read(dq, seconds(1)); %Sampled data

sn = data.Dev1_ai0;         %Sampled Signal

%% Variáveis de intresse 
n = 1000;                    %Number of samples
dt = 1/fs;                  %Time or space increment per sample
t = (0:n-1)/fs;             %Time or space range for data

a = 10*cos(2*pi*600*t);
sn1 = a + 2*rand(size(t));
b = 10*cos(2*pi*300*t);
sn2 = b + 2.5*rand(size(t));
c = 10*cos(2*pi*600*t);
sn3 = c + 2.3*rand(size(t));
sn=[sn1; sn2; sn3];
y = fft(sn1);                %Discrete Fourier transform of data (DFT)
df = fs/n;                  %Frequency increment
n_sinais = 3;



%% Frequência com o IPDFT
espetro = abs(y)./n; 

N = floor(n/2);

nr = (2 * pi)/n;

nr2 = (2 * pi)* dt;

% indice da Amplitude máxima do espetro em módulo
[~,index_max] = max((espetro(2:N)));

if index_max == 1
    index_l=index_max;
elseif espetro(index_max-1) > espetro(index_max+1) 
    index_l = index_max - 1;
else 
    index_l = index_max;
end
ind = index_l - 1;  

% Expressões grandes para o cálculo do lambda, sabendo que S_L = U_L + jV_L

U_A = real(espetro(index_l));     
U_B = real(espetro(index_l + 1)); 
V_A = imag(espetro(index_l));     
V_B = imag(espetro(index_l + 1)); 

k_Opt = ((V_B - V_A) * sin(nr2 * ind) + (U_B - U_A) * cos(nr2 * ind)) / (U_B - U_A);

Z_1 = V_A *((k_Opt - cos(nr2 * ind))/(sin(nr2*ind))) + U_A;

Z_2 = V_B *((k_Opt - cos(nr2*(ind + 1)))/(sin(nr2*(ind + 1)))) + U_B;

freq = ((fs^2)/(2*pi*n))*(acos((Z_2*cos(nr2*(ind + 1)) - Z_1*cos(ind*nr2))/(Z_2 - Z_1)));

%% Calculo da rms e da média 
k = 0;                      %Variáveis auxiliares
k1= 0;
Mean1=0;
Mean=0;
for i=1:n_sinais
    for j=1:n
    k = k + pow2(sn(i,j));    %Somatório da amplitude do sinal ao quadrado em cada amostra
    Mean = Mean + sn(i,j);      %Somatório da amplitude do sinal em cada amostra
    end
    k = k/n;
    k = sqrt(k);
    k1 = k + k1;
    Mean= Mean/n;
    Mean1 = Mean1 + Mean;
    k = 0;
    Mean = 0;
end
rms = k1/n_sinais;                    %dividir pelo nr de amostras
Mean = Mean1/n_sinais;              %dividir pelo nr de amostras dá a média


%% Diferença de fase e alcance
Max = sn(1,1);
Min = sn(1,1);
t1=ceil(fs*(1/freq) + 1);
for i=2:t1
    if(Max < sn(1,i))
        Max = sn(1,i);
    end
    if(Min > sn(1,i))
        Min = sn(1,i);
    end
end

%% Gráfico
P3 = 0;
%f = fs *(0:N-1)/n;
for i=1:n_sinais
P2 = abs(sn(i,:)/n);
P1 = P2(1:N);
P1(2:end-1) = 2*P1(2:end-1);
% subplot(3,1,i)
% plot(f,P1);               %Plot do espetro de potência
% set(gca, 'YScale', 'log')
P3 = P3 + P1;
end
P3 = P3/n_sinais; %média do espectro de potência unilateral das diversas aquisições
Periodo = (1/freq);
subplot(2,1,1)
plot(t,sn(1,:));  %Plot do sinal amostrado
if(max(t) > 5 * Periodo)
xlim([0 5*Periodo]);
end
title(sprintf("Rms estimado - %.2f, SINAD - ?, Nº bits efic. - ?, N.Amostras - %.2f, Freq. de amost. - %.2f, Alcance - [%.2f ,%.2f] ", rms, n, fs,Min, Max));
xlabel("Tempo [s]")
ylabel("Tensão [V]")

f = fs *(0:N-1)/n;
subplot(2,1,2)
plot(f,P3);               %Plot do espetro de potência
set(gca, 'YScale', 'log')
xlabel("Frequência [ω]")
ylabel("Amplitude [BD]")
