classdef threeViews3D
    %     @author :好玩的MATLAB
    %     Email   :2377389590@qq.com
    %+++++++++++++++++++++++++++++++++++++++++++++++++++++
    %     后期此代码迭代、勘误gitee连接
    %     https://gitee.com/iDMatlab/threeViews3D
    % %================举列================================
    %     clc;clear;close all;
    %     t = linspace(-10,10,1000);
    %     xt = exp(-t./10).*sin(5*t);
    %     yt = exp(-t./10).*cos(5*t);
    %     P=plot3(xt,yt,t,'-o','MarkerIndices',200);
    %     setP = threeViews3D(P);
    %     setP.Color('r','b','c')
    %     setP.LineStyle('-','-','-')
    %     setP.LineWidth(1,1,1)
    %     setP.Marker('o','p','>')
    %     setP.MarkerSize(1,1,1)
    %     setP.MarkerEdgeColor('r','b','c')
    %     setP.MarkerFaceColor('r','b','c')
    % ++++++++++++++++++++++++++++++++++++++++++++++++++++
    properties
        Parent;
        % 投影的绘图句柄
        Px,Py,Pz;
        % 数据
        XData,YData,ZData;
    end
    methods
        function obj = threeViews3D(P)
            %首先判断输入的句柄是否可以画三维图
            if isempty(P.ZData)
                disp('不能绘制三维透视图')
                return
            end
            obj.Parent=P.Parent;
            hold(obj.Parent,'on');
            % 获取数据
            len=length(P.XData);
            obj.XData=P.XData;obj.YData=P.YData;obj.ZData=P.ZData;
            % 投影位置设定
            % -----------Xlim 限定参数---------------------
            xMax=max(obj.XData);
            xMin=min(obj.XData);
            xLen=xMax-xMin;
            xLim=[xMin-xLen*0.2,xMax+xLen*0.2];
            % -----------Ylim 限定参数---------------------
            yMax=max(obj.YData);
            yMin=min(obj.YData);
            yLen=yMax-yMin;
            yLim=[yMin-yLen*0.2,yMax+yLen*0.2];
            % -----------Zlim 限定参数---------------------
            zMax=max(obj.ZData);
            zMin=min(obj.ZData);
            zLen=zMax-zMin;
            zLim=[zMin-zLen*0.2,zMax+zLen*0.2];
            % 三视图
            obj.Px=plot3(xLim(2)*ones(len,1),obj.YData,obj.ZData);
            obj.Py=plot3(obj.XData,yLim(2)*ones(len,1),obj.ZData);
            obj.Pz=plot3(obj.XData,obj.YData,zLim(1)*ones(len,1));
            % 图像属性设置
            ax=gca;
            grid on;
            ax.TickDir='out';
            ax.XMinorTick='on';
            ax.YMinorTick='on';
            ax.FontSize=14;
            ax.LineWidth=2;
            ax.GridLineStyle=':';
            ax.GridColor=[0,0,0];
            ax.FontName='Cambria';
            ax.Box='on';
            xlim(xLim);ylim(yLim);zlim(zLim);
            %  xlim([xLim(1)-0.2*xLen,xLim(2)+0.2*xLen]);
            %  ylim([yLim(1)-0.2*yLen,yLim(2)+0.2*yLen]);
            %  zlim([zLim(1)-0.2*zLen,zLim(2)+0.2*zLen]);
        end
        % --------------------颜色设置----------------------------------
        function Color(obj,XColor,YColor,ZColor)
                obj.Px.Color=XColor;
                obj.Py.Color=YColor;
                obj.Pz.Color=ZColor;
        end
        % ------------------线条格式设置--------------------------------
        function LineStyle(obj,XLineStyle,YLineStyle,ZLineStyle)
            obj.Px.LineStyle=XLineStyle;
            obj.Py.LineStyle=YLineStyle;
            obj.Pz.LineStyle=ZLineStyle;
        end
        %-------------------线条粗细-------------------------------------
        function LineWidth(obj,XLineWidth,YLineWidth,ZLineWidth)
            obj.Px.LineWidth=XLineWidth;
            obj.Py.LineWidth=YLineWidth;
            obj.Pz.LineWidth=ZLineWidth;
        end
        %-------------------标记大小-------------------------------------
        function MarkerSize(obj,XMarkerSize,YMarkerSize,ZMarkerSize)
            obj.Px.MarkerSize=XMarkerSize;
            obj.Py.MarkerSize=YMarkerSize;
            obj.Pz.MarkerSize=ZMarkerSize;
        end
        %-------------------标记类型-------------------------------------
        function Marker(obj,XMarker,YMarker,ZMarker)
            obj.Px.Marker=XMarker;
            obj.Py.Marker=YMarker;
            obj.Pz.Marker=ZMarker;
        end
        %-------------------标记填充颜色--------------------------------
        function MarkerEdgeColor(obj,XMarkerEdgeColor,YMarkerEdgeColor,ZMarkerEdgeColor)
            obj.Px.MarkerEdgeColor=XMarkerEdgeColor;
            obj.Py.MarkerEdgeColor=YMarkerEdgeColor;
            obj.Pz.MarkerEdgeColor=ZMarkerEdgeColor;
        end
        function MarkerFaceColor(obj,XMarkerFaceColor,YMarkerFaceColor,ZMarkerFaceColor)
            obj.Px.MarkerFaceColor=XMarkerFaceColor;
            obj.Py.MarkerFaceColor=YMarkerFaceColor;
            obj.Pz.MarkerFaceColor=ZMarkerFaceColor;
        end
    end
end