clc;clear all;close all;

img=imread('jet.bmp');
figure,imshow(uint8(abs(img)),[])
img=im2double(img);
lnimg=log(img+0.000001);
Fimg=fft2(lnimg);
P=fftshift(Fimg);%����Ҷ�任����Ƶ��ԭ���Ƶ�ͼ�����ģ�
[M,N]=size(P);%���ص�������������P��Ϊ�������������
figure,imshow(uint8(abs(P)),[])
figure,imhist(img)
x0=floor(M/2);
y0=floor(N/2);%��ʾ������M��Nÿ��Ԫ����2��������ȡ�� %̬ͬ�˲���������
D0=100;%��ֹƵ��
c=1.5;%��ϵ��
Hh=2;Hl=0.5;%Hh>1,Hl<1��HhΪ��Ƶ���棬HlΪ��Ƶ����
for u=1:M
    for v=1:N
        D(u,v)=sqrt((u-x0)^2+(v-y0)^2);%�㣨u,v����Ƶ��ƽ��ԭ��ľ���
        H(u,v)=(Hh-Hl)*(1-exp(-c*(D(u,v)^2/D0^2)))+Hl;%̬ͬ�˲�������
    end
end
hImg=Fimg.*H(u,v);%�˲���������
Q=fftshift(hImg);%����Ҷ��任
gImg=ifft2(hImg);%������Ҷ�任
Y=exp(gImg);
J=im2uint8(Y);%ת��ͼ�����Ϊ�޷���8λ������256���ĻҶ�ͼ��
figure,imshow(J) %̬ͬ�任���ͼ��
figure,imshow(uint8(abs(Q)),[]) %̬ͬ�任���Ƶ��ͼ
figure,imhist(J) %̬ͬ�任���ֱ��ͼ
