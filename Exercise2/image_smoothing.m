clear all;
clc;

% PARAMETERS
% Note-to-self: Signal in the image is about 0.9.
target = 3. / 0.2; % factor between the desired and current SNRs.
g_sigma = target;
filtersize = g_sigma * 3.0;

% Load the image
load("noisy.mat")

% Display the original image
figure;
imshow(noisy, []);
title('Original Image');

% Calculate and display the standard deviation of the original image
original_std = std2(noisy);
fprintf('Standard Deviation of Original Image: %.2f\n', original_std);

% Create a Gaussian filter
g = fspecial('gaussian', filtersize, g_sigma);
%h = fspecial('gaussian',hsize,sigma) 
%returns a rotationally symmetric Gaussian lowpass filter of size hsize with standard deviation sigma. 

% Apply the filter to the image
filtim = filter2(g, noisy);

% Display the filtered image
figure;
imshow(filtim, []);
title('Filtered Image');

% Calculate and display the standard deviation of the filtered image
filtered_std = std2(filtim);
fprintf('Standard Deviation of Filtered Image: %.2f\n', filtered_std);

% Set a region of the filtered image to zero
filtim(:, 210:211) = 0;

% Display the modified image
figure;
imshow(filtim, []);
title('Modified Image');

% Plot pixel values in a specific column
figure;
plot(filtim(:, 212));
title('Pixel Values in Column 212');
xlabel('Row');
ylabel('Pixel Value');
