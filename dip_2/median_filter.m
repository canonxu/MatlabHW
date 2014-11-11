%2014/11/8 DIP Project2
% media filter

clear;clc;
A=imread('monkey.jpg');
A=rgb2gray(A); %ת��Ϊ�Ҷ�ͼ��
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %��ӽ�������
C=medfilt2(B,[3 3]);
D=medfilt2(B,[9 9]);
E=medfilt2(B,[15 15]);
% C=filter2(B,fspecial('average',[ 1])); %ģ��ߴ�Ϊ3
% D=filter2(B,fspecial('average',[9 9])); %ģ��ߴ�Ϊ6
subplot(1,3,1);
imshow(C);
xlabel('��a��'); %ģ��ߴ�Ϊ3�ľ�ֵ�˲�
subplot(1,3,2);
imshow(D);
xlabel('��b��'); %ģ��ߴ�Ϊ6�ľ�ֵ�˲�
subplot(1,3,3);
imshow(E);
xlabel('��c��'); %ģ��ߴ�Ϊ9�ľ�ֵ�˲�
