function [mi] = gabor_entropy(image_gabor, image, a, b, u, v)
	
image_gabor8 = gabor_representation8bits(image, a, b, u, v);
mi = mutual_information(image_gabor, image_gabor8);

