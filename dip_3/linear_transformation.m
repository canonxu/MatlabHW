clear all;close all;
I = imread('couple.bmp');
I = im2double(I);
[row, col] = size(I);
figure,imshow(I);
figure,imhist(I); 
M=fftshift(fft2(I));
figure,imshow(uint8(abs(M)),[])

%���ӶԱȶ�
Fa = 4; Fb = -75;
o = Fa .* I + Fb / 255;  %�ı�Fa��ֵ�ɵõ� ��ͬЧ����ͼ��

figure,imshow(o); %�Ҷȱ任���ͼ��
figure,imhist(o); %ֱ��ͼ
O=fftshift(fft2(o));
figure,imshow(uint8(abs(O)),[]) %Ƶ��ͼ
