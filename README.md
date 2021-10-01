# Digital-image-watermarking-using-DWT-and-chaotic-maps
Discrete wavelet transform based watermarking approach with chaotic map based encryption.

## Techniques used ##
* Discrete Wavelet Transform
* Singular Value Decomposition
* Logistic Map
* Arnold Map
* Linear feedback shift register

## Tools used ##
* Matlab

## Steps ##

1. Watermark strength is selected.
2. Cover image is converted into grayscale image and converted into required size.
3. The Cover Image is splitted into multiple frequency bands using 3-level Discrete Wavelet Transform.
4. The Singular Value Decomposition is applied on the selected frequency bands.
5. The Watermark images are converted into grayscale and resized.
6. The Singular Value Decomposition is applied on the watermark images.
7. The Watermark image is embedded into the Cover image.
8. Frequency bands are recreated using svd.
9. 3-level Inverse Discrete wavelet transform is applied to recreate the image from the frequency bands.
10. Watermarked Image is encrypted using Logistic map/ arnold map based encryption algorithms.

