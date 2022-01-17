%Reading the image
I1 = imread('E:\4.2\Image Processing - Lab\Lab 03 Assignment\hime_11.jpg');
I2 = imread('E:\4.2\Image Processing - Lab\Lab 03 Assignment\hime_22.jpg');

I1 = rgb2gray(I1);
I2 = rgb2gray(I2);

figure;
thr = 200;
for i = 1:row
    for j = 1:col
        if (I1(i,j) > thr)
            I1(i,j) = thr;
        end   
    end
end


subplot(2,3,1); imshow(I1); title('Hime');
subplot(2,3,2); imshow(I2); title('Hime req');

total_pix = 0;
hist1 = zeros(1, 256);
[row, col] = size(I1);

% Computing number of pixels for each gray level
for i = 1:row
    for j = 1:col
        for k = 0:255
            if (I1(i,j) == k)
                hist1(k+1) = hist1(k+1)+1;
                total_pix = total_pix+1;
            end
        end
    end
end

% Computing PDF (Probability Distribution Function)
pdf = hist1/total_pix;

% Computing CDF (Cumulative Distribution Function)
cdf = zeros(1, 256);
for k = 1:256
    if k == 1
        cdf(k) = pdf(k);
    else
        cdf(k) = pdf(k) + cdf(k-1);
    end
end

% Multiplying each CDF with L-1
cdf_multiplied_1 = cdf*255;

% Rounding the obtained value
cdf_multiplied_1 = round(cdf_multiplied_1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

total_pix = 0;
hist2 = zeros(1, 256);
[row, col] = size(I2);

% Computing number of pixels for each gray level
for i = 1:row
    for j = 1:col
        for k = 0:255
            if (I2(i,j) == k)
                hist2(k+1) = hist2(k+1)+1;
                total_pix = total_pix+1;
            end
        end
    end
end

% Computing PDF (Probability Distribution Function)
pdf = hist2/total_pix;

% Computing CDF (Cumulative Distribution Function)
cdf = zeros(1, 256);
for k = 1:256
    if k == 1
        cdf(k) = pdf(k);
    else
        cdf(k) = pdf(k) + cdf(k-1);
    end
end

% Multiplying each CDF with L-1
cdf_multiplied_2 = cdf*255;

% Rounding the obtained value
cdf_multiplied_2 = round(cdf_multiplied_2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Comparing the CDFs of the given and the required images
d = 255*ones(1,256);
for k1 = 1:256
    for k2 = 1:256
        if cdf_multiplied_1(k1) < cdf_multiplied_2(k2)
            d(k1) = k2;                                  
            break
        end
    end
end

%Generating the final output of the given image
s = zeros(size(I1));
for i = 1:row
    for j = 1:col
        t = (I1(i,j)+1);
        s(i,j) = d(t);
    end
end
I3 = uint8(s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Comparing the CDFs of the given and the required images

subplot(2, 3, 3); imshow(I3); title('Hime specified');

%generating Histogram of the output images

subplot(2, 3, 4); imhist(I1); title('Original histogram ');
subplot(2, 3, 5); imhist(I2); title('Required histogram');
subplot(2, 3, 6); imhist(I3); title('Specified histogram');
