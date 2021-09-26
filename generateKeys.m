function [lfsrKey, chaoticKey] = generateKeys(chSeed, mu, lfSeed, m, n, ~)
disp('making Encryption Keys ... this may take some time');
disp('progress :      ');

totalSteps = m*n;
thisStep = 0;
progressStep = 0.01*totalSteps;

lfPrev = lfSeed;
chPrev = chSeed;

lfsrKey = uint8(zeros(m, n));
chaoticKey = uint8(zeros(m, n));

for i=1:m
    for j=1:n
       
            %Chaotic Sequence
            chPrev = mu * chPrev * (1-chPrev);
            chaoticKey(i, j) = 255 * chPrev;
            
            %LFSR Sequence
            tmpBit = num2str(xor(str2double(lfPrev(1)), xor(str2double(lfPrev(5)), xor(str2double(lfPrev(6)), str2double(lfPrev(7))))));
            lfPrev = strcat(lfPrev(2:8), tmpBit);
            lfsrKey (i, j) = bin2dec(lfPrev);
            
            % display the Progress made 
            if mod(thisStep, progressStep) == 0
                fprintf("\b\b\b\b\b\b\b %05.2f%%",(thisStep*100 / totalSteps));
            end
            thisStep = thisStep + 1;            
        
    end   
end

end