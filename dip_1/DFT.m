%Jianeng Xu   2014.10.18
%����Ҷ�������任��ʵ�ּ������
X=imread('x.jpg');
X=rgb2gray(X);
X=imresize(X,[256,256]);
subplot(2,2,1);
imshow(X);
xlabel('��a��'); %ԭͼX
Y=fft2(X);
subplot(2,2,2);
imshow(Y);
xlabel('(b)');%FFTƵ��
Z=ifft2(Y);
subplot(2,2,3);
imshow(Z);
xlabel('(c)');%FFT���任
W=fftshift(Y);%ʵ�ֲ������
subplot(2,2,4);
imshow(log(abs(W)),[]);
xlabel('��d��');%FFTƵ����λ

