clear all;
clc;

% PARAMETERS
flower = double(imread("flower.tif"));

% Display the original image
figure;
imshow(flower, [], 'InitialMagnification', 'fit');
title('Original Image');

% Create and display the smoothed image
filter = fspecial('average', 3);
flower_smooth = filter2(filter, flower);

figure;
imshow(flower_smooth, [], 'InitialMagnification', 'fit');
title('Smoothed Image');

% Create and display the high-pass image
flower_hp = flower - flower_smooth;

figure;
imshow(flower_hp, [], 'InitialMagnification', 'fit');
title('High-Pass Image');

% Create and display the high-boosted image
flower_boosted = flower + flower_hp * 2.0;

figure;
imshow(flower_boosted, [], 'InitialMagnification', 'fit');
title('High-Boosted Image');
