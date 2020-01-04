% This Modified GLCM is based on the average of all sorrounding pixels
% around the main pixel.

function [graycomatrix] = myGrayCoModAMatrix(InitImage)
[m,n] = size(InitImage);

graycomatrix = zeros(256,256,1);
for i=2:m-1
    for j=2:n-1
        k = InitImage(i,j)+1;
        average = ((InitImage(i-1,j-1)+1) + (InitImage(i-1,j)+1) + (InitImage(i-1,j+1)+1) + (InitImage(i,j-1)+1) + (InitImage(i,j+1)+1) + (InitImage(i+1,j-1)+1) + (InitImage(i+1,j)+1) + (InitImage(i+1,j+1)+1))/8;
        average = round(average);
        graycomatrix(k,average,1) = graycomatrix(k,average,1) + 1;
    end
end

end