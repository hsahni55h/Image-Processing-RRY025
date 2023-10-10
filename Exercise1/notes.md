# MATLAB `histeq` Function

The `histeq` function in MATLAB is utilized for histogram equalization of grayscale images. Histogram equalization is a technique that enhances the contrast of an image by redistributing the intensities of the pixels to make the resulting image's histogram as uniform as possible.

## Syntax

```matlab
outputImage = histeq(inputImage);

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
