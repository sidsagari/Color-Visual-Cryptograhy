clc;clear;close all;

input_image_path = input('Enter the path to the input binary image: ', 's');
n = input('Enter the number of shares to be generated: ');
generate_shares(input_image_path, n);


function generate_shares(input_image_path, n)
    % Load the input binary image
    input_image = imread(input_image_path);
    input_image = imbinarize(input_image);
    original_file_name = strsplit(input_image_path, '/');
    original_file_name = original_file_name{end}; 
    [~, original_file_name_noext, ~] = fileparts(original_file_name);

    % Initialize share arrays
    share_arrays = cell(1, n);

    % Generate shares
    for i = 1:size(input_image, 1)
        for j = 1:size(input_image, 2)
            original_pixel = input_image(i, j);

            % Generate random values for shares
            share_pixels = randi([0, 1], 1, n - 1);
            share_pixels = [share_pixels, bitxor(original_pixel, mod(sum(share_pixels), 2))];

            for k = 1:n
                share_arrays{k}(i, j) = share_pixels(k);
            end
        end
    end

    % Convert share arrays back to images and save them
    for k = 1:n
        share_image = uint8(share_arrays{k} * 255);
        imwrite(share_image, sprintf('%s_share%d.png',original_file_name_noext,k), 'png');
    end

    fprintf('Shares generated successfully.\n');
end
