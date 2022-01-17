I = imread('cameraman.tif');

total_pix = 0;
hist1 = zeros(1, 256);
[row, col] = size(I);

% Computing number of pixels for each gray level
for i = 1:row
    for j = 1:col
        for k = 0:255
            if (I(i,j) == k)
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
cdf_multiplied = cdf*255;

% Rounding the obtained value
cdf_multiplied = round(cdf_multiplied);

% Original vs Equalized Histogram
figure;
subplot(2, 2, 3); bar(k, hist1); title('Original Histogram');
subplot(2, 2, 4); bar(k, cdf_multiplied); title('Equalized Histogram');

I2 = zeros(size(I));
for i = 1:row                                     
    for j = 1:col                                   
        idx = (I(i,j)+1);                              
        I2(i,j) = cdf_multiplied(idx);                            
    end                                             
end

% Original vs Equalized Image
subplot(2, 2, 1); imshow(I); title('Original Image');
subplot(2, 2, 2); imshow(uint8(I2)); title('Equalized Image');


