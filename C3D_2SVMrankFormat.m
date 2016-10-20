clear all;
close all;

camera_label1=load('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera1/camera1_trainY.txt');
camera_label2=load('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera2/camera2_trainLabel.txt');
camera_label3=load('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera3/camera3_trainLabel.txt');

label1=camera_label1(:,2);
label2=camera_label2(:,2);
label3=camera_label3(:,2);

new_label=[label1, label2, label3];


train_feature1=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera1/camera1_trainX.txt','',1);
train_feature2=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera2/camera2_trainFeature.txt','',1);
train_feature3=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera3/camera3_trainFeature.txt','',1);

[N1,d1]=size(train_feature1);

fileID1 = fopen('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/train_rank.txt','w');    
for i=1:N1
    new_rank(i,:)=floor(tiedrank(new_label(i,:)));
end



if 0
fileID = fopen('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/all_train_features.txt','w');
for i=1:N1
    i
    new_rank(i,:)=floor(tiedrank(new_label(i,:)));
    fprintf(fileID, '# query %d \n', train_feature1(i,1));
    fprintf(fileID, '%d  qid:%d  ', new_rank(i,1), train_feature1(i,1));
    for j1=1:d1
        if j1>1
            fprintf(fileID, '%d:%f  ',j1-1, train_feature1(i,j1));
        end
    end  
    fprintf(fileID,'\n');
    fprintf(fileID, '%d  qid:%d  ', new_rank(i,2), train_feature2(i,1));
    for j2=1:d1
        if j2>1
            fprintf(fileID, '%d:%f  ',j2-1, train_feature2(i,j2));
        end
    end
    fprintf(fileID,'\n');
    fprintf(fileID, '%d  qid:%d  ', new_rank(i,3),  train_feature3(i,1));
    for j3=1:d1
        if j3>1
            fprintf(fileID, '%d:%f  ',j3-1, train_feature3(i,j3));
        end
    end
    fprintf(fileID,'\n');
end

fclose(fileID); 
end
