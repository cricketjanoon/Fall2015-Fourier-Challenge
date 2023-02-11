function im=myLogDynamicCompression(im,c)
%perform logarithmic dynamic compression of 'im' between 0 and c (default c=1)
if nargin==1
    c=1;
end
mn=min(im(:));  %min
im=im-mn;       %affine rescaling to make image non-negative (log() can't accept negative values)
mx=max(im(:));  %max

% ----- ADD CODE HERE -----
im=;  %logarithmic dynamic compression between 0 and c
% -----