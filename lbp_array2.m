function array = lbp_array2(Image)
%     InitImage = imread('mdb001.pgm');
    InitImage =  Image;
    [m,n] = size(InitImage);
    testArray = zeros(m+4, n+4);
    testArray(3:m+2, 3:n+2) = InitImage(1:m, 1:n);
    lbp = zeros(m,n);
    for i = 3:m+2
        for j= 3:n+2
            
            arr = zeros(1,8);
            if (testArray(i-2,j-2) < testArray(i-1,j-1)); arr(1)=0; else; arr(1)=1; end
            if (testArray(i-2,j) < testArray(i-1,j)); arr(2)=0; else; arr(2)=1; end
            if (testArray(i-2,j+2) < testArray(i-1,j+1)); arr(3)=0; else; arr(3)=1; end
            if (testArray(i,j-2) < testArray(i,j-1)); arr(4)=0; else; arr(4)=1; end
            if (testArray(i,j+2) < testArray(i,j+1)); arr(5)=0; else; arr(5)=1; end
            if (testArray(i+2,j-2) < testArray(i+1,j+1)); arr(6)=0; else; arr(6)=1; end
            if (testArray(i+2,j) < testArray(i+1,j)); arr(7)=0; else; arr(7)=1; end
            if (testArray(i+2,j+2) < testArray(i+1,j+1)); arr(8)=0; else; arr(8)=1; end
            
            lbp(i,j) = bi2de(arr, 'left-msb');
        end
    end
    array = lbp;
end