clc;clear;close all;

input_image_paths = {'floyd_red.png', 'floyd_green.png', 'floyd_blue.png'};

n = input('Enter the number of shares to be generated: ');
if n==1
    fprintf('ERROR , number of shares should be more than 1 ');
    return;
end

for i = 1:numel(input_image_paths)
    generate_shares(input_image_paths{i}, n);
end


function generate_shares(input_image_path, n)

    input_image = imread(input_image_path);
    input_image = imbinarize(input_image);
    original_file_name = strsplit(input_image_path, '/');
    original_file_name = original_file_name{end}; 
    [~, original_file_name_noext, ~] = fileparts(original_file_name);

    share_arrays = cell(1, n);

    for i = 1:size(input_image, 1)
        for j = 1:size(input_image, 2)
            original_pixel = input_image(i, j);
            share_pixels = randi([0, 1], 1, n - 1);
            share_pixels = [share_pixels, bitxor(original_pixel, mod(sum(share_pixels), 2))];

            for k = 1:n
                share_arrays{k}(i, j) = share_pixels(k);
            end
        end
    end

    for k = 1:n
        share_image = uint8(share_arrays{k} * 255);
        imwrite(share_image, sprintf('%s_share%d.png',original_file_name_noext,k), 'png');
    end
    
    fprintf('Shares generated successfully.\n');
    first_share = uint8(share_arrays{1} * 255);

    figure;
    sgtitle('Share Generation');

    subplot(1, 2, 1);
    imshow(input_image);
    title('Input Image');

    subplot(1, 2, 2);
    imshow(first_share);
    title('First Share');
end
