clear all;
close all;


train_feature=dlmread('/home/lci/workspace/CVPR2017/ICME_features/ICME_train_feature.txt','',1);
train_label=dlmread('/home/lci/workspace/CVPR2017/ICME_features/ICME_train_label.txt','',1);
[N,d]=size(train_feature);


fileID = fopen('/home/lci/workspace/CVPR2017/ICME_features/processed_train_features.txt','w');

fileID1=fopen('/home/lci/workspace/CVPR2017/ICME_features/processed_train_labels.txt','w');
for i=1:N
      if train_label(i,2)==0
        fprintf(fileID1, '1   0   0 \n');
    elseif train_label(i,2)==1
        fprintf(fileID1, '0   1   0 \n');
    elseif train_label(i,2)==2
        fprintf(fileID1,  '0   0   1 \n');
    end
    for j=1:d
        if j>1
            fprintf(fileID, '%.6f  ',train_feature(i,j));
        end
    end
    fprintf(fileID, '\n');
end

fclose(fileID);
fclose(fileID1);


%processed_features=load('/home/lci/workspace/CVPR2017/ICME_features/processed_train_features.txt');

%[N1,d1]=size(processed_features)
