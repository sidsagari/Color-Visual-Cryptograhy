clc;clear;close all;

% Read your image (replace 'noisy_image.png' with your image file)
noisyImage = imread('floyd_red_filtered.png');

% Define a small kernel size (e.g., 3x3 or 5x5, adjust as needed)
kernelSize = 1;

% Apply the average filter
smoothedImage = imfilter(noisyImage, fspecial('average', kernelSize));

% Display the original and smoothed images
imwrite(smoothedImage,'floyd_red_filtered.png')