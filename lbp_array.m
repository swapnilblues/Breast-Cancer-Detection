function array = lbp_array(Image)
%     InitImage = imread('mdb001.pgm');
    InitImage =  Image;
    [m,n] = size(InitImage);
    testArray = zeros(m+2, n+2);
    testArray(2:m+1, 2:n+1) = InitImage(1:m, 1:n);
    lbp = zeros(m,n);
    for i = 2:m
        for j= 2:n
            
            arr = zeros(1,8);
            if (testArray(i-1,j-1) < testArray(i,j)); arr(1)=0; else; arr(1)=1; end
            if (testArray(i-1,j) < testArray(i,j)); arr(2)=0; else; arr(2)=1; end
            if (testArray(i-1,j+1) < testArray(i,j)); arr(3)=0; else; arr(3)=1; end
            if (testArray(i,j-1) < testArray(i,j)); arr(4)=0; else; arr(4)=1; end
            if (testArray(i,j+1) < testArray(i,j)); arr(5)=0; else; arr(5)=1; end
            if (testArray(i+1,j-1) < testArray(i,j)); arr(6)=0; else; arr(6)=1; end
            if (testArray(i+1,j) < testArray(i,j)); arr(7)=0; else; arr(7)=1; end
            if (testArray(i+1,j+1) < testArray(i,j)); arr(8)=0; else; arr(8)=1; end
            
            lbp(i,j) = bi2de(arr, 'left-msb');
        end
    end
    array = lbp;
end