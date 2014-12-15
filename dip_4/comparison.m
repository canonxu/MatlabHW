%Time:2013.12.8
%Author:徐佳能 1140349174
%Discription： DIP Project4
clear all;
close all;
f=imread('hat.bmp');%原图
figure, imshow(f)
log_seg = edge(f,'log');%使用log算子进行边缘检测
figure, imshow(log_seg)
seedx=[63,150,80];%选取生长点,三个点
seedy=[50,76,90];
f=double(f);
markerim=f==f(seedy(1),seedy(1));
for i=2:length(seedx)
    markerim=markerim|(f==f(seedy(i),seedx(i)));
end
thresh=[12,6,12];
maskim=zeros(size(f));
for i=1:length(seedx)
    g=abs(f-f(seedy(i),seedx(i)))<=thresh(i);
    maskim=maskim|g
end
[g,nr]=bwlabel(imreconstruct(markerim,maskim),8);
figure,imshow(g);