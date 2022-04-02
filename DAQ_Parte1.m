%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Lab IM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;

fs =50000;                  %Sample frequency (samples per unit time or space)
n = 100;                    %Number of samples

%%  Aquisição dos dados   
dq = daq("ni");             %The daq command creates a DataAcquisition object.

%By default, run at a scan rate of 1000 scans per second. To acquire at a higher rate, change the Rate property.
dq.Rate = fs;               %Define a frequência de amostragem

ch = addinput(dq,"Dev2", "ai0","Voltage"); %The addinput command attaches an input channel to the DataAcquisition.

%The read command starts the acquisition and returns the results as a timetable.
data = read(dq, seconds(n+1/fs)); %Sampled data

sn = data.Dev2_ai0;         %Sampled Signal

%% Variáveis de intresse 

dt = 1/fs;                  %Time or space increment per sample
t = (0:n-1)/fs;             %Time or space range for data
y = fft(sn);                %Discrete Fourier transform of data (DFT)
df = fs/n;                  %Frequency increment
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


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% espetro = abs(fft(sn2))./n; 
% 
% % indice da Amplitude máxima do espetro em módulo
% [~,index_max] = max((espetro(2:N)));
% 
% if index_max == 1
%     index_l=index_max;
% elseif espetro(index_max-1) > espetro(index_max+1) 
%     index_l = index_max - 1;
% else 
%     index_l = index_max;
% end
% ind = index_l - 1;  
% 
% % Expressões grandes para o cálculo do lambda, sabendo que S_L = U_L + jV_L
% 
% U_A = real(espetro(index_l));     
% U_B = real(espetro(index_l + 1)); 
% V_A = imag(espetro(index_l));     
% V_B = imag(espetro(index_l + 1)); 
% 
% k_Opt = ((V_B - V_A) * sin(nr2 * ind) + (U_B - U_A) * cos(nr2 * ind)) / (U_B - U_A);
% 
% Z_1 = V_A *((k_Opt - cos(nr2 * ind))/(sin(nr2*ind))) + U_A;
% 
% Z_2 = V_B *((k_Opt - cos(nr2*(ind + 1)))/(sin(nr2*(ind + 1)))) + U_B;
% 
% freq2 = ((fs^2)/(2*pi*n))*(acos((Z_2*cos(nr2*(ind + 1)) - Z_1*cos(ind*nr2))/(Z_2 - Z_1)));
% 
% 
% 



%% Calculo da rms e da média 
k = 0;                      %Variáveis auxiliares
j = 0;

for i=1:n
    k = k + pow2(sn(i));    %Somatório da amplitude do sinal ao quadrado em cada amostra
    j = j + sn(i);          %Somatório da amplitude do sinal em cada amostra
end
k = k/n;                    %dividir pelo nr de amostras
rms = sqrt(k);              %raiz deste valor (pelo livro) é a rms
Mean = j/n;                 %dividir pelo nr de amostras dá a média

%% Calculo da amplitude das primeiras 11 harmonicas
sn3 = abs(y)/n;
[~,idx]=max(sn3(1:N));


for k = 1:11
    if k==1
        index = idx; %frequencia fundamental
    else
        index = (idx-1)*k;
    end
    Har(k) = sn3(index);
    HardB(k) = 20*log10((Har(k)));
    %fprintf(1,"Amplitude da harmonica %d = %.3f (V)\n",k,Har(k));
    %fprintf(1,"Amplitude da harmonica %d = %.3f (dB)\n",k,HardB(k));
end
% Calculo da distorcao harmonica total
Thd = 20*log10(sqrt(sum(Har(2:11).^2))/Har(1));
fprintf(1,"THD(db)=%.3f\n",Thd);

%% Diferença de fase e alcance
Max = sn(1);
Min = sn(1);
tempo = dt;
t1=ceil(fs*(1/freq) + 1);
for i=2:t1
    if(Max < sn(i))
        Max = sn(i);
%       tempo = i*dt;
    end
    if(Min > sn(i))
        Min = sn(i);
    end
end
% Max2 = sn2(1);
% tempo2 = dt;
% t2 = ceil(fs*(1/freq2) + 1);
% for i=2:t2
%     if(Max2 < sn2(i))
%         Max2 = sn2(i);
%         tempo2 = i*dt;
%     end
% end
% 
% delta_t = tempo2-tempo;
% fase = 2* pi*delta_t*freq;

%% Gráfico
P2 = abs(y/n);
P1 = P2(1:N);
P1(2:end-1) = 2*P1(2:end-1);
P1 = 20*log10(P1(1:N));
Periodo = (1/freq);
subplot(2,1,1)
plot(t,sn);  %Plot do sinal amostrado
if(max(t) > 5 * Periodo)
xlim([0 5*Periodo]);
end
title(sprintf("Freq - %.2f, Valor médio - %f, Rms - %.2f, N.Amostras - %.2f, Freq. de amost. - %.2f, Alcance - [%.2f ,%.2f] ", freq, Mean, rms, n, fs,Min, Max));
xlabel("Tempo [s]")
ylabel("Tensão [V]")

f = fs *(0:N-1)/n;
subplot(2,1,2)
plot(f,P1);               %Plot do espetro de potência
xlabel("Frequência [ω]")
ylabel("Amplitude [dBV]")
fprintf(1,"Res. esp=%f\n",df);
fprintf(1,"Res. tem=%f\n",dt);
