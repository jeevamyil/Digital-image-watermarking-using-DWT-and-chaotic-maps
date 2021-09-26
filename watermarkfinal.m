clc
close all
% embedding strength
alpha = 0.19;
beta = 0.18;
%input image
Input_image_1 = imread('002L_1.png');
dim=1024;
Input_image=preprossesing(Input_image_1,dim);

%3 level dwt
[LL1,HL1,LH1,HH1] = dwt2(Input_image,'haar');
[LL2,HL2,LH2,HH2] = dwt2(LL1,'haar');
[LL3,HL3,LH3,HH3] = dwt2(LL2,'haar');
p = size(LL3);

%applying SVD on HL3&LH3
[Uy,Sy,Vy] = svd(HL3);
[Uy1,Sy1,Vy1] = svd(LH3);
q = size(Sy);

%watermark images
watermark_image1 = imread('right.jpg');
watermark_image_1p=preprossesing(watermark_image1,p(1,1));
watermark_image2 = imread('left.jpg');
watermark_image_2p=preprossesing(watermark_image2 ,p(1,1));

%applying SVD on watermark
[Uw,Sw,Vw] = svd(double(watermark_image_1p));
[Uw1,Sw1,Vw1] = svd(double(watermark_image_2p));

%embed watermark
Smark = Sy + alpha*Sw;
Smark1 = Sy1 + beta*Sw1;

%Rebuild the sub-bands using SVD
HL3_1 = Uy*Smark*Vy';
LH3_1 = Uy1*Smark1*Vy1';

%Apply inverse dwt to get watermarked image
LL2_1 = idwt2(LL3,HL3_1,LH3_1,HH3,'haar','db2');
LL1_1 = idwt2(LL2_1,HL2,LH2,HH2,'haar','db2');
I = idwt2(LL1_1,HL1,LH1,HH1,'haar','db2');
I_1=im2uint8(I);
imwrite(I_1, 'watermarked_image.png', 'png');
%enc
enc=encrypt();
%decr
decr=decrypt();
%EXTRACTION
[LL1_wmv,HL1_wmv,LH1_wmv,HH1_wmv] = dwt2(decr,'haar');
[LL2_wmv,HL2_wmv,LH2_wmv,HH2_wmv] = dwt2(LL1_wmv,'haar');
[LL3_wmv,HL3_wmv,LH3_wmv,HH3_wmv] = dwt2(LL2_wmv,'haar');

[Uy_wmv,Sy_wmv,Vy_wmv] = svd(HL3_wmv);
Swrec = (Sy_wmv - Sy)/alpha;
WMy = Uw*Swrec*Vw';

[Uy1_wmv,Sy1_wmv,Vy1_wmv] = svd(LH3_wmv);
Swrec1 = (Sy1_wmv - Sy1)/beta;
WMy1 = Uw1*Swrec1*Vw1';
