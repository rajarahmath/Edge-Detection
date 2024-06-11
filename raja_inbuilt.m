% read the image
I = rgb2gray(imread("rajaz.jpg")); 

subplot(2, 4, 1), 
imshow(I); 
title("Gray Scale Image"); 

% Canny
J = edge(I, 'Canny'); 
subplot(2, 4, 2), 
imshow(J); 
title("Canny"); 

% Log
K = edge(I, 'log'); 
subplot(2, 4, 3), 
imshow(K); 
title("Log");

% Sobel
L = edge(I, 'Sobel'); 
subplot(2, 4, 4), 
imshow(L); 
title("Sobel"); 

% Prewitt
M = edge(I, 'Prewitt'); 
subplot(2, 4, 5), 
imshow(M); 
title("Prewitt"); 

% Robert 
N = edge(I, 'Roberts'); 
subplot(2, 4, 6), 
imshow(N); 
title("Robert"); 

% Zerocross
O = edge(I, 'zerocross'); 
subplot(2, 4, 7), 
imshow(O); 
title("Zerocross"); 



