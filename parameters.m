clear;close all;

rgbImage1 = imread('Images/flowers100.png');
%rgbImage2 = imread('XORED.png');
%rgbImage2 = imread('FILTERED.png'); 
%rgbImage2 = imread('ENHANCED.png');

originalImage = rgb2ycbcr(rgbImage1);
originalImage = originalImage(:,:,1);
distortedImage = rgb2ycbcr(rgbImage2);
distortedImage = distortedImage(:,:,1);


mse = immse(originalImage, distortedImage);
psnr = psnr(distortedImage, originalImage);
md = max(abs(double(originalImage(:)) - double(distortedImage(:))));
nae = sqrt(mse) / md;
ssimValue = ssim(distortedImage, originalImage);

% Display the results
fprintf('MSE: %.3f\n', mse);
fprintf('PSNR: %.3f dB\n', psnr);
fprintf('MD: %.3f\n', md);
fprintf('NAE: %.3f\n', nae);
fprintf('SSIM: %.3f\n', ssimValue);
