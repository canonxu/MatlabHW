%2014/11/8 DIP Project2
% wavelet filter
clear;clc;
A=imread('en.jpg');              
A=rgb2gray(A);  
B=imnoise(A,'gaussian');  %添加高斯噪声   
B=double(B);      
[c,l]=wavedec2(B,2,'coif2');   
n=[1,2];                    
p=[10.28,24.08]; % 设置阈值向量 , 对高频小波系数进行阈值处理     
nc=wthcoef2('h',c,l,n,p,'s');  
C=waverec2(nc,l,'coif2');% 图像的二维小波重构           
mc=wthcoef2('v',nc,l,n,p,'s');    
D=waverec2(mc,l,'coif2');%二次重构  
hc=wthcoef2('v',c,l,n,p,'s');
E=waverec2(hc,l,'coif2');%三次重构
subplot(1,3,1)
imshow(C);
xlabel('(a)')
subplot(1,3,2)
imshow(C);
xlabel('(b)')
subplot(1,3,3)
imshow(E);
xlabel('(c)')
