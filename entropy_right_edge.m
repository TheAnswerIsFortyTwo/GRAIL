% ENTROPY_RIGHT_EDGE obtains the entropy of an image 
% which is iteratively windowed by a highest intensity threshold
% which is calculated in each iteration with a step value. 
%
% Inputs:
% 	image: Matrix of the input image 
%	step: window step, star
%               
% Output:
%	ent, B: array of entropies and intensity segments
%
% Sample use:
% 	[ent, B] = entropy_right_edge(original_image, 300);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es


function [ent, B] = entropy_right_edge(image, step)

bmax = max(image(:));
a = min(image(:));
B = bmax : -step : mean(image(:));

k = 1;

for b = B
    ent(1, k) = entropy_window(image, a, b);
    k = k + 1;
end

