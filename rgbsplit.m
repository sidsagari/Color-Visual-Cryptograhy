clc;clear;close all;

image = imread('Images/Stage1000.png');

figure;
sgtitle('RGB Splitting');

if size(image, 3) == 1
    redComponent = image;
    
    subplot(1,1,1);
    imshow(redComponent);

    imwrite(redComponent, 'red.png');
    imwrite(redComponent, 'green.png'); 
    imwrite(redComponent, 'blue.png'); 
else
    redComponent = image(:,:,1);
    greenComponent = image(:,:,2);
    blueComponent = image(:,:,3);

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
end
