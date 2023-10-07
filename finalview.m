clc;clear;close all;

Image = imread('Images/flowers100.png');
Output = imread('ENHANCED.png');

figure;
sgtitle('Comparison of Visual Cryptography');

subplot(1,2,1);
imshow(Image);title('Original Image');

subplot(1,2,2);
imshow(Output);title('Decrypted Image');