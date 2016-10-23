clear all;
close all;


feature=dlmread('/home/lci/workspace/CVPR2017/ICME_features/ICME_test_feature.txt','',1);
label=dlmread('/home/lci/workspace/CVPR2017/ICME_features/ICME_test_label.txt','',1);
[N,d]=size(feature);


fileID = fopen('/home/lci/workspace/CVPR2017/ICME_features/processed_test_features.txt','w');

fileID1=fopen('/home/lci/workspace/CVPR2017/ICME_features/processed_test_labels.txt','w');
for i=1:N
    if label(i,2)==0
        fprintf(fileID1, '1   0   0 \n');
    elseif label(i,2)==1
        fprintf(fileID1, '0   1   0 \n');
    elseif label(i,2)==2
        fprintf(fileID1,  '0   0   1 \n');
    end
    for j=1:d
        if j>1
            fprintf(fileID, '%.6f  ',feature(i,j));
        end
    end
    fprintf(fileID, '\n');
end

fclose(fileID);
fclose(fileID1);
