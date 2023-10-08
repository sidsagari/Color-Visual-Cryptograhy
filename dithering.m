clc;clear;close all;

inputImagePaths = {'red.png', 'green.png', 'blue.png'};
figure;sgtitle('Floyd Steinberg Dithering');

for i = 1:length(inputImagePaths)
    inputPath = inputImagePaths{i};
    outputPath = ['floyd_', inputPath];
    applyFloydSteinbergDithering(inputPath, outputPath);
    
    inputImage = imread(inputPath);
    outputImage = imread(outputPath);
    
    subplot(2, 3, i);
    imshow(inputImage);
    title(inputPath, 'Interpreter', 'none');

    subplot(2, 3, 3 + i);
    imshow(outputImage);
    title(outputPath, 'Interpreter', 'none');
end


function applyFloydSteinbergDithering(inputImagePath, outputImagePath)

    inputImage = imread(inputImagePath);
    inputImage = double(inputImage);
    [height, width] = size(inputImage);
    outputImage = zeros(height, width);

    for y = 1:height
        for x = 1:width
            oldPixel = inputImage(y, x);
            newPixel = 255 * (oldPixel > 127);
            error = oldPixel - newPixel;

            outputImage(y, x) = newPixel;

            if x < width
                inputImage(y, x + 1) = inputImage(y, x + 1) + error * 7 / 16;
            end
            if x > 1 && y < height
                inputImage(y + 1, x - 1) = inputImage(y + 1, x - 1) + error * 3 / 16;
            end
            if y < height
                inputImage(y + 1, x) = inputImage(y + 1, x) + error * 5 / 16;
            end
            if x < width && y < height
                inputImage(y + 1, x + 1) = inputImage(y + 1, x + 1) + error * 1 / 16;
            end
        end
    end

    outputImage = uint8(outputImage);
    imwrite(outputImage, outputImagePath);
end