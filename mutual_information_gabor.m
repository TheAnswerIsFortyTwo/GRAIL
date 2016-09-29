% MUTUAL_INFORMATION_GABOR computes the mutual information between a 12 bit image.
% and its 8 bit representation for an intensity window limited by a and b.  
%
% Inputs:
%       image:	Matrix of the input image 
%       a:	lowest intensity window
%       b:	The factor of downsampling along rows
%       u:	Number of Gabor scales
%       v:	Number of Gabor frequencies
%               
% Output:
%       MI:  the mutual information
%
% Sample use:
% 
% mutual_i = mutual_information_gabor(gabor_image, original_image, 1928, 4090, 3, 6, 30);
% 
% 
% (C)	42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia, Universidad Politécnica de Valencia
%       alberto.corbi@ific.uv.es

function [MI] = mutual_information_gabor(image_gabor, image, a, b, u, v, st)

image_gabor8 = gabor_representation8bits(image, a, b, u, v);
MI = mutual_information(image_gabor, image_gabor8);

