I = imread("rajaz.jpg");
[L,Centers] = imsegkmeans(I,8);
labels = L(1:10,100:110)
B = labeloverlay(I,L);

% Display the labeled image
figure;
subplot(1, 2, 1);
imshow(I);
title('Original Image');

subplot(1, 2, 2);
imshow(B);
title("K-Means Edge Segmentation");

imwrite(B, "segmented_image.png");

