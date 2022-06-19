clc;clear;close all;
t = linspace(0,10*pi,1000);
xt = exp(t./10).*sin(3*t);
yt = exp(t./10).*cos(3*t);
P=plot3(xt,t,yt,'-','color','k','LineWidth',1.5);
setP = threeViews3D(P);
setP.Color('g','m','b');     % 线条颜色
setP.LineStyle('-','-','-'); % 线条样式
setP.LineWidth(1.5,1.5,1.5); % 线条粗细

% setP.Marker('o','p','>');  %标记的样式
% setP.MarkerSize(1,1,1);    %标记的大小
% setP.MarkerEdgeColor('r','b','c');%标记的边缘颜色
% setP.MarkerFaceColor('r','b','c');%标记的填充颜色
% axis equal

xlabel('Real axis');ylabel('Time axis');zlabel('Imaginary axis')