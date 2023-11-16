close all;
clear all;
I=imread('barbaraLarge.bmp');
subplot(211);
imshow(I);
title('original');
noise=imnoise(I,'salt & pepper',0.04); %���뽷������
subplot(212);
imshow(noise); %%���뽷����������ʾͼ��
title('salt & pepper noise');
imwrite(noise,'barbara_noise.bmp');