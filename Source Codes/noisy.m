clc;clear;close all;

tic

[filename, filepath] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'; '*.*', 'All Files (*.*)'}, 'Select an image');
if isequal(filename, 0)
    fprintf('User canceled the file selection. Exiting.\n');
    return;
end

image = imread(fullfile(filepath, filename));

Gnoise = imnoise(image,'gaussian');
SPnoise = imnoise(image,'salt & pepper');
Snoise = imnoise(image,'speckle');
Pnoise = imnoise(image,'poisson');

figure;
sgtitle('Various Noisy Images');

subplot(2,3,1)
imshow(image);
title('Original');

subplot(2,3,2);
imshow(Gnoise);
title('Gaussian Noise'); 

subplot(2,3,3);
imshow(SPnoise);
title('Salt & Pepper Noise');

subplot(2,3,4);
imshow(Snoise);
title('Speckle Noise');

subplot(2,3,5);
imshow(Pnoise);
title('Poisson Noise');

imwrite(Gnoise, 'GAUSSIAN.png');
imwrite(SPnoise, 'SALT N PEPPER.png');
imwrite(Snoise,'SPECKLE.png');
imwrite(Pnoise,'POISSON.png');

timeElapsed = toc