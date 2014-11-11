%2014/11/8 DIP Project2
% mean filter
clear;clc;
A=imread('monkey.jpg');
A=rgb2gray(A); %转化为灰度图像
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %添加高斯噪声
subplot(1,2,1)
imshow(A)
xlabel('(a)')
subplot(1,2,2)
imshow(B)
xlabel('(b)')
