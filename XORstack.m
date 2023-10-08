clc;clear;close all;

m = input('Enter the number of shares to XOR: ');
if m==1
    fprintf('ERROR , number of shares should be more than 1 ');
    return;
end

xorSharesForColorChannel('red', m, 'XORred.png');
xorSharesForColorChannel('green', m, 'XORgreen.png');
xorSharesForColorChannel('blue', m, 'XORblue.png');

function xorSharesForColorChannel(color, n, outputFilename)
    first_share_file = ['floyd_' color '_share1.png'];
    input_image = imread(first_share_file);
    result = imread(first_share_file);

    for i = 2:n
        share_file = ['floyd_' color '_share' num2str(i) '.png'];
        share_img = imread(share_file);
        result = bitxor(result, share_img);
    end

    imwrite(result, outputFilename, 'png');

    figure;
    sgtitle(['XORing of ' color ' Shares']);

    subplot(1, 2, 1);
    imshow(input_image);
    title(['First ' color ' Share']);

    subplot(1, 2, 2);
    imshow(result);
    title(['XORed ' color ' Output']);
end
