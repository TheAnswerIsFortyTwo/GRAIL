% JOINT_ENTROPY obtains the joint entropy between two images
%
% Inputs:
% 	X, Y: images to process 
%               
% Output:
%	ent: the joint entropy
%
% Sample use:
% 	ent = joint_entropy(image1, image2);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Universidad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [ent] = joint_entropy(X, Y)

ndim = size(X, 3); 
ent = 0;

for k = 1:ndim
	x = X(:,:,k);
	y = Y(:,:,k);
	H = accumarray(round([x(:) y(:)] + 1), 1, [max(x(:)) max(y(:))] + 1);
	p = H(:)/sum(H(:)) + eps;
	ent = ent + sum(-p.*log2(p));
end

ent = ent/ndim;