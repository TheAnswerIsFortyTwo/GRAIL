% MAKESTEPS helper function to compute the optimization grid.  
%
% Inputs:
% 	deltacero: initial intensity span 
%	kmax: number of iterations
%               
% Output:
%	steps: array with optimization steps
%
% Sample use:
% 	img = makesteps(300, 3);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es


function [steps] = makesteps(deltacero, kmax)
	
steps = [deltacero];	
for step = 1:(kmax - 1)
	deltacero = deltacero/(10);
	if rem(deltacero, 1) ~= 0
		break;
	end
	steps = [steps deltacero];
end