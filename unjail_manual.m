function im_unjailed=unjail_manual(im)

%% Compute the 2D Fourier coefficients of the image
%  via the 2D Discrete Fourier Transform (DFT)
F=fft2(im);

%% Shift the Fourier coefficients
%  such that F(0,0) lies in the middle
F1=fftshift(F);

%% Compute the Fourier spectrum for visualisation
S=abs(F1);

% ----- ADD CODE HERE -----
%% Apply Logarithmic Dynamic Compression
%  to the Fourier spectrum S
%  so that it lies in the range [0,1]
S= . . .;
% -------------------------

%%
%  Use the mouse to select rectangular areas
%  in the Fourier domain. The following code
%  lets you select 4 points of a rectangular
%  area and sets all Fourier coefficients
%  within that area to 0. It keeps asking you
%  for more rectangles until you press 'n'.
ch='y';
clf;
subplot(121); imagesc(S); axis image; title('Frequency spectrum of original image');
display('Mark the jail ingredients. I will remove them!'); sz=size(S);
while strcmpi(ch,'y')
    
    [x,y]=ginput(4);
    x=ceil(x);
    y=ceil(y);
    
    % handle points marked outside the boundaries
    x(x<1)=1; x(x>size(S,2))=size(S,2);
    y(y<1)=1; y(y>size(S,1))=size(S,1);
    ch=input('Do you want to mark more jail ingredients (y/n): ', 's');
    
    % set marked frequency coefficients to zero
    F1(min(y):max(y),min(x):max(x))=0;
    S(min(y):max(y),min(x):max(x))=0;
    
    % ensure that FT remains conugate symmetric
    [i,j]=find(S==0);
    for k=1:length(i)
        S(mod(sz(1)-i(k)+1, sz(1)) + 1, mod(sz(2)-j(k)+1, sz(2)) + 1) = S(i(k),j(k));
        F1(mod(sz(1)-i(k)+1, sz(1)) + 1, mod(sz(2)-j(k)+1, sz(2)) + 1) = conj(F1(i(k),j(k)));
    end
    
    subplot(121); imagesc(S); colormap gray
    
    %% Shift the modified Fourier coefficients
    %  back to the format that Matlab understands
    F1=fftshift(F1);
    
    %% Take the inverse Fourier transform
    im_unjailed=ifft2(F1);
    
    %% Theoretically, the inverse Fourier transform
    %  outputs real numbers. But, because of numerical
    %  inaccuracies, some results have a very small
    %  imaginary part. So we ignore that and pick only
    %  the real part.
    im_unjailed=real(im_unjailed);
    
    subplot(122); imagesc(im_unjailed); colormap gray;
end