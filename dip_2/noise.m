%2014/11/8 DIP Project2
% noise
clear;clc;
A=imread('flower.jpg');
A=rgb2gray(A); %ת��Ϊ�Ҷ�ͼ��
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %��Ӹ�˹����
C=imnoise(A,'salt & pepper');%��ӽ�������
D=imnoise(A,'speckle');%��ӳ�������
subplot(2,2,1);
imshow(A);
xlabel('��a��'); %ԭͼX
subplot(2,2,2);
imshow(B);
xlabel('��b��'); %��˹����ͼ
subplot(2,2,3);
imshow(C);
xlabel('��c��'); %��������ͼ
subplot(2,2,4);
imshow(D);
xlabel('��d��'); %��������ͼ