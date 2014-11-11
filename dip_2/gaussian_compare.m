clear;clc;
A=imread('flower.jpg');
A=rgb2gray(A); %ת��Ϊ�Ҷ�ͼ��
A=imresize(A,[256,256]);
B=imnoise(A,'gaussian'); %��Ӹ�˹����
%��ֵ�˲�%
C1=imfilter(B,[3 3]);
%ά���˲�%
C2=wiener2(B,[3 3]);
%��ֵ�˲�%
C3=medfilt2(B,[3 3]);
%С���任ȥ��%
% B=double(B);      
[c,l]=wavedec2(B,2,'coif2');   
n=[1,2];                    
p=[10.28,24.08]; % ������ֵ���� , �Ը�ƵС��ϵ��������ֵ����     
nc=wthcoef2('h',c,l,n,p,'s');  
C4=waverec2(nc,l,'coif2');% ͼ��Ķ�άС���ع�        
subplot(3,2,1);imshow(A);xlabel('(a)');
subplot(3,2,2);imshow(B);xlabel('(b)');
subplot(3,2,3);imshow(C1);xlabel('(c)');
subplot(3,2,4);imshow(C2);xlabel('(d)');
subplot(3,2,5);imshow(C3);xlabel('(e)');
subplot(3,2,6);imshow(C4);xlabel('(f)');
