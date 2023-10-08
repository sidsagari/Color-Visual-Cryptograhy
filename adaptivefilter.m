clc;clear;close all;

red = imread('XORred.png');
green = imread('XORgreen.png');
blue = imread('XORblue.png');

fred = filterImage(red);
fgreen = filterImage(green);
fblue = filterImage(blue);

combined_rgb_image1 = cat(3, red, green, blue);
combined_rgb_image2 = cat(3, fred, fgreen, fblue);
imwrite(combined_rgb_image1, 'XORED.png');
imwrite(combined_rgb_image2, 'FILTERED.png');

figure;
sgtitle('Adaptive Local Noise Filtering');

subplot(1,2,1);
imshow(combined_rgb_image1);
title('Unfiltered Image');

subplot(1,2,2);
imshow(combined_rgb_image2);
title('Filtered Image')

function filteredImage = filterImage(inputImage)
    M = 3;
    N = 3;
    B = double(inputImage);
    sz = size(B, 1) * size(B, 2);
    C = padarray(B, [floor(M / 2), floor(N / 2)]);
    lvar = zeros([size(B, 1), size(B, 2)]);
    lmean = zeros([size(B, 1), size(B, 2)]);

    for i = 1:size(C, 1) - (M - 1)
        for j = 1:size(C, 2) - (N - 1)
            temp = C(i:i + (M - 1), j:j + (N - 1));
            tmp = temp(:);
            lmean(i, j) = mean(tmp);
            lvar(i, j) = mean(tmp.^2) - mean(tmp).^2;
        end
    end

    nvar = sum(lvar(:)) / sz;
    lvar = max(lvar, nvar);
    NewImg = nvar ./ lvar;
    NewImg = NewImg .* (B - lmean);
    NewImg = B - NewImg;
    filteredImage = uint8(NewImg);
    filteredImage = imgaussfilt(filteredImage, 0.85);
end