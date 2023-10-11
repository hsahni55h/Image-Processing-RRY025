clear all;
clc;

% PARAMETERS
flower = double(imread("flower.tif"));

% Display the original flower image
figure;
imshow(flower, [], "InitialMagnification", 'fit');
title('Original Flower Image');

% Create the Laplacian filter (edge detection and enhancing fine details in an image)
hp = (1/9) .* [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Convolve the filter with the flower image
flower_convolved = filter2(hp, flower);

% Display the convolved flower image
figure;
imshow(flower_convolved, [], "InitialMagnification", 'fit');
title('Convolved Flower Image');

% Load and display the spine image
load('spine4.mat');
figure;
imshow(spine4, [], "InitialMagnification", 'fit');
title('Spine Image');

% Create the Laplacian filter for the spine image
hp = (1/9) .* [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Convolve the filter with the spine image
hpspine = filter2(hp, spine4);

% Display the convolved spine image
figure;
imshow(hpspine, [0 3], "InitialMagnification", 'fit');
title('Convolved Spine Image');
