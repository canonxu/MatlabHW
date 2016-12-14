clc;clear all;close all;

img=imread('jet.bmp');
figure,imshow(uint8(abs(img)),[])
img=im2double(img);
lnimg=log(img+0.000001);
Fimg=fft2(lnimg);
P=fftshift(Fimg);%福利叶变换并将频域原点移到图像中心；
[M,N]=size(P);%返回的行数和列数在P作为单独的输出变量
figure,imshow(uint8(abs(P)),[])
figure,imhist(img)
x0=floor(M/2);
y0=floor(N/2);%表示将向量M和N每个元素与2作除法后取整 %同态滤波参数设置
D0=100;%截止频率
c=1.5;%锐化系数
Hh=2;Hl=0.5;%Hh>1,Hl<1，Hh为高频增益，Hl为低频增益
for u=1:M
    for v=1:N
        D(u,v)=sqrt((u-x0)^2+(v-y0)^2);%点（u,v）到频率平面原点的距离
        H(u,v)=(Hh-Hl)*(1-exp(-c*(D(u,v)^2/D0^2)))+Hl;%同态滤波器函数
    end
end
hImg=Fimg.*H(u,v);%滤波，矩阵点乘
Q=fftshift(hImg);%傅里叶逆变换
gImg=ifft2(hImg);%反傅立叶变换
Y=exp(gImg);
J=im2uint8(Y);%转换图像矩阵为无符号8位数，即256级的灰度图像
figure,imshow(J) %同态变换后的图像
figure,imshow(uint8(abs(Q)),[]) %同态变换后的频谱图
figure,imhist(J) %同态变换后的直方图
