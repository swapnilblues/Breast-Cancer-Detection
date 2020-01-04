% This GLCM modification is based on extraction of features based on
% patterns considering the pixels at a pixel distance at radius of 1-2,
% counting the occurences in the same GLCM

function [graycomatrix] = myGrayCoModDMatrix(InitImage)
    [m,n] = size(InitImage);
    
    graycomatrix = zeros(256,256,4);
    
%     for 2 distances at 0 degree
    for i=1:m
        for j=1:n-1
            k = (InitImage(i,j));
            l = (InitImage(i,j+1));
            graycomatrix(k+1,l+1,1) = graycomatrix(k+1,l+1,1) + 1; 
        end
    end
    
    for i=1:m
        for j=1:n-2
            k = (InitImage(i,j));
            l = (InitImage(i,j+2));
            graycomatrix(k+1,l+1,1) = graycomatrix(k+1,l+1,1) + 1; 
        end
    end
    
    
%     for 2 distances at 45 degree
    
    for i=2:m
        for j=1:n-1
            k = (InitImage(i,j));
            l = (InitImage(i-1,j+1));
            graycomatrix(k+1,l+1,2) = graycomatrix(k+1,l+1,2) + 1; 
        end
    end
    
    
    for i=3:m
        for j=1:n-2
            k = (InitImage(i,j));
            l = (InitImage(i-2,j+2));
            graycomatrix(k+1,l+1,2) = graycomatrix(k+1,l+1,2) + 1; 
        end
    end
    

    
    %     for 2 distances at 90 degree
    
    for i=2:m
        for j=1:n
            k = (InitImage(i,j));
            l = (InitImage(i-1,j));
            graycomatrix(k+1,l+1,3) = graycomatrix(k+1,l+1,3) + 1; 
        end
    end
    
    for i=3:m
        for j=1:n
            k = (InitImage(i,j));
            l = (InitImage(i-2,j));
            graycomatrix(k+1,l+1,3) = graycomatrix(k+1,l+1,3) + 1; 
        end
    end
    
    %     for 2 distances at 135 degree
    
    for i=2:m
        for j=2:n
            k = (InitImage(i,j));
            l = (InitImage(i-1,j-1));
            graycomatrix(k+1,l+1,4) = graycomatrix(k+1,l+1,4) + 1;
        end
    end
    
    for i=3:m
        for j=3:n
            k = (InitImage(i,j));
            l = (InitImage(i-2,j-2));
            graycomatrix(k+1,l+1,4) = graycomatrix(k+1,l+1,4) + 1;
        end
    end
    
end