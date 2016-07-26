input = imread('C:\Users\NeilDG\Dropbox\THESIS RESULTS\SimulationTest\input.jpg');
groundtruth = imread('C:\Users\NeilDG\Dropbox\THESIS RESULTS\SimulationTest\groundtruth.jpg');
bicubic = imresize(input, 4, 'bicubic');

X = test(input,2);
X = test(X,2);
X = uint8(X);

figure; imshow(X); title('SR');
figure; imshow(uint8(bicubic)); title('bicubic interpolation');

psnr_value = psnr(groundtruth, bicubic);
fprintf('BICUBIC == PSNR : %0.4f.',psnr_value);

psnr_value = psnr(groundtruth, X);
fprintf('SR == PSNR : %0.4f.',psnr_value);