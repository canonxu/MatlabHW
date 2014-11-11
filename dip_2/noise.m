%2014/11/8 DIP Project2
% noise
clear;clc;
A=imread('flower.jpg');
A=rgb2gray(A); %转化为灰度图像
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %添加高斯噪声
C=imnoise(A,'salt & pepper');%添加椒盐噪声
D=imnoise(A,'speckle');%添加乘性噪声
subplot(2,2,1);
imshow(A);
xlabel('（a）'); %原图X
subplot(2,2,2);
imshow(B);
xlabel('（b）'); %高斯噪声图
subplot(2,2,3);
imshow(C);
xlabel('（c）'); %椒盐噪声图
subplot(2,2,4);
imshow(D);
xlabel('（d）'); %乘性噪声图