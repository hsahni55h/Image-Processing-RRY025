clear all;

% Load the image:
pout = imread("pout.tif");
figure;
subplot(3, 2, 1);
imshow(pout, []);
title('Original Image');

% Inspect and save the histogram:
subplot(3, 2, 2);
imhist(pout);
hist_initial = imhist(pout);
title('Original Image Histogram');

% Make the cumulative function:
P_x = cumsum(hist_initial);
P_x = P_x / double(numel(pout)); % Now in units of probability
P_x = P_x .* 255.;               % Now in units of gray levels

graylevels = 0:1:255;

% Plot the cumulative distribution function (CDF):
subplot(3, 2, 3);
plot(graylevels, P_x);
title('CDF of Original Image');

% Apply the transfer function:
pout_equalized = P_x(pout + 1); % This is the important line!

% Display the equalized image:
subplot(3, 2, 4);
imshow(uint8(round(pout_equalized)), []);
title('Equalized Image');

% Check the histogram of the equalized image with 256 bins:
subplot(3, 2, 5);
imhist(uint8(round(pout_equalized)), 256);
title('Equalized Image Histogram (256 Bins)');

% Check the histogram of the equalized image with 28 bins:
subplot(3, 2, 6);
imhist(uint8(round(pout_equalized)), 28);
title('Equalized Image Histogram (28 Bins)');
