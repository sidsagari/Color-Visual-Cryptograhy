clc;clear;close all;

% Load the image
originalImage = imread('green_filtered.png');

% Define the scaling factor to upscale the image
scalingFactor = 2; % You can adjust this value as needed

% Upscale the image
upscaledImage = imresize(originalImage, scalingFactor, 'bicubic'); % 'bicubic' interpolation is often used for upscaling

% Resize the image back to the original dimensions
restoredImage = imresize(upscaledImage, 1/scalingFactor, 'bicubic');

% Save the restored image if needed
imwrite(restoredImage, 'green_filtered_u.png');