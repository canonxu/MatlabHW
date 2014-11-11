%2014/11/8 DIP Project2
% wavelet filter
clear;clc;
A=imread('en.jpg');              
A=rgb2gray(A);  
B=imnoise(A,'gaussian');  %��Ӹ�˹����   
B=double(B);      
[c,l]=wavedec2(B,2,'coif2');   
n=[1,2];                    
p=[10.28,24.08]; % ������ֵ���� , �Ը�ƵС��ϵ��������ֵ����     
nc=wthcoef2('h',c,l,n,p,'s');  
C=waverec2(nc,l,'coif2');% ͼ��Ķ�άС���ع�           
mc=wthcoef2('v',nc,l,n,p,'s');    
D=waverec2(mc,l,'coif2');%�����ع�  
hc=wthcoef2('v',c,l,n,p,'s');
E=waverec2(hc,l,'coif2');%�����ع�
subplot(1,3,1)
imshow(C);
xlabel('(a)')
subplot(1,3,2)
imshow(C);
xlabel('(b)')
subplot(1,3,3)
imshow(E);
xlabel('(c)')
