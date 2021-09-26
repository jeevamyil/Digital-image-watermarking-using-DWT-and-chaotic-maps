function output = preprossesing(Input_image,sizee)
[~,~,o]=size(Input_image);
if (o)==3
Input_image=rgb2gray(Input_image);
end
%Input_image=histeq(Input_image);
Input_image=mat2gray(Input_image);
Ii=imresize(Input_image,[sizee,sizee]);
output = Ii;
end

