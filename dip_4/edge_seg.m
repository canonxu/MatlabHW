%Time:2013.12.8
%Author:����� 1140349174
%Discription�� DIP Project4
clear all;
close all;
I=imread('brain.bmp');%ԭͼ
figure, imshow(I)
log_seg = edge(I,'log');%ʹ��log���ӽ��б�Ե���
figure, imshow(log_seg)
roberts_seg = edge(I,'roberts');%ʹ��roberts���ӽ��б�Ե���
figure, imshow(roberts_seg)
sobel_seg = edge(I,'sobel');%ʹ��sobel���ӽ��б�Ե���
figure, imshow(sobel_seg)
prewitt_seg = edge(I,'prewitt');%ʹ��prewitt���ӽ��б�Ե���
figure, imshow(prewitt_seg)
canny_seg = edge(I,'canny');%ʹ��canny���ӽ��б�Ե���
figure, imshow(canny_seg)

