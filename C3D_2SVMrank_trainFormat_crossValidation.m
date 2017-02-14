clear all;
close all;

k=9

train_feature_cam1_name = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera1/train_x_%01d_10.txt',k);
train_feature_cam2_name = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera2/train_x_%01d_10.txt',k);
train_feature_cam3_name = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera3/train_x_%01d_10.txt',k);

train_label_cam1_name   = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera1/train_y_%01d_10.txt',k);
train_label_cam2_name   = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera2/train_y_%01d_10.txt',k);
train_label_cam3_name   = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/camera3/train_y_%01d_10.txt',k);

all_train_data_name = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/all_train_data_%01d_10.txt',k);
all_train_label_name = sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/all_train_label_%01d_10.txt',k);

train_feature1 = dlmread(train_feature_cam1_name,'',1);
train_feature2 = dlmread(train_feature_cam2_name,'',1);
train_feature3 = dlmread(train_feature_cam3_name,'',1);

camera_label1 = dlmread(train_label_cam1_name,'',1);
camera_label2 = dlmread(train_label_cam1_name,'',1);
camera_label3 = dlmread(train_label_cam1_name,'',1);

label1=camera_label1(:,2);
label2=camera_label2(:,2);
label3=camera_label3(:,2);

new_label=[label1, label2, label3];



[N1,d1]=size(train_feature1);



fileID1 = fopen(all_train_label_name,'w');    
for i=1:N1
    new_rank(i,:)=floor(tiedrank(new_label(i,:)));
    fprintf(fileID1,'%d  %d  %d\n', new_rank(i,1), new_rank(i,2), new_rank(i,3));
end
fclose(fileID1);


if 1
    
fileID = fopen(all_train_data_name,'w');
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
