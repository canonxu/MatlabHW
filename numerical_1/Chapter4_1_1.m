%canonxu 2014/10/21
%Numerical analysis/Chapter 4/1(1)
%首先建立函数文件f.m
clear;clc;  
h=0.0000001;%h为步长,可分别令h=1,0.1,0.01,0.001
n=1/h;
t=0;
s1=0;
s2=0; 
for i=1:n-1     
    t=t+f(i*h);
end
T=h/2*(0+2*t+f(1));
T=vpa(T,15) %梯形公式 
for i=0:n-1     
    s1=s1+f(h/2+i*h);
end
for i=1:n-1   
    s2=s2+f(i*h); 
end
S=h/6*(0+4*s1+2*s2+f(1));
S=vpa(S,15) %辛普森公式