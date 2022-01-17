I = imread('E:\4.2\Image Processing - Lab\Lab 02 Assignment\lena.jpg');
[row,col] = size(I);

for i = 1:2*row
    for j = 1: 2*col
        p = i - floor(i/2);
        q = j - floor(j/2);
        ZI(i,j) = I(p,q);
    end
end

figure;imshow(a)
title('Original Image');
figure;imshow(ZI)
title('Zoomed in Image');

%X = imread('E:\4.2\Image Processing - Lab\Lab 02 Assignment\lena.jpg');
%X = uint8(X);
%[row,col] = size(a);
%K = uint8(zeros(row,col));

for i = 1:row/2
    for j = 1:col/2
        p = i*2;
        q = j*2;
        ZO(i,j) = I(p,q);
    end
end

figure;imshow(ZO);
title('Zoomed out Image');
