input = imread('C:\Users\NeilDG\Dropbox\THESIS RESULTS\DeblurTest\input.jpg');
input = rgb2gray(input);
figure; imshow(input); title('input');

PSF = fspecial('gaussian',7,10);
INITPSF = ones(size(PSF));

[output P] = deconvblind(input,INITPSF,50);

figure; imshow(output); title('deblur');