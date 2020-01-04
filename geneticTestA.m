%Making a population
featureSize = 22;
copies = 20;
population = 100;
chromosomes = createChromo(population,featureSize);
children=zeros(population,featureSize);
tic;

for a =1:10
    %LOOP
    chromoResult=findScores(chromosomes,Hog1);
    [x,y] = size(Hog1);
    scr=dsort(chromoResult);
%     momChromo=scr(1:20);
%     dadChromo=scr(1:20);
%     momChromo=momChromo(randperm(length(momChromo)));
%     dadChromo=dadChromo(randperm(length(dadChromo)));
    for i=1:copies
        momIdx=find(chromoResult==rouleteChose(scr));
        dadIdx=find(chromoResult==rouleteChose(scr));
        momChromo=chromosomes(momIdx,1:end);
        dadChromo=chromosomes(dadIdx,1:end);
        childChromo=crossChromosomes(momChromo,dadChromo);
%         fprintf("%d %d\n",size(childChromo),size(children));
        
%         children(i,1:end)=childChromo;
        for j=1:y-2
            children(i,j)=childChromo(j);
        end
    end
    bestScore = scr(1);
    ScoreTable(a)=bestScore;
    parentChromosome = chromosomes;
    chromosomes=createChromo(population,featureSize);
%     chromosomes(1:20)=children;
    for j=1:copies
        chromosomes(j)=childChromo(j);
    end
    %END LOOP
end
toc;

function chromoResult=findScores(chromosomes,GLCM)
    [a,b]=size(chromosomes);
    chromoResult=zeros(a,1);
    [m,n] = size(GLCM);
    for i=1:a
        child=chromosomes(i);
        glcmN = child.*GLCM(1:end,1:n-2);
        glcmN(1:end,n-1:n) = GLCM(1:end,n-1:n);
%         result = Score(glcmN, 100);
%           Mdl = fitcecoc(glcmN(1:end,1:n-2),glcmN(1:end,n-1));
           Mdl=fitcknn(glcmN(1:end,1:n-2),glcmN(1:end,n-1),'NumNeighbors',5,'Standardize',1);
         cvmodel = crossval(Mdl);
         result = 1-kfoldLoss(cvmodel);
%         result = svmtrain(glcmN(1:end,n-1), glcmN(1:end,1:n-2), '-v 5');
        chromoResult(i)=result;
    end
end

function hybridArray = crossChromosomes(momChromosome, dadChromosome)
    len = length(momChromosome);
    num1 = randi([1,(round(len/2))],1);
    num2 = randi([(round(len/2+1)),len],1);
    hybridArray(1:num1)=momChromosome(1:num1);
    hybridArray((num1+1):num2)=dadChromosome((num1+1):num2);
    hybridArray((num2+1):len)=momChromosome((num2+1):len);
end

function chromosomes=createChromo(population,featureSize)
    chromosomes = zeros(population,featureSize);
    for i=1:population
       for j=1:featureSize
           r=rand(1);
           if(r<=0.5)
               r=0;
           else
               r=1;
           end
           chromosomes(i,j) = r;
       end
    end
end

function rouleteScore = rouleteChose(scoreArray)
    scr = sort(scoreArray);
    len = length(scr);
    cumArray(1)=scr(1);
    for i=2:len
        cumArray(i) = cumArray(i-1) + scr(i);
    end
    mrand=1 + (cumArray(len)-1).*rand(1,1);
%     frand=1 + (cumArray(len)-1).*rand(1,1);
        
    mindex=1;
    for i=1:49
        if cumArray(i)<mrand
            mindex=mindex+1;
        
        else
            break;
        end
    end
    rouleteScore=scr(mindex);     
end
