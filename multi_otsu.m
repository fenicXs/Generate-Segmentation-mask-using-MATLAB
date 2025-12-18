% Read image (grayscale)
I = imread('0.png');
if size(I, 3) == 3
    I = rgb2gray(I);
end

% Convert to double or single if needed
I2 = im2double(I);

% Choose number of thresholds (e.g. 2 thresholds => 3 classes)
numThresh = 2;
thresh = multithresh(I2, numThresh);  % returns a vector of thresholds

% Quantize / segment into discrete classes
% "labels" is an image where each pixel gets a class from 1 to numThresh+1
labels = imquantize(I2, thresh);

% Visualize
RGB = label2rgb(labels, 'jet', 'k');
imshowpair(I, RGB, 'montage');
title('Original (left) and Multi-Otsu segmentation (right)');