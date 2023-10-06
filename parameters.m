clear;close all;

% Read an RGB image
rgbImage1 = imread('flowers1000.png');
%rgbImage2 = imread('XORED.png');
%rgbImage2 = imread('FILTERED.png'); 
rgbImage2 = imread('ENHANCED.png'); 
% Convert to grayscale using the luminance formula (recommended)
originalImage = rgb2ycbcr(rgbImage1);
originalImage = originalImage(:,:,1);
distortedImage = rgb2ycbcr(rgbImage2);
distortedImage = distortedImage(:,:,1);

% Calculate MSE (Mean Squared Error)
mse = immse(originalImage, distortedImage);

% Calculate PSNR (Peak Signal-to-Noise Ratio)
psnr = psnr(distortedImage, originalImage);

% Calculate Maximum Difference (MD)
md = max(abs(double(originalImage(:)) - double(distortedImage(:))));

% Calculate NAE (Normalized Absolute Error)
nae = sqrt(mse) / md;

% Calculate SSIM (Structural Similarity Index)
ssimValue = ssim(distortedImage, originalImage);

% Display the results
fprintf('MSE: %.3f\n', mse);
fprintf('PSNR: %.3f dB\n', psnr);
fprintf('MD: %.3f\n', md);
fprintf('NAE: %.3f\n', nae);
fprintf('SSIM: %.3f\n', ssimValue);