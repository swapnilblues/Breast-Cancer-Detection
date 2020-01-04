clc
clear all
close all
srcFile=dir('C:\Users\HP\Desktop\4thyearproject\Codes_Swapnil\breastnew\*.pgm');
for i=1:length(srcFile)
    if i==2
        break;
    end
    fn=strcat('C:\Users\HP\Desktop\4thyearproject\breastnew\',srcFile(i).name);
    Im=imread(fn);
    Im=ProcessImage(Im);

    stats = GLCM_Featuresl(Im);
    C = horzcat(stats.autoc, stats.contr, stats.corrm, stats.corrp, stats.cprom, stats.cshad, stats.dissi, stats.energ, stats.entro, stats.homom, stats.homop, stats.maxpr, stats.sosvh, stats.savgh, stats.svarh, stats.senth, stats.dvarh, stats.denth, stats.inf1h, stats.inf2h, stats.indnc, stats.idmnc);
    length = size(C);
    length = length(2);
    for j=1:length
        D(i,j)=C(1,j);
    end
end
csvwrite('GLCMmodD.csv',D,0,0);
