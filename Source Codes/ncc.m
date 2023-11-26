clc;clear;close all;

[filename, filepath] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'; '*.*', 'All Files (*.*)'}, 'Select an image');
if isequal(filename, 0)
    fprintf('User canceled the file selection. Exiting.\n');
    return;
end

image1 = imread(fullfile(filepath, filename));
image2 = imread('RECOVERED.png');

% Convert to double for processing
image1 = im2double(image1);
image2 = im2double(image2);

% Define the image dimensions
M = size(image1, 1);
N = size(image1, 2);

% Calculate the mean of each image
mean_image1 = mean2(image1);
mean_image2 = mean2(image2);

% Pad the images with zeros to avoid boundary effects
padded_image1 = padarray(image1, [M N], 'symmetric');
padded_image2 = padarray(image2, [M N], 'symmetric');

% Initialize the NCC matrix
NCC = zeros(2*M - 1, 2*N - 1);

% Compute NCC for all possible offsets
for x = -M+1:M-1
    for y = -N+1:N-1
        shifted_image2 = circshift(padded_image2, [x y]);

        numerator = sum(sum((padded_image1 - mean_image1) .* (shifted_image2 - mean_image2)));
        denominator = sqrt(sum(sum((padded_image1 - mean_image1).^2)) .* sum(sum((shifted_image2 - mean_image2).^2)));
        NCC(x + M - 1, y + N - 1) = numerator ./ denominator;
    end
end

% Find the peak NCC value and its corresponding offset
[max_NCC, ~] = max(NCC(:));
[y_offset, x_offset] = ind2sub(size(NCC), find(NCC == max_NCC));

% Adjust offsets due to padding
y_offset = y_offset - M;
x_offset = x_offset - N;