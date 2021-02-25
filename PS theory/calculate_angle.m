%计算角度
function angle = calculate_angle(x1,y1,x2,y2,x3,y3)
% x1 = 1;y1 = 1;
% x2 = 1;y2 =45;%要计算的角的顶点
% x3 = 90;y3 = 90;
a2 = (x1-x2)*(x1-x2)+(y1-y2)*(y1-y2);
b2 = (x3-x2)*(x3-x2)+(y3-y2)*(y3-y2);
c2 = (x1-x3)*(x1-x3)+(y1-y3)*(y1-y3);
a = sqrt(a2);
b = sqrt(b2);
c = sqrt(c2);
pos = (a2+b2-c2)/(2*a*b);    %求出余弦值
angle = acos(pos);         %余弦值装换为弧度值
realangle = angle*180/pi;   %弧度值转换为角度值
angle = realangle;
