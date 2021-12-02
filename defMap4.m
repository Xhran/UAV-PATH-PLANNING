function [X,Y,Z] = defMap4(mapRange)

% 初始化地形信息
Data=load('mapInfor10001000.mat')
peakData=Data.peakData
% 构造曲面网格，用于插值判断路径是否与山峰交涉
x = [];
for i = 1:mapRange(1)
    x = [x; ones(mapRange(2),1) * i];
end
y = (1:mapRange(2))';
y = repmat(y,length(peakData(:))/length(y),1);
peakData = reshape(peakData,length(peakData(:)),1);
[X,Y,Z] = griddata(x,y,peakData,...
    linspace(min(x),max(x),1000)',...
    linspace(min(y),max(y),1000));
surf(X,Y,Z)      % 画曲面图
shading flat     % 各小曲面之间不要网格
end