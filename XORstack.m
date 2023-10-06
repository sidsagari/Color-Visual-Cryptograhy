clc;clear;close all;

% Get the number of shares from the user
n = input('Enter the number of shares to XOR: ');

% Initialize the result with the first selected share
first_share_file = input('Select the first share from folder: ', 's');
result = imread(first_share_file);

% Perform XOR for the remaining shares
for i = 2:n
    % Ask the user to select the next share from a folder
    share_file = input(['Select share ' num2str(i) ' from folder: '], 's');
    share_img = imread(share_file);
    
    % Perform XOR operation with the selected share
    result = bitxor(result, share_img);
end

prompt = sprintf('Enter the output file name (with extension): ');
output_file_name = input(prompt, 's');
imwrite(result,output_file_name ,'png');