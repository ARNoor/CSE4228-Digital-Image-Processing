I = imread('E:\4.2\Image Processing - Lab\Lab 02 Assignment\lena.jpg');
figure; 
imshow(I);
title('Original Image');

%need to convert it to double
r = im2double(I);
c = 2;
[row,col] = size(r);

%applying log
X1 = zeros(row, col);
for i=1:row
    for j=1:col
        X1(i,j) = c*log(1+r(i,j));
    end
end
figure; 
imshow(X1);
title('Applying Log');

%applying inverse log
X2 = zeros(row, col);
for i=1:row
    for j=1:col
        X2(i,j) = (exp(r(i,j))^(1/c))-1;
    end
end
figure; 
imshow(X2);
title('Applying Inverse Log');

figure;
plot(X1, X2, '.r');
