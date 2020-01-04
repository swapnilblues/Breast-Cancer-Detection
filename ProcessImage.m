
function CroppedI2 = ProcessImage(InitImage)
%     figure
%     imshow(InitImage)
%     title('Original Image')

    CroppedI = CropImage(InitImage);
%     figure
%     imshow(CroppedI)
%     title('Image Cropped')

    %MedI = MedianFilter(CroppedI);
    %figure
    %imshow(MedI)
    %title('Median Filter applied')

    OtsuI = ThreshOtsu(CroppedI);
%     figure
%     imshow(OtsuI)
%     title('Otsu applied')

    %%showing only the thresholded part of image
    [m,n]=size(OtsuI);
    for i=1:m
        for j=1:n
            if(OtsuI(i,j)==0)
                CroppedI(i,j)=0;
            end
        end
    end
%     figure
%     imshow(CroppedI)
%     title('Filtered Image')

    CroppedI2 = CropImage(CroppedI);
%     figure
%     imshow(CroppedI2)
%     title('Image Cropped 2')
end
