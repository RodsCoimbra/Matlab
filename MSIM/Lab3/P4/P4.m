%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_P4");

%% Gráficos
figure();
Xfinal=20;
axis([0 Xfinal 0 15])
xline(15,'-', 'Parede',  "Linewidth", 1.5);
hold on
curve=animatedline;
for ii=1:length(S.z)
addpoints(curve,S.x(ii),S.z(ii));
drawnow
% pause(0.0001)
end
hold off
% plot(S.x,S.z)