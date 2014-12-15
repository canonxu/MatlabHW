%Time:2013.12.8
%Author:徐佳能 1140349174
%Discription： DIP Project4
clear all;
close all;
I= imread('hat.bmp');
figure, imshow(I);
h=fspecial('sobel');
fd=double(I);
g=sqrt(imfilter(fd,h,'replicate').^2+imfilter(fd,h','replicate').^2); 
figure, imshow(g);
g2=imclose(imopen(g,ones(3,3)),ones(3,3));
figure, imshow(g2);
im=imextendedmin(g2,10);
Lim = watershed(bwdist(im)); %分水岭算法，取脊像素为0
em = Lim ==0;
g3 = imimposemin(g2, im|em);
g4=watershed(g3);
figure,imshow(g4);
g5 = I;
g5(g4==0) = 255;
figure, imshow(g5)
