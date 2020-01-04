clc
clear all;
close all;
output=zeros(322,256);
srcFile=dir('C:\Users\HP\Desktop\4thyearproject\Codes_Swapnil\breastnew\*.pgm');
lbphf=size(322,288);
imnum=1;
% output = zeros(256);

count = 0;
flag = zeros(1,256);
for i = 1:256
    if (flag(i)==0)
        count = count+1;
        binN = dec2bin((i-1),8);
        setCount = 1;
        for j = 1:8
            if (flag(bin2dec(binN)+1) == 0)
                fourierSetA(count,setCount) = bin2dec(binN);
                setCount = setCount + 1;
                flag(bin2dec(binN)+1) = 1;
            end
            binN = rotateOnce(binN);
        end
    end
end

for num=1:length(srcFile)
%     if num<50
%          continue;
%     end
    fn=strcat('C:\Users\HP\Desktop\4thyearproject\breastnew\',srcFile(num).name);
    Im=imread(fn);
    Im=ProcessImage(Im);
%     [a1,b1] = size(Im);
    %figure,imshow(I);
    if num==3
         break;
    end
    if num==59
        continue;
    end
    if num==60
        continue;
    end
    
% image = imread('mdb001.pgm');
    lbpArray = lbp_array2(Im);
% features = lbp_Features(lbpArray);
%     maptable = [1,2,3,4,0,5,6,7,0,0,0,8,0,9,10,11,0,0,0,0,0,0,0,12,0,0,0,13,0,14,15,16,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,17,0,0,0,0,0,0,0,18,0,0,0,19,0,20,21,22,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,23,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,25,0,0,0,26,0,27,28,29,30,0,31,0,0,0,32,0,0,0,0,0,0,0,33,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,35,36,37,0,38,0,0,0,39,0,0,0,0,0,0,0,40,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,41,42,43,0,44,0,0,0,45,0,0,0,0,0,0,0,46,47,48,0,49,0,0,0,50,51,52,0,53,54,55,56,57,58];
%     output = zeros(256);
%     mapTable = LBPmapTable();
    [m,n] = size(lbpArray);
    for i = 1:m
        for j = 1:n
            grayVal = lbpArray(i,j);
            output(num,grayVal+1) = output(num,grayVal+1) + 1;
        end
    end
%     fourierFeatures = getLBPHF(imnum,output,fourierSetA);
    k=1;
    for i=1:36
        for j=1:8
            lbphf(imnum,k)=output(i,j);
            k=k+1;
        end
    end
    imnum=imnum+1;
end
% for i=1:50
%     for j=1:256
csvwrite('LBPmodD.csv',lbphf,0,0);        
        
        
