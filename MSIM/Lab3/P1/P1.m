%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_original");

%% Gráfico da posição
figure();
Tfinal=10;
% hold on
% curve=animatedline;
% for ii=1:length(S.t)
% addpoints(curve,S.t(ii),S.z(ii));
% drawnow
% pause(0.0001)
% end
% hold off
% figure()
plot(S.t, S.z)
axis([0 Tfinal 0 11])
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Gráfico da distância da bola ao solo em função do tempo");
%% Gráfico da velocidade
figure()
plot(S.t, S.v)
xlim([0 Tfinal]);
xlabel("Tempo[s]");
ylabel("Velocidade da bola [m/s]");
title("Gráfico da velocidade da bola em função do tempo");


%% Gráfico para o zeno
figure();
Tfinal=20;
plot(S.t, S.z)
axis([0 Tfinal 0 11])
xlabel("Tempo[s]");
ylabel("Distância relativamente ao solo [m]");
title("Gráfico da distância da bola ao solo em função do tempo");
ax=axes;
set(ax,'units','normalized','position',[0.5,0.5,0.35,0.35])
box(ax,'on')
plot(S.t, S.z,'parent',ax)
set(ax,'xlim',[12.6,13.1],'ylim',[-0.001,0.005])
title("Zoom do gráfico")

