I = imread('E:\4.2\Image Processing - Lab\Lab 02 Assignment\lena.jpg');
figure; 
imshow(I);
title('Original Image');

%need to convert it to double
r = uint8(I);
[row,col] = size(r);

%t = input('Threshold: ');
t = 256/2;

%applying threshold
X1 = zeros(row, col);
for i=1:row
    for j=1:col
        if r(i,j)>t
            X1(i,j) = 255;
        else
            X1(i,j) = 0;
        end    
    end
end
figure; 
imshow(X1);
title('Applying Threshold');