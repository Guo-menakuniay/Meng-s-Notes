y0=[1;1;0];
tspan=[0,1e3];
[t1,y1]=rk4(@lorenz,tspan,y0,1e5);
[t2,y2]=ode45(@lorenz,tspan,y0);
figure();
P=plot3(y2(:,1),y2(:,2),y2(:,3));
setP = threeViews3D(P);
setP.Color('g','m','b');     % 线条颜色
setP.LineStyle('-','-','-'); % 线条样式
setP.LineWidth(1.,1.,1.); % 线条粗细
xlabel('x axis');ylabel('y axis');zlabel('z axis');
title('极限环数值仿真示意图')


function [t,y]=rk4(f,tspan,y0,n)
%四阶Runge-Kutta算法
%f:dy/dt=f(t,y);求解区间tspan:[t0,tf];初值y0=y(t0)=[x0,y0,z0];n采样点数
h=(tspan(2)-tspan(1))/n;
t=tspan(1):h:tspan(2);
y=zeros(length(y0),length(t));
y(:,1)=y0;
for m=2:length(t)
    k1=f(t(m-1),y(:,m-1));
    k2=f(t(m-1)+h/2,y(:,m-1)+k1*h/2);
    k3=f(t(m-1)+h/2,y(:,m-1)+k2*h/2);
    k4=f(t(m-1)+h,y(:,m-1)+k3*h);
    y(:,m)=y(:,m-1)+(k1+2*k2+2*k3+k4)*h/6;
end
t=t';
y=y';
end

function dy_dt=lorenz(t,y)
%y=[x,y,z]储存三个变量的矩阵
p=0;
r=0;
b=8/3;
dx_dt=p*(y(2)-y(1));
dy_dt=r*y(1)-y(2)-y(1)*y(3);
dz_dt=y(1)*y(2)-b*y(3);
dy_dt=[dx_dt;dy_dt;dz_dt];
end

