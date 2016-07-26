input = double(imread('C:\Users\NeilDG\Dropbox\THESIS RESULTS\YangFilterTest\input.jpg')) / 255;
% input = rgb2ycbcr(input);
% Y = input(:,:,1);
% Cb = input(:,:,2);
% Cr = input(:,:,3);
Y = input;

% figure; imshow(Y); title('Y channel');
% figure; imshow(Cb); title('Cb channel');
% figure; imshow(Cr); title('Cr channel');

%Obtain features according to Yang's feature extraction filters
% F1 = imfilter(Y, [-1 0 1], 'same', 'symmetric');
% F2 = imfilter(Y, [-1 0 1]', 'same', 'symmetric');
% F3 = imfilter(Y, [-1 0 2 0 -1], 'same' , 'symmetric');
% F4 = imfilter(Y, [-1 0 2 0 -1]', 'same' , 'symmetric');

figure; imshow(F1); title('F1');
figure; imshow(F2); title('F2');
figure; imshow(F3); title('F3');
figure; imshow(F4); title('F4');

ref_image = double(imread('C:\Users\NeilDG\Dropbox\THESIS RESULTS\YangFilterTest\image_f1_0.jpg')) / 255;
[ssimval, ssimmap] = ssim(ref_image,F1);
figure; imshow(ssimmap); title('Similarity Map F1');
fprintf('ssim Index Map - Mean ssim Value is %0.4f\n',ssimval);

[ssimval, ssimmap] = ssim(ref_image,F2);
figure; imshow(ssimmap); title('Similarity Map F2');
fprintf('ssim Index Map - Mean ssim Value is %0.4f\n',ssimval);

[ssimval, ssimmap] = ssim(ref_image,F3);
figure; imshow(ssimmap); title('Similarity Map F3');
fprintf('ssim Index Map - Mean ssim Value is %0.4f\n',ssimval);

[ssimval, ssimmap] = ssim(ref_image,F4);
figure; imshow(ssimmap); title('Similarity Map F4');
fprintf('ssim Index Map - Mean ssim Value is %0.4f\n',ssimval);
