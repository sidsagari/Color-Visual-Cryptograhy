clc;clear;close all;

Image = imread('Images/Lena512.png');
Output1 = imread('XORED.png');
Output2 = imread('FILTERED.png');
Output3 = imread('Share1.png');

red1 = Image(:,:,1);
green1 = Image(:,:,2);
blue1 = Image(:,:,3);

red2 = Output1(:,:,1);
green2 = Output1(:,:,2);
blue2 = Output1(:,:,3);

red3 = Output2(:,:,1);
green3 = Output2(:,:,2);
blue3 = Output2(:,:,3);

red4 = Output3(:,:,1);
green4 = Output3(:,:,2);
blue4 = Output3(:,:,3);

red_hist1 = imhist(red1);
green_hist1 = imhist(green1);
blue_hist1 = imhist(blue1);

red_hist2 = imhist(red2);
green_hist2 = imhist(green2);
blue_hist2 = imhist(blue2);

red_hist3 = imhist(red3);
green_hist3 = imhist(green3);
blue_hist3 = imhist(blue3);

red_hist4 = imhist(red4);
green_hist4 = imhist(green4);
blue_hist4 = imhist(blue4);


figure;
sgtitle('Comparison of Visual Cryptography Images ( with Color Distribution )');

subplot(2,4,1);
imshow(Image);title('Original Secret Image');

subplot(2,4,2);
imshow(Output3);title('Share Image');

subplot(2,4,3);
imshow(Output1);title('Recovered Secret Image ( Unfiltered )');

subplot(2,4,4);
imshow(Output2);title('Recovered Secret Image ( Filtered )');


subplot(2,4,5);
bar(red_hist1, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist1, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist1, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;

subplot(2,4,6);
bar(red_hist4, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist4, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist4, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;

subplot(2,4,7);
bar(red_hist2, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist2, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist2, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;

subplot(2,4,8);
bar(red_hist3, 'r', 'EdgeColor', 'r', 'FaceColor', 'r');
hold on;
bar(green_hist3, 'g', 'EdgeColor', 'g', 'FaceColor', 'g');
bar(blue_hist3, 'b', 'EdgeColor', 'b', 'FaceColor', 'b');
hold off;



