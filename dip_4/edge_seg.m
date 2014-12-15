%Time:2013.12.8
%Author:徐佳能 1140349174
%Discription： DIP Project4
clear all;
close all;
I=imread('brain.bmp');%原图
figure, imshow(I)
log_seg = edge(I,'log');%使用log算子进行边缘检测
figure, imshow(log_seg)
roberts_seg = edge(I,'roberts');%使用roberts算子进行边缘检测
figure, imshow(roberts_seg)
sobel_seg = edge(I,'sobel');%使用sobel算子进行边缘检测
figure, imshow(sobel_seg)
prewitt_seg = edge(I,'prewitt');%使用prewitt算子进行边缘检测
figure, imshow(prewitt_seg)
canny_seg = edge(I,'canny');%使用canny算子进行边缘检测
figure, imshow(canny_seg)

