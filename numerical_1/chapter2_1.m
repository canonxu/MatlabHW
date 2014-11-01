%canonxu 2014/10/21
%Numerical analysis/Chapter 2/1
clear;clc; 
x1=[0.2 0.4 0.6 0.8 1.0];  
y1=[0.98 0.92 0.81 0.64 0.38]; 
n=length(y1); c=y1(:);  
for j=2:n %�����   
    for i=n:-1:j       
        c(i)=(c(i)-c(i-1))/(x1(i)-x1(i-j+1));   
    end
end
syms x df d;
df(1)=1;d(1)=y1(1); 
for i=2:n %��ţ�ٲ�ֵ����ʽ  
    df(i)=df(i-1)*(x-x1(i-1));    
    d(i)=c(i)*df(i);
end
disp('4��ţ�ٲ�ֵ����ʽ');
P4=vpa(collect((sum(d))),5) %P4��Ϊ4��ţ�ٲ�ֵ����ʽ,������С�����5λ��
pp=csape(x1,y1, 'variational');%���������������� 
q=pp.coefs; 
disp('������������');
for i=1:4 
    S=q(i,:)*[(x-x1(i))^3;(x-x1(i))^2;(x-x1(i));1]; 
    S=vpa(collect(S),5)
end
x2=0.2:0.08:1.08; 
dot=[1 2 11 12];
figure 
ezplot(P4,[0.2,1.08]);
hold on  
y2=fnval(pp,x2);
x=x2(dot); 
y3=eval(P4); 
y4=fnval(pp,x2(dot)); 
plot(x2,y2,'r',x2(dot),y3,'bo',x2(dot),y4,'r*'); 
title('');
xlabel('x');
ylabel('y');
legend('4��ţ�ٲ�ֵ','����������ֵ')