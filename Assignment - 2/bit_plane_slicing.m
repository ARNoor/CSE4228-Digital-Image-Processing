% task-a
I = imread('E:\4.2\Image Processing - Lab\Lab 03 Assignment\fa_da.jpg');
R = rgb2gray(I);

% task-b
[row, col] = size(R);

X = zeros(1,8);

% task-c and d
for k=0:7
    X(k+1) = 2^k;   
end

% task-e
I0 = zeros(row, col);

for i=1:row
    for j=1:col
        I0(i,j) = bitand(R(i,j),X(1));      %00000001
    end
end


I1 = zeros(row, col);
for i=1:row
    for j=1:col
        I1(i,j) = bitand(R(i,j),X(2));      %00000010
    end
end

I2 = zeros(row, col);
for i=1:row
    for j=1:col
        I2(i,j) = bitand(R(i,j),X(3));      %00000100
    end
end

I3 = zeros(row, col);
for i=1:row
    for j=1:col
        I3(i,j) = bitand(R(i,j),X(4));      %00001000
    end
end

I4 = zeros(row, col);
for i=1:row
    for j=1:col
        I4(i,j) = bitand(R(i,j),X(5));      %00010000
    end
end

I5 = zeros(row, col);
for i=1:row
    for j=1:col
        I5(i,j) = bitand(R(i,j),X(6));      %00100000
    end
end

I6 = zeros(row, col);
for i=1:row
    for j=1:col
        I6(i,j) = bitand(R(i,j),X(7));      %01000000
    end
end

I7 = zeros(row, col);
for i=1:row
    for j=1:col
        I7(i,j) = bitand(R(i,j),X(8));      %10000000
    end
end

% task-f
figure;
subplot(3,3,1); imshow(R); title('Original');
subplot(3,3,2); imshow(I0); title('bit 0');
subplot(3,3,3); imshow(I1); title('bit 1');
subplot(3,3,4); imshow(I2); title('bit 2');
subplot(3,3,5); imshow(I3); title('bit 3');
subplot(3,3,6); imshow(I4); title('bit 4');
subplot(3,3,7); imshow(I5); title('bit 5');
subplot(3,3,8); imshow(I6); title('bit 6');
subplot(3,3,9); imshow(I7); title('bit 7');


