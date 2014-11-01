%canonxu 2014/10/21
%Numerical analysis/Chapter 2/3
clear;clc;
%%%%%%%%%�˴ζ���ʽ��ֵ%%%%%%%%%%%%%%
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
    Dw(i)=y1(i)/polyval(q(i,:),x1(i));%ϵ�� 
end
p=Dw*q; 
syms x L8; 
for i=1:n 
    L8(i)=p(n-i+1)*x^(i-1);
end
disp('8���������ղ�ֵ'); 
L8=vpa(collect((sum(L8))),5);
xi=0:64; 
yi=polyval(p,xi);

%%%%%%%%%%����������ֵ%%%%%%%%%%%%
x1=[0 1 4 9 16 25 36 49 64];
y1=[0 1 2 3 4 5 6 7 8];
x2=[0:1:64]; 
y3=spline(x1,y1,x2);  
p=polyfit(x2,y3,3);  %�õ�����������Ϻ���
S=p(1)+p(2)*x+p(3)*x^2+p(4)*x^3

%%%%%%%%%%%%%ԭ����y=sqrt(x)%%%%%%%%%
x1=[0 1 4 9 16 25 36 49 64];
y4=sqrt(x1);

%%%%%%%%%%%%%%��ͼ%%%%%%%%%%%%%%%%%%%%
figure  
plot(xi,yi,x1,y1,'rx',x2,y3,x1,y1,'yo',x1,y4,'k*');
hold on 
xlabel('x');
ylabel('y');
title('��ȷ�ȶԱ�');
legend('8��ţ�ٲ�ֵ','����������ֵ','ԭ����y=sqrt(x)',0)
