clc;clear;close all;

Image = imread('Images/Lena256.png');
Output1 = imread('XORED.png');
Output2 = imread('FILTERED.png');

red1 = Image(:,:,1);
green1 = Image(:,:,2);
blue1 = Image(:,:,3);

red2 = Output1(:,:,1);
green2 = Output1(:,:,2);
blue2 = Output1(:,:,3);

red3 = Output2(:,:,1);
green3 = Output2(:,:,2);
blue3 = Output2(:,:,3);

red_hist1 = imhist(red1);
green_hist1 = imhist(green1);
blue_hist1 = imhist(blue1);

red_hist2 = imhist(red2);
green_hist2 = imhist(green2);
blue_hist2 = imhist(blue2);

red_hist3 = imhist(red3);
green_hist3 = imhist(green3);
blue_hist3 = imhist(blue3);

figure;
sgtitle('Comparison of Visual Cryptography');

subplot(2,3,1);
imshow(Image);title('Original Image');

subplot(2,3,2);
imshow(Output1);title('Decrypted Image (XORed)');

subplot(2,3,3);
imshow(Output2);title('Decrypted Image (Filtered)');


subplot(2,3,4);
bar(red_hist1, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist1, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist1, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;
title('Original Image Histogram');

subplot(2,3,5);
bar(red_hist2, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist2, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist2, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;
title('Decrypted Image (XORed) Histogram');

subplot(2,3,6);
bar(red_hist3, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist3, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist3, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;
title('Decrypted Image (Filtered) Histogram');



