clear all;close all;
I = imread('couple.bmp');
I = im2double(I);
[row, col] = size(I);
figure,imshow(I);
figure,imhist(I); 
M=fftshift(fft2(I));
figure,imshow(uint8(abs(M)),[])

%增加对比度
Fa = 4; Fb = -75;
o = Fa .* I + Fb / 255;  %改变Fa的值可得到 不同效果的图像

figure,imshow(o); %灰度变换后的图像
figure,imhist(o); %直方图
O=fftshift(fft2(o));
figure,imshow(uint8(abs(O)),[]) %频谱图
