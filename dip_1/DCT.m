%Jianeng Xu   2014.10.18
%��ɢ���ң������任��ʵ�ּ������
X=imread('x.jpg');
X=rgb2gray(X); 
X=imresize(X,[256,256]);
subplot(1,3,1);
imshow(X);
xlabel('��a��'); %ԭͼX
Y=dct2(X);
subplot(1,3,2);
imshow(Y);
xlabel('(b)');%DCTƵ��
Z=idct2(Y);
subplot(1,3,3);
imshow(Z);
xlabel('(c)');%DCT���任
