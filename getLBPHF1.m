 function fourierFeatures =  getLBPHF1(imnum,output,fourierSetA)

    
   
    
%     histArray = zeros(1,256);
    fourierFeatures = zeros(4116,16);
%     fourierFeatures1 = size(36,16);
    eVal = [1, 2, 3, 4, 5, 6, 7, 8];  %replace these values with eValues
    a=size(8);
    for i=1:4116
        for u=1:16
            ai=1;
            for r=1:16
                  fourierFeatures(i,u) = fourierFeatures(i,u)+ output(imnum,fourierSetA(i,r)+1)*(cos(2*22/7*(u-1)*(r-1)/7)-sin(2*22/7*(u-1)*(r-1)/7)*1i);
                  a(ai)=output(imnum,fourierSetA(i,r)+1);
                  ai=ai+1;
            end      
        end
        b=fft(a);
%         for j=1:8
%             fourierFeatures1(i,j)=b(j);
%         end
    end
%     for m = 2:35
%         for n = 1:8
%             if (fourierSetA(m,n)~=0)
%                 fourierFeatures(m) = fourierFeatures(m)+(histArray(fourierSetA(m,n))*eVal(n));
%             end
%         end
%     end
%     fourierFeatures(36) = histArray(255)*eVal(1);


end