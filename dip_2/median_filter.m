%2014/11/8 DIP Project2
% media filter

clear;clc;
A=imread('monkey.jpg');
A=rgb2gray(A); %转化为灰度图像
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %添加椒盐噪声
C=medfilt2(B,[3 3]);
D=medfilt2(B,[9 9]);
E=medfilt2(B,[15 15]);
% C=filter2(B,fspecial('average',[ 1])); %模板尺寸为3
% D=filter2(B,fspecial('average',[9 9])); %模板尺寸为6
subplot(1,3,1);
imshow(C);
xlabel('（a）'); %模板尺寸为3的均值滤波
subplot(1,3,2);
imshow(D);
xlabel('（b）'); %模板尺寸为6的均值滤波
subplot(1,3,3);
imshow(E);
xlabel('（c）'); %模板尺寸为9的均值滤波
