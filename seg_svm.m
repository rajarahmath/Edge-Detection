function seg_svm()

    % Read and resize the image
    im0 = imread('rajaz.jpg');
    im0 = imresize(im0, 0.25);
    [M, N, ~] = size(im0);

    % Perform edge detection
    edge_im = edge(rgb2gray(im0), 'Sobel'); % You can use any edge detection method here

    % Display the original and edge-detected images
    figure(1),
    subplot(1,3,1), imshow(im0), title('Training Image');
    subplot(1,3,2), imshow(edge_im), title('Edge Detected Image');

    % Convert edge-detected image to double
    edge_im_double = double(edge_im);

    % Combine RGB values and edge information
    hs = double(reshape(im0, [], 3));
    hs = [hs edge_im_double(:)];

    % Labels: 1 for pixels above threshold in R channel, 0 otherwise
    Y = (hs(:,1) > 180); 

    % Train SVM classifier
    svm = fitcsvm(hs, Y);

    % Perform 10-fold cross-validation
    cv = crossval(svm);
    
    % Calculate the 10-fold loss/accuracy
    loss = kfoldLoss(cv);

    % Predict using the data not used for training
    [~, score] = kfoldPredict(cv);

    % Predictions: score>0 for face and score<=0 for background
    predX = (score(:,2) > 0); 
    predX = hs(:, 1:3) .* predX;

    % Reshape the predicted pixels back to image resolution
    im_pred = reshape(predX, M, N, 3);

    % Display the segmented image
    subplot(1,3,3), imshow(uint8(im_pred)), title('Predicted Image');

end
