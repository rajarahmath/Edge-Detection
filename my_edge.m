function im2 = my_color_edge(im)
    % Read the input image (replace 'rajaz.jpg' with the actual image filename)
    im = imread('rajaz.jpg');

    % Compute the edges for each color channel
    red_edges = edge(im(:,:,1), 'sobel');
    green_edges = edge(im(:,:,2), 'sobel');
    blue_edges = edge(im(:,:,3), 'sobel');

    % Combine the color edges
    im2 = cat(3, red_edges, green_edges, blue_edges);

    % Display the original and color edge images
    figure;
    subplot(1,2,1);
    imshow(im);
    title('Original Image');

    subplot(1,2,2);
    imshow(im2);
    title('Color Edge Image');
end
