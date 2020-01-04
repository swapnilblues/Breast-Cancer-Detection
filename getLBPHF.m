 function fourierFeatures =  getLBPHF(imnum,output,fourierSetA)

    
   
    
%     histArray = zeros(1,256);
    fourierFeatures = zeros(36,8);
    fourierFeatures1 = size(36,8);
    eVal = [1, 2, 3, 4, 5, 6, 7, 8];  %replace these values with eValues
    a=size(8);
    for i=1:36
        for u=1:8
            ai=1;
            for r=1:8
                  fourierFeatures(i,u) = fourierFeatures(i,u)+ output(imnum,fourierSetA(i,r)+1)*(cos(2*22/7*(u-1)*(r-1)/7)-sin(2*22/7*(u-1)*(r-1)/7)*1i);
%                   
            end      
        end
%        
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