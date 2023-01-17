%% Só para limpar tudo
clear all
clc 
close all

%% Simulink
S = sim("Lab3_P4_AB");

%% Gráficos
figure();
Xfinal=35;
axis([0 Xfinal 0 15])
xline(15,'--', 'Mudança de chão',  "Linewidth", 1.5);
xline(30,'-', 'Parede',  "Linewidth", 1.5);
hold on
curve=animatedline;
for ii=1:length(S.z)
addpoints(curve,S.x(ii),S.z(ii));
drawnow
% pause(0.0001)
end
hold off
% plot(S.x,S.z)