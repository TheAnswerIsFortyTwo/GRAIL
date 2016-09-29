% ENTROPY_WINDOW obtains the entropy of an image 
% which is previously windowed by two intensity thresholds.  
%
% Inputs:
% 	image: Matrix of the input image 
%	a: lowest intensity
%	b: highest intensity
%               
% Output:
%	ent: entropy of the windowed image
%
% Sample use:
% 	ent = entropy_window(original_image, 1928, 4090);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [ent] = entropy_window(image, a, b)
im = quantify8bits(image, a, b);
ent = -entropy(im);
