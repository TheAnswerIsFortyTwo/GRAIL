% MUTUAL_INFORMATION obtains the mutual information between two images
%
% Inputs:
% 	X, Y: images to process 
%               
% Output:
%	MI: the mutual information
%
% Sample use:
% 	ent = mutual_information(image1, image2);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [MI] = mutual_information(X, Y)
	
MI = entropy(X) + entropy(Y) - joint_entropy(X, Y);
