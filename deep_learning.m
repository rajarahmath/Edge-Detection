data = load(fullfile(pretrainedFolder, 'deeplabv3plusResnet18CamVid.mat'));
net = data.net;
% Read an image
% Load and preprocess the input image
im = imread('rajaz.jpg');
im = imresize(im, net.Layers(1).InputSize(1:2)); % Resize the image to match the input size expected by the model
im = im2double(im); % Convert image to double precision

% Perform segmentation
segmentationMask = semanticseg(im, net);

% Display the segmented image
imshow(im);
hold on;
overlay = labeloverlay(im, segmentationMask);
imshow(overlay);
title('Segmented Image');

