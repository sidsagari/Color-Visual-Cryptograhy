clear;close all;

rgbImage1 = imread('Images/glass100.png');
%rgbImage2 = imread('XORED.png');
rgbImage2 = imread('FILTERED.png'); 

originalImage = rgb2ycbcr(rgbImage1);
originalImage = originalImage(:,:,1);
distortedImage = rgb2ycbcr(rgbImage2);
distortedImage = distortedImage(:,:,1);

squared_diff = (double(originalImage) - double(distortedImage)).^2;
mse = sum(squared_diff(:)) / (numel(double(originalImage)));
psnr = 10 * log10((255^2) / mse);
md = max(abs(double(originalImage(:)) - double(distortedImage(:))));
nae = sqrt(mse) / md;
ssimValue = ssim(distortedImage, originalImage);

% Display the results
fprintf('MSE: %.3f\n', mse);
fprintf('PSNR: %.3f dB\n', psnr);
fprintf('MD: %.3f\n', md);
fprintf('NAE: %.3f\n', nae);
fprintf('SSIM: %.3f\n', ssimValue);
