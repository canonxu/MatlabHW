%2014/11/8 DIP Project2
% mean filter
clear;clc;
A=imread('monkey.jpg');
A=rgb2gray(A); %ת��Ϊ�Ҷ�ͼ��
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %��Ӹ�˹����
subplot(1,2,1)
imshow(A)
xlabel('(a)')
subplot(1,2,2)
imshow(B)
xlabel('(b)')
