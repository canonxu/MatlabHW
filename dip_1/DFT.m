%Jianeng Xu   2014.10.18
%傅里叶（反）变换的实现及其分析
X=imread('x.jpg');
X=rgb2gray(X);
X=imresize(X,[256,256]);
subplot(2,2,1);
imshow(X);
xlabel('（a）'); %原图X
Y=fft2(X);
subplot(2,2,2);
imshow(Y);
xlabel('(b)');%FFT频谱
Z=ifft2(Y);
subplot(2,2,3);
imshow(Z);
xlabel('(c)');%FFT反变换
W=fftshift(Y);%实现补零操作
subplot(2,2,4);
imshow(log(abs(W)),[]);
xlabel('（d）');%FFT频谱移位

