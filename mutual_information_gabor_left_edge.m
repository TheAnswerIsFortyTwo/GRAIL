% MUTUAL_INFORMATION_GABOR_LEFT_EDGE performs the GRAIL algorithm
% starting with the lowest intensity and continuing upwards  
%
% Inputs:
% 	image: Matrix of the input image 
%	st: window step
%	amax: rightmost intensity limit
%	amin: leftmost intensity limit
% 	bmax: highest intensity limit
%	u, v: Gabor number of scales and frequencies
%               
% Output:
%	mutual_infs, A: array of obtained mutual informations for each intensity window
%
% Sample use:
% 	[mutual_infs, A] = mutual_information_gabor_left_edge(original_image, 300, 700, 452, 3987, 3, 6);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [mutual_infs, A] = mutual_information_gabor_left_edge(image, st, amax, amin, bmax, u, v)
	
switch nargin
    case 2
        amax = round(mean(image(:))); 
        amin = min(image(:));
        bmax = max(image(:));
    case 3
        amin = min(image(:));
        bmax = max(image(:));
    case 4
        bmax = max(image(:));
end

b = bmax;
A = amin : st : amax;

image_gabor = gabor_decomposition(image, u, v);
k = 1;

for a = A
    mutual_infs(k) =  mutual_information_gabor(image_gabor, image, a, b, u, v, st);
    k = k + 1;
end
