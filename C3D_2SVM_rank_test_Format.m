clear all;
close all;

test_feature1=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera1/camera1_testX.txt','',1);
test_feature2=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera2/camera2_testFeature.txt','',1);
test_feature3=dlmread('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/camera3/camera3_testFeature.txt','',1);


[N1,d1]=size(test_feature1);

fileID = fopen('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/all_test_features.txt','w');

pseudo_rank=0;

for i=1:N1
    i
    fprintf(fileID, '# query %d \n', test_feature1(i,1));
    fprintf(fileID, '%d  qid:%d  ', pseudo_rank, test_feature1(i,1));
    for j1=1:d1
        if j1>1
            fprintf(fileID, '%d:%f  ',j1-1, test_feature1(i,j1));
        end
    end  
    fprintf(fileID,'\n');
    fprintf(fileID, '%d  qid:%d  ', pseudo_rank, test_feature2(i,1));
    for j2=1:d1
        if j2>1
            fprintf(fileID, '%d:%f  ',j2-1, test_feature2(i,j2));
        end
    end
    fprintf(fileID,'\n');
    fprintf(fileID, '%d  qid:%d  ', pseudo_rank,  test_feature3(i,1));
    for j3=1:d1
        if j3>1
            fprintf(fileID, '%d:%f  ',j3-1, test_feature3(i,j3));
        end
    end
    fprintf(fileID,'\n');
end
fclose(fileID); 
