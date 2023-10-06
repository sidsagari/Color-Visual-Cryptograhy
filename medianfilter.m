clc;clear;close all;
% Read your color image (replace 'noisy_color_image.png' with your image file)
colorImage = imread('UNFILTERED.png');

% Define the size of the median filter kernel (e.g., 3x3, adjust as needed)
kernelSize = 3;

% Separate the color channels
redChannel = colorImage(:, :, 1);
greenChannel = colorImage(:, :, 2);
blueChannel = colorImage(:, :, 3);

% Apply the median filter to each channel individually
smoothedRedChannel = medfilt2(redChannel, [kernelSize, kernelSize]);
smoothedGreenChannel = medfilt2(greenChannel, [kernelSize, kernelSize]);
smoothedBlueChannel = medfilt2(blueChannel, [kernelSize, kernelSize]);

% Combine the smoothed channels to form the smoothed color image
smoothedColorImage = cat(3, uint8(smoothedRedChannel), uint8(smoothedGreenChannel), uint8(smoothedBlueChannel));

% Display the original and smoothed color images
imwrite(smoothedColorImage,'FILTERED_M.png');
