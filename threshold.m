% Read the image
image = imread('rajaz.jpg');
sign = imread('my_sign.jpg');
% Convert the image to grayscale
gray_image = rgb2gray(image);

% Perform edge detection using the Sobel operator
edge_image = edge(gray_image, 'Sobel');

% Set a threshold to segment the edges
threshold = 0.5; % Adjust this threshold as needed
binary_edge_image = edge_image > threshold;

% Create an edge color (red)
edge_color = [0, 0, 255]; % Red color

% Replicate edge color array to match the dimensions of the binary edge-detected image
edge_color_replicated = repmat(edge_color, [size(binary_edge_image, 1), size(binary_edge_image, 2), 1]);

% Overlay the binary edge-detected image onto the colored background
overlay_image = zeros(size(binary_edge_image, 1), size(binary_edge_image, 2), 3, 'uint8');
overlay_image(binary_edge_image) = edge_color_replicated(binary_edge_image); % Set the color of edges to red

% Convert the signature image to grayscale
sign_gray = rgb2gray(sign);

% Invert the signature
inverted_sign = 255 - sign_gray;

% Resize the inverted signature image (adjust the scaling factor as needed)
inverted_sign_resized = imresize(inverted_sign, 0.2);

% Get the size of the inverted signature image
[row, col] = size(inverted_sign_resized);

% Define the region to place the inverted signature on the bottom of the edge-detected main image
r_offset = size(binary_edge_image, 1) - row; % Vertical offset (bottom of the image)
c_offset = size(binary_edge_image, 2) - col; % Horizontal offset (leftmost position)
x0 = 1 + c_offset;
x1 = col + c_offset;
y0 = 1 + r_offset;
y1 = row + r_offset;

% Overlay the inverted signature on the edge-detected main image
edge_with_inverted_sign = binary_edge_image;
edge_with_inverted_sign(y0:y1, x0:x1) = uint8(inverted_sign_resized);

% Display the overlaid edge-detected image
figure;
subplot(1,2,1);
imshow(image);
title('Original Image');
    
subplot(1,2,2);
imshow(edge_with_inverted_sign);
title('Edge Detected Image with Inverted Signature');

