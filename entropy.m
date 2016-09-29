% ENTROPY obtains the entropy of an image
%
% Inputs:
% 	image: image to process 
%               
% Output:
%	ent: the entropy
%
% Sample use:
% 	ent = entropy(image);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [ent] = entropy(image)

ndim = size(image, 3); 
ent = 0;

for k = 1:ndim
     plane = image(:,:,k);
     H = hist(plane(:), 0:2^16);
     p = H/sum(H) + eps;
     ent = ent + sum(-p.*log2(p));
end

ent = ent / ndim;

