clc;clear;close all;

image = imread('Images/glass100.png');
redComponent = image(:,:,1);
greenComponent = image(:,:,2);
blueComponent = image(:,:,3);

figure;
sgtitle('RGB Splitting');

subplot(2,3,2)
imshow(image);
title('Original');

subplot(2,3,4);
imshow(redComponent);
title('Red');

subplot(2,3,5);
imshow(greenComponent);
title('Green');

subplot(2,3,6);
imshow(blueComponent);
title('Blue');

imwrite(redComponent, 'red.png');
imwrite(greenComponent, 'green.png');
imwrite(blueComponent, 'blue.png');