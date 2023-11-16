% Read the text file
data = dlmread('savedata.txt');

% Reshape the data into a 512x512 matrix
image_data = reshape(data, 512, 512);
% Scale the data to the range 0-255
image_data = mat2gray(image_data) * 255;
% Create a blank BMP image
bmp_image = zeros(512, 512, 'uint8');
% Assign the image data to the BMP image
bmp_image(:) = image_data(:);
% Save the BMP image
imwrite(bmp_image, 'output.bmp');
