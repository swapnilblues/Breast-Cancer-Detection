
    function rotatedBit = rotateOnce(inputBit)
        x = '00000000';
        x(1) = inputBit(8);
        for z = 1:7
            x(z+1) = inputBit(z);
        end
        rotatedBit = x;
    end