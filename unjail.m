function im_unjailed=unjail(im)

%% Compute the 2D Fourier coefficients of the image
%  via the 2D Discrete Fourier Transform (DFT)
F=fft2(im);

%% Shift the Fourier coefficients
%  such that F(0,0) lies in the middle
F1=fftshift(F);

%% Compute the Fourier spectrum for visualisation
S=abs(F1);

%% Apply Logarithmic Dynamic Compression
%  to the Fourier spectrum S
%  so that it lies in the range [0,1]
S = . . .;

%% Visualise Fourier spectrum S
clf;
subplot(221);
imagesc(S); axis image;
title('Frequency spectrum of original image');

%% Perform filtering by suppressing frequencies
% with magnitudes greater than k standard deviations
% above the mean
S0=S;
F0=F1;
m=mean(S(:));
s=std(S(:));

% ----- ADD CODE HERE -----
% find a suitable value of k through trial and error
k = . . .;
% find indices of frequencies with magnitudes 
% greater than k standard deviations above the mean
inds=find(S> . . . );   
% -------------------------

% set selected Fourier coefficents to 0
S(inds)=0;
F1(inds)=0;
% retain original coefficent for frequency (0,0)
center=floor(size(S)/2)+1;
S(center(1),center(2))=S0(center(1),center(2));
F1(center(1),center(2))=F0(center(1),center(2));

%% Visualise suppressed Fourier spectrum S
subplot(222);
imagesc(S); axis image;
title('Spectrum with frequency suppression');

%% Shift the modified Fourier coefficients
%  back to the format that Matlab understands
F1=fftshift(F1);

%% Take the inverse Fourier transform
im_unjailed=real(ifft2(F1));

%% Visualise original and filtered images
subplot(223); imagesc(im); axis image; title('Original image');
subplot(224); imagesc(im_unjailed); axis image; title('Filtered image');
colormap gray;