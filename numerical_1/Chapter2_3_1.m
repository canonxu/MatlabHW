%canonxu 2014/10/21
%Numerical analysis/Chapter 2/3
clear;clc;
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
figure  
plot(xi,yi,x1,y1,'rx');
hold on 
xlabel('x');
ylabel('y');
title('8次拉格朗日插值');