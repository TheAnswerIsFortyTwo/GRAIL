% GABOR_DECOMPOSITION obtains the Gabor feature vector
% of an image
%
% Inputs:
% 	image: image to process 
%               
% Output:
%	featureVector: the Gabor features vector
%
% Sample use:
% 	fvec = gabor_decomposition(image);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Univeridad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es

function [featureVector] = gabor_decomposition(img, u, v)
% u = 5;
% v = 8;
m = 39;
n = 39;
d1 = 1;
d2 = 1;

gaborArray = gaborFilterBank(u,v,m,n);
featureVector = gaborFeatures(img,gaborArray,d1,d2);
featureVector = reshape(featureVector,size(img,1)/d1,size(img,2)/d2,u*v);

for k = 1: u*v
    featureVector(:,:,k) = featureVector(:,:,k)/max(max(featureVector(:,:,k)));
end

featureVector = min(featureVector,0.5)*512;
