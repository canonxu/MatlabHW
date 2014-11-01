%Jianeng Xu   2014.10.18
%离散余弦（反）变换的实现及其分析
X=imread('x.jpg');
X=rgb2gray(X); 
X=imresize(X,[256,256]);
subplot(1,3,1);
imshow(X);
xlabel('（a）'); %原图X
Y=dct2(X);
subplot(1,3,2);
imshow(Y);
xlabel('(b)');%DCT频谱
Z=idct2(Y);
subplot(1,3,3);
imshow(Z);
xlabel('(c)');%DCT反变换
