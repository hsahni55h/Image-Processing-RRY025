clear all;
clc;

% Exercise III (histogram specification)

% PARAMETERS

load('quarter.mat');
quarter = double(quarter);

% Display the original image
figure;
subplot(3, 2, 1);
imshow(quarter, [], 'InitialMagnification', 'fit');
title('Original Image');

upperlimit_in = 160;
upperlimit_out = 180;

% Compute the original image PDF and CDF

% PDF:
[pdf_orig, bin_orig] = imhist(uint8(quarter), 256);
subplot(3, 2, 2);
imhist(uint8(quarter), 256);
title("Original Histogram");

% Plot the original histogram as a scatter plot (optional)
pdf_orig = double(pdf_orig);
plot(bin_orig, pdf_orig, 'o');
ylim([0 250]);
xlim([0 255]);
title("Histogram as a Scatter Plot (Checking Only)");

% CDF:
cdf = cumsum(pdf_orig);
cdf = cdf / max(cdf);

subplot(3, 2, 3);
plot(bin_orig, cdf);
title("Original CDF");
xlim([0 255]);

% Prepare the target PDF and CDF:

% Calculate the fraction of pixels below upperlimit_in
N_below = sum(quarter <= upperlimit_in, 'all');
N_above = sum(quarter > upperlimit_in, 'all');
disp('Fraction of pixels below upperlimit_in:')
fraction_below = N_below / (N_above + N_below);

pdf_new = pdf_orig;
pdf_new(1:upperlimit_out) = fraction_below / upperlimit_out;
pdf_new(upperlimit_out+1:end) = (1 - fraction_below) / (256 - upperlimit_out);

% Normalize the target PDF
pdf_new = pdf_new / sum(pdf_new, 'all');

% Plot the target PDF
subplot(3, 2, 4);
plot(pdf_new);
title("Target PDF");
xlim([0, 255]);
hold on;

% Create and plot the target CDF:
cdf_new = cumsum(pdf_new);
cdf_new = cdf_new / max(cdf_new);

subplot(3, 2, 5);
plot(bin_orig, cdf_new);
title("Target CDF");
xlim([0, 255]);

% Calculate the mapping between old and new grayscale values
gray_orig = 0:1:255;
gray_new = zeros(size(gray_orig)); % Initialize gray_new

for i = 1:256
    p_old = cdf(i);
    dists = abs(cdf_new - p_old);
    [~, ind_new] = min(dists);
    
    % Ensure ind_new does not exceed the valid range
    ind_new = min(max(ind_new, 1), 256);
    
    gray_new(i) = bin_orig(ind_new);
end

% Plot the transfer function
subplot(3, 2, 6);
plot(gray_orig, gray_new);
title("The Transfer Function");
xlim([0 255]);
ylim([0 255]);
xlabel("OLD");
ylabel("NEW");

% Prepare the final image using the transfer function
quarter_specified = gray_new(quarter+1);

% Display the final image
figure;
subplot(1, 2, 1);
imshow(quarter_specified, [1 256], 'InitialMagnification', 'fit');
title("Final Image");

% Display the histogram of the final image
subplot(1, 2, 2);
imhist(uint8(quarter_specified), 28);
title("Histogram of the Final Image");

% Check the relation between the original and specified images
figure;
scatter(quarter, quarter_specified);
title('Check: The Relation Between Before and After');
xlim([0 255]);
ylim([0 255]);
