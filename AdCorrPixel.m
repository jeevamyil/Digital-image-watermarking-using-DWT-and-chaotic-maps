function  r_xy=AdCorrPixel( P )
%   Detailed explanation goes here
x1 = double(P(:,1:end-1));
y1 = double(P(:,2:end));
randIndex1 = randperm(numel(x1));
randIndex1 = randIndex1(1:3000);
x = x1(randIndex1);
y = y1(randIndex1);
r_xy = corrcoef(x,y);
end