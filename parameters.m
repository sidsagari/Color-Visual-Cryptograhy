clc; clear; close all;

% Load the images and perform necessary processing as before
rgbImage1 = imread('Images/Lena512.png');
rgbImage2 = imread('FILTERED.png'); 

originalImage = rgb2ycbcr(rgbImage1);
originalImage = originalImage(:,:,1);
distortedImage = rgb2ycbcr(rgbImage2);
distortedImage = distortedImage(:,:,1);

% Calculate the image quality metrics as before
squared_diff = (double(originalImage) - double(distortedImage)).^2;
mse = sum(squared_diff(:)) / (numel(double(originalImage)));
psnr = 10 * log10((255^2) / mse);
md = max(abs(double(originalImage(:)) - double(distortedImage(:))));
nae = sqrt(mse) / md;
ssimValue = ssim(distortedImage, originalImage);

% Create a new figure and display the results as text
figure;
sgtitle('Image Quality Metrics');
text(0.1, 0.9, sprintf('MSE: %.3f', mse),'FontSize',16);
text(0.1, 0.8, sprintf('PSNR: %.3f dB', psnr),'FontSize',16);
text(0.1, 0.7, sprintf('MD: %.3f', md),'FontSize',16);
text(0.1, 0.6, sprintf('NAE: %.3f', nae),'FontSize',16);
text(0.1, 0.5, sprintf('SSIM: %.3f', ssimValue),'FontSize',16);
axis off;


