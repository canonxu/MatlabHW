%Time:2013.12.8
%Author:����� 1140349174
%Discription�� DIP Project4
close all;
clear all;
f=imread('boat.bmp');
figure,imshow(f)
seedx=[63,150,80];%ѡȡ������,������
seedy=[50,76,90];
plot(seedx,seedy,'gs','linewidth',1);%ԭʼͼ�����ӵ�λ��
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
