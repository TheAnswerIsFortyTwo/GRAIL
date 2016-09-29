% GRAIL main Grail algorithm. It finds the min and max intensity value
% of a mammogram based on a perceptual matric which combines mutual information
% and Gabor filtering.
%
% Inputs:
% 	image_name: path of image to process
%   u: number of scales in Gabor filtering
%	v: number of frequencies in Gabor filtering
%	deltacero: initial search span
%	kmax: number of max iterations
%	scale: scale of image, if necessary
%               
% Output:
%	best_a, best_b: the min and max optimal intensity values
%
% Sample use:
% 	[minlevel maxlevel] = grail('TG18-MM-2k-02.dcm', 3, 6, 300, 3, 1);
%	[minlevel maxlevel] = grail('TG18-MM-2k-02.dcm');
%	[minlevel maxlevel] = grail('TG18-MM-2k-02.dcm', .25);
%	[minlevel maxlevel] = grail('TG18-MM-2k-02.dcm', 3, 6);
%	[minlevel maxlevel] = grail('TG18-MM-2k-02.dcm', 3, 6, 300, 3);
%  
% (C) 42istheanswer, Instituto de Física Corpuscular, Universidad de Valencia,
% Universidad Politécnica de Valencia, ITEAM.
% alberto.corbi@ific.uv.es


function [best_a, best_b] = grail(image_name, u, v, deltacero, kmax, scale)

switch nargin
    case 1
	u = 3; v = 6; deltacero = 300; kmax = 3; scale = 1;
    case 2
    u = 3; v = 6; deltacero = 300; kmax = 3;
    case 3
	deltacero = 300; kmax = 3; scale = 1;
    case 4
	kmax = 1; scale = 1;
    case 5
    scale = 1;
end
	
isOctave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if (isOctave)
	pkg load image signal
end

% We try to read plain image file first, if not, switch to dicom format
% This is only necessary for Matlab
try
   image = imread(image_name);
catch
   image = dicomread(image_name);
end

image = imresize(image, scale);
steps = makesteps(deltacero, kmax);

bmax = max(image(:));
bmin = round(mean(image(:)));
amin = min(image(:));
amax = round(mean(image(:)));

for st = steps
	[mutual_infs, B] = mutual_information_gabor_right_edge(image, st, bmax, bmin, amin, u, v);
	[max_mi, ind] = max(mutual_infs);
	best_b = B(ind);
	[mutual_infs, A] = mutual_information_gabor_left_edge(image, st, amax, amin, best_b, u, v);
	[max_mi, ind] = max(mutual_infs);
	best_a = A(ind);

	amin = max(best_a - st, 0);
	amax = best_a + st;
	bmin = best_b - st;
	bmax = min(best_b + st, max(image(:)));
end
