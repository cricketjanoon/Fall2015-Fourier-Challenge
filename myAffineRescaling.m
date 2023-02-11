function im=myAffineRescaling(im,c)
%perform affine rescaling between 0 and c (default c=1)
if nargin==1
    c=1;
end
mn=min(im(:));  %min
mx=max(im(:));  %max
rng=mx-mn;  %range

% ----- ADD CODE HERE -----
im=;   %affine rescaling between 0 and c
% -----