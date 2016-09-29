% GABOR_REPRESENTATION8BITS obtains the gabor decomposition of an image
% by previously translating it to 8 bit using an intensity window
%
% Inputs:
% 	image: image to process 
%	a, b: intensity limits
%	u, v: number of gabor scales and frequencies 	
%               
% Output:
%	gabor_image: the gabor-filtered image
%
% Sample use:
% 	ent = gabor_representation8bits(image, 200, 3500, 3, 6);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [image_gabor] = gabor_representation8bits(image, a, b, u, v)
	
image8 = quantify8bits(image, a, b);
image_gabor = gabor_decomposition(image8, u, v);
