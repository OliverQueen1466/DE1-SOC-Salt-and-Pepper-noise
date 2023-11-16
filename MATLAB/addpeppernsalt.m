close all;
clear all;
I=imread('barbaraLarge.bmp');
subplot(211);
imshow(I);
title('original');
noise=imnoise(I,'salt & pepper',0.04); %加入椒盐躁声
subplot(212);
imshow(noise); %%加入椒盐躁声后显示图像
title('salt & pepper noise');
imwrite(noise,'barbara_noise.bmp');