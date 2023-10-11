clear all;
clc;

% PARAMETERS
load('coke2.mat');

% Display the original coke image
figure;
imshow(coke, [], 'InitialMagnification', 'fit');
title('Original Coke Image');

% Create Sobel horizontal and vertical filters
sbh = [1 2 1; 0 0 0; -1 -2 -1];
sbv = [1 0 -1; 2 0 -2; 1 0 -1];

% Apply the Sobel filters to the coke image (edge detection)
% They are designed to highlight edges or areas of rapid intensity changes in an image.
cokeh = filter2(sbh, coke);
cokev = filter2(sbv, coke);

% Display the horizontal and vertical edge images
figure;
imshow(cokeh, [], 'InitialMagnification', 'fit');
title('Horizontal Edges');
figure;
imshow(cokev, [], 'InitialMagnification', 'fit');
title('Vertical Edges');

% Perform edge detection
cokea = abs(cokeh) + abs(cokev);

% Display the edge-detected image
figure;
imshow(cokea, [], 'InitialMagnification', 'fit');
title('Edge-Detected Image');

% Normalize the edge-detected image
coken = cokea ./ max(max(cokea));

% Display the normalized image and its histogram
figure;
imshow(uint8(coken * 255), []);
title('Normalized Edge-Detected Image');
figure;
imhist(uint8(coken * 255));
title('Histogram of Normalized Image');

% Create a binary mask using a threshold
mask = im2bw(coken, 80 / 255);
% The threshold value (80/255) can be adjusted to control the sensitivity of edge detection, 
% where higher values result in fewer detected edges, and lower values result in more detected edges.

% Display the binary mask
figure;
imshow(mask, [], 'InitialMagnification', 'fit');
title('Binary Mask');
