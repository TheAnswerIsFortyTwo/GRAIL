% MUTUAL_INFORMATION_GABOR_RIGHT_EDGE performs the GRAIL algorithm
% starting with the highest intensity and continuing downwards 
%
% Inputs:
% 	image: Matrix of the input image 
%	st: window step
%	bmax: rightmost intensity limit
%	bmin: leftmost intensity limit
% 	amax: lowest intensity limit
%	u, v: Gabor number of scales and frequencies
%               
% Output:
%	mutual_infs, B: array of obtained mutual informations for each intensity window
%
% Sample use:
% 	[mutual_infs, B] = mutual_information_gabor_left_edge(original_image, 300, 700, 452, 3987, 3, 6);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [mutual_infs, B] = mutual_information_gabor_right_edge(image, st, bmax, bmin, amin, u, v)

switch nargin
    case 2
        bmax = max(image(:));
        bmin = round(mean(image(:)));
        amin = min(image(:));
    case 3
        bmin = round(mean(image(:)));
        amin = min(image(:));
    case 4
        amin = min(image(:));
end

a = amin;
B = bmax: -st: bmin;

image_gabor = gabor_decomposition(image, u, v);

k = 1;

for b = B
    mutual_infs(k) =  mutual_information_gabor(image_gabor, image, a, b, u, v, st);
    k = k +1;
end


