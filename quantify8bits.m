% QUANTIFY8BITS resamples a 12 bit image to 8 bit outputting the resulting
% image as 12 bits. It applies lowest (a) and highest (b) intensity window.  
%
% Inputs:
% 	image: Matrix of the input image 
%	a: lowest intensity
%	b: highest intensity
%               
% Output:
%	im8: a 12 bit image but resampled as if displayed in 8 bit
%
% Sample use:
% 	img = quantify8bits(original_image, 1928, 4090);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es


function [im8] = quantify8bits(image, a, b)

bits = 8;
maxval = 2^bits - 1;
M = max(image(:));
m = min(image(:));

im8 = min(max(round((image - a)/(b - a)*maxval), 0), maxval);
im8 = im8/255*(M - m) + m;
