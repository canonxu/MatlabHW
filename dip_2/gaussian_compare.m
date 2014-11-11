clear;clc;
A=imread('flower.jpg');
A=rgb2gray(A); %转化为灰度图像
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %添加高斯噪声
%均值滤波%
C1=imfilter(B,[3 3]);
%维那滤波%
C2=wiener2(B,[3 3]);
%中值滤波%
C3=medfilt2(B,[3 3]);
%小波变换去噪%
% B=double(B);      
[c,l]=wavedec2(B,2,'coif2');   
n=[1,2];                    
p=[10.28,24.08]; % 设置阈值向量 , 对高频小波系数进行阈值处理     
nc=wthcoef2('h',c,l,n,p,'s');  
C4=waverec2(nc,l,'coif2');% 图像的二维小波重构        
subplot(3,2,1);imshow(A);xlabel('(a)');
subplot(3,2,2);imshow(B);xlabel('(b)');
subplot(3,2,3);imshow(C1);xlabel('(c)');
subplot(3,2,4);imshow(C2);xlabel('(d)');
subplot(3,2,5);imshow(C3);xlabel('(e)');
subplot(3,2,6);imshow(C4);xlabel('(f)');
