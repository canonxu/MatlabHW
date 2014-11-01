x1=[0 1 4 9 16 25 36 49 64];
y1=[0 1 2 3 4 5 6 7 8];
x2=[0:1:64]; 
y3=spline(x1,y1,x2);  
p=polyfit(x2,y3,3);  %得到三次样条拟合函数
S=p(1)+p(2)*x+p(3)*x^2+p(4)*x^3
figure  
plot(x2,y3,x1,y1,'rx');
hold on 
xlabel('x');
ylabel('y');
title('三次样条差值');