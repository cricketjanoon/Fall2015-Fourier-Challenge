img = imread('mystery.png');
[ft, log_magnitude, ~] = myDFT(img);

subplot(1, 3, 1);
imshow(img, []); title("Original Image");


log_magnitude = fftshift(log_magnitude);
filter = fftshift(ft);


log_magnitude(:, 61) = 0;
filter(:, 61) = 0;

log_magnitude(:, 54:58) = 0;
log_magnitude(:, 64:67) = 0;
filter(:, 54:58) = 0;
filter(:, 64:67) = 0;

log_magnitude(55:57, :) = 0;
log_magnitude(65:67, :) = 0;
filter(55:57, :) = 0;
filter(65:67, :) = 0;

% log_magnitude(48:50, 61) = 0;
% log_magnitude(70:73, 61) = 0;
% filter(48:50, 61) = 0;
% filter(70:73, 61) = 0;

log_magnitude(55:57, 55:57) = 0;
log_magnitude(65:67, 65:67) = 0;
filter(55:57, 55:57) = 0;
filter(65:67, 65:67) = 0;


subplot(1, 3, 2);
imshow(log_magnitude, []); title("FT");

res = myIDFT(fftshift(filter));
subplot(1, 3, 3);
imshow(res, []); title("Result");