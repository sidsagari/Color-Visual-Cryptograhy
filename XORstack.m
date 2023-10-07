clc;clear;close all;

n = input('Enter the number of shares to XOR: ');
first_share_file = input('Select the first share from folder: ', 's');
input_image = imread(first_share_file);
result = imread(first_share_file);

for i = 2:n
    share_file = input(['Select share ' num2str(i) ' from folder: '], 's');
    share_img = imread(share_file);
    result = bitxor(result, share_img);
end

prompt = sprintf('Enter the output file name (with extension): ');
output_file_name = input(prompt, 's');
imwrite(result,output_file_name ,'png');

figure;
sgtitle('XORing of Shares');

subplot(1,2,1);
imshow(input_image);title('First Share')

subplot(1,2,2);
imshow(result);title('XORed Output')
