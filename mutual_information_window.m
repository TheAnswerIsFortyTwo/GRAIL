% MUTUAL_INFORMATION_WINDOW computes the mutual information between a 12 bit image.
% and its 8 bit representation.  
%
% Inputs:
%       image:	Matrix of the input image 
%       a:	lowest intensity window
%       b:	The factor of downsampling along rows.
%               
% Output:
%       mi: the mutual information
%
% Sample use:
% 
% mi = mutual_information_window(original_image, 1928, 4090);
% 
% 
% (C)	42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia, Universidad Politécnica de Valencia
%       alberto.corbi@ific.uv.es

function MI = mutual_information_window(image, a, b)
im8 = quantify8bits(im, a, b);
MI = mutual_information(im, im8);

