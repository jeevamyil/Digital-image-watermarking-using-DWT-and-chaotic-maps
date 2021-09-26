function output = decrypt()

clc; clear all; close all;

img = imread('ency.png');
[m, n, o] = size(img);

% initial values
mu = 3.985;
chSeed = 0.85986;
lfSeed = '11001011';
%-------------------

%create keys and combine them 
[lfKey, chKey] = generateKeys(chSeed, mu, lfSeed, m, n, o);
combKey = bitxor(chKey, lfKey, 'uint8'); 

%Decrypting
decImg = bitxor(combKey, img, 'uint8');


output=decImg;




end

