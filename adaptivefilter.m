clc;clear;close all;

% Read the image using imread (example)
red = imread('XORred.png');
green = imread('XORgreen.png');
blue = imread('XORblue.png');

% Call the filterImage function
fred = filterImage(red);
fgreen = filterImage(green);
fblue = filterImage(blue);

% Combine the channels to create the RGB image
combined_rgb_image1 = cat(3, red, green, blue);
combined_rgb_image2 = cat(3, fred, fgreen, fblue);
imwrite(combined_rgb_image1, 'XORED.png');
imwrite(combined_rgb_image2, 'FILTERED.png');

function filteredImage = filterImage(inputImage)
    % Define the window size mxn
    M = 3;
    N = 3;

    % Convert the input image to double
    B = double(inputImage);
    
    sz = size(B, 1) * size(B, 2);

    % Pad the matrix with zeros on all sides
    C = padarray(B, [floor(M / 2), floor(N / 2)]);

    lvar = zeros([size(B, 1), size(B, 2)]);
    lmean = zeros([size(B, 1), size(B, 2)]);

    for i = 1:size(C, 1) - (M - 1)
        for j = 1:size(C, 2) - (N - 1)
            temp = C(i:i + (M - 1), j:j + (N - 1));
            tmp = temp(:);
            % Find the local mean and local variance for the local region
            lmean(i, j) = mean(tmp);
            lvar(i, j) = mean(tmp.^2) - mean(tmp).^2;
        end
    end

    % Noise variance and average of the local variance
    nvar = sum(lvar(:)) / sz;

    % If noise_variance > local_variance then local_variance = noise_variance
    lvar = max(lvar, nvar);

    % Final_Image = B - (noise variance / local variance) * (B - local_mean);
    NewImg = nvar ./ lvar;
    NewImg = NewImg .* (B - lmean);
    NewImg = B - NewImg;

    % Convert the image to uint8 format
    filteredImage = uint8(NewImg);
end