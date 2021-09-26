function encrypted_image = encrypt()

clc; 
clear all; 
close all;

img = imread('watermarked_image.png');

%img = rgb2gray(img);
[m, n, o] = size(img);

% initial values 
mu = 3.985;
chSeed = 0.85986;
lfSeed = '11001011';
%-------------------

[lfKey, chKey] = generateKeys(chSeed, mu, lfSeed, m, n, o);
fprintf('\nEncrypting Image ...\n');

% making a combination of keys for more Security
combKey = bitxor(chKey, lfKey, 'uint8');

% Encrypting Using Keys
comb = bitxor(combKey, img, 'uint8');

imwrite(comb, 'ency.png', 'png');



encrypted_image=comb;
end

