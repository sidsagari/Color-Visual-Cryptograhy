clc;clear;close all;

image = imread('qr.png'); 

redComponent = image(:,:,1);
greenComponent = image(:,:,2);
blueComponent = image(:,:,3);

% Optional: Save the individual components as separate images
imwrite(redComponent, 'red.png');
imwrite(greenComponent, 'green.png');
imwrite(blueComponent, 'blue.png');