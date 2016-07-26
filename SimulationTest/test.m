function o = test(testMat, s);

testMat = double(testMat);
kernel = fspecial('gaussian', 40, 1.0);
blurMat = imfilter(testMat, kernel);

testMat = uint8(testMat);
blurMat = uint8(blurMat);

Y = imresize(blurMat,s, 'bicubic');
yGrad = gradient(double(Y));

%imagesc(yGrad);

[height width] = size(Y);
X = zeros(size(Y));

for i = floor(s):(height)
    for j = floor(s):(width)
        Xr = floor(i/s+0.5);
        Yr = floor(j/s+0.5);
        X(i,j) = testMat(Xr,Yr)+yGrad(i,j)*(Y(i,j)-blurMat(Xr,Yr));
    end
end
o = X; 


end
