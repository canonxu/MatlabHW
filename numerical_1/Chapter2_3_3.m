%canonxu 2014/10/21
%Numerical analysis/Chapter 2/3
clear;clc;
%%%%%%%%%八次多项式差值%%%%%%%%%%%%%%
x1=[0 1 4 9 16 25 36 49 64];
y1=[0 1 2 3 4 5 6 7 8];
n=length(y1);
a=ones(n,2);
a(:,2)=-x1';
c=1;
for i=1:n
    c=conv(c,a(i,:));
end
q=zeros(n,n);
r=zeros(n,n+1);
for i=1:n
    [q(i,:),r(i,:)]=deconv(c,a(i,:));
end
Dw=zeros(1,n);
for i=1:n  
    Dw(i)=y1(i)/polyval(q(i,:),x1(i));%系数 
end
p=Dw*q; 
syms x L8; 
for i=1:n 
    L8(i)=p(n-i+1)*x^(i-1);
end
disp('8次拉格朗日插值'); 
L8=vpa(collect((sum(L8))),5);
xi=0:64; 
yi=polyval(p,xi);

%%%%%%%%%%三次样条差值%%%%%%%%%%%%
x1=[0 1 4 9 16 25 36 49 64];
y1=[0 1 2 3 4 5 6 7 8];
x2=[0:1:64]; 
y3=spline(x1,y1,x2);  
p=polyfit(x2,y3,3);  %得到三次样条拟合函数
S=p(1)+p(2)*x+p(3)*x^2+p(4)*x^3

%%%%%%%%%%%%%原函数y=sqrt(x)%%%%%%%%%
x1=[0 1 4 9 16 25 36 49 64];
y4=sqrt(x1);

%%%%%%%%%%%%%%作图%%%%%%%%%%%%%%%%%%%%
figure  
plot(xi,yi,x1,y1,'rx',x2,y3,x1,y1,'yo',x1,y4,'k*');
hold on 
xlabel('x');
ylabel('y');
title('精确度对比');
legend('8次牛顿差值','三次样条差值','原函数y=sqrt(x)',0)
