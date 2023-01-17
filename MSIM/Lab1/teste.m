Nactions = 5;
Ntime = 5;
x = (1:Nactions); % actions
y = (1:Ntime); % time
[X,Y] = meshgrid(x,y);
z = rand(Ntime,Nactions);
w = waterfall(X,Y,z);
w.EdgeColor = 'b';
w.EdgeAlpha = 1;
w.FaceColor = 'b';
w.FaceAlpha = 0.3;
xlabel('actions')
ylabel('time')
zlabel('probabilities')
title('waterfall')