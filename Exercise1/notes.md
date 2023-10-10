# MATLAB `histeq` Function

The `histeq` function in MATLAB is utilized for histogram equalization of grayscale images. Histogram equalization is a technique that enhances the contrast of an image by redistributing the intensities of the pixels to make the resulting image's histogram as uniform as possible.

## Syntax

outputImage = histeq(inputImage); ( this is for matlab)

- `inputImage`: Grayscale image to enhance the contrast of.

- `outputImage`: Resulting image after histogram equalization.

## How `histeq` Works

- Compute the histogram of the input image, which is a plot of the frequency of occurrence of each pixel intensity level.

- Normalize the histogram to obtain a probability density function (PDF).

- Calculate the cumulative distribution function (CDF) from the PDF.

- Map the pixel values in the input image to new values using the CDF. This mapping stretches the intensity values, emphasizing the differences between them.

- Create the output image using the mapped pixel values.

## Considerations

- Histogram equalization can improve contrast but may also amplify noise and artifacts.

- Results may vary depending on the specific image and application.

# Histogram Specification

Histogram specification, also known as histogram matching or histogram equalization with a specified target histogram, is a technique in image processing used to adjust the contrast and brightness of an image to match a desired or reference histogram. Unlike traditional histogram equalization, where the goal is to achieve a uniform histogram, in histogram specification, you aim to make an image's histogram resemble a target or reference histogram. This can be useful in various applications, such as adjusting an image to match a predefined color profile or enhancing specific features.

## Step-by-Step Explanation of Histogram Specification

### 1. Compute the Histogram of the Input Image

Calculate the histogram of the input image. The histogram represents the distribution of pixel intensities in the image.

### 2. Compute the Histogram of the Target Image

Calculate the histogram of the target/reference image that you want the input image to resemble.

### 3. Histogram Specification Process

For each intensity level in the input image histogram, find a corresponding intensity level in the target histogram. This mapping can be done by matching the cumulative distribution functions (CDFs) of the input and target histograms. You find a mapping function that transforms the input histogram into a distribution that approximates the target histogram.

The mapping function can be calculated as follows:

- Compute the CDF of the input image.
- Compute the CDF of the target image.
- For each intensity level in the input image, find the corresponding intensity level in the target image's CDF.

### 4. Apply the Mapping Function to the Input Image

Apply the mapping function to each pixel in the input image to adjust its intensity level based on the mapping obtained in the previous step.

### 5. Generate the Output Image

Create the output image with the adjusted pixel values based on the mapping function. The output image now has a histogram that closely resembles the target histogram.

Histogram specification allows you to modify an image's appearance to match a particular desired look or to standardize images so that they have similar characteristics. It is commonly used in color correction, medical image processing, and various image enhancement tasks where maintaining or achieving specific histogram characteristics is essential.
