clear all;
close all;

k=2;

pred_filename=sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/cross_vali_pred/predictions%01d_C70',k);

prediction=load(pred_filename);

[N,d]=size(prediction);

processed_pred_filename=sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/processed_pred/processed_pred_%01d_C70',k);

single_processed_pred_filename=sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/processed_pred/single_processed_pred_%01d_C70',k);

gt_label_name=sprintf('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/cv_soccer_data/cross_vali_test_data/all_test_label_%01d_10.txt',k);

gt_label=load(gt_label_name);

[N1,d1]=size(gt_label);

selected_gt_cam=gt_label(:,1);

for i=1:N/3
    test_label(i,1)=prediction((i-1)*3+1);
    test_label(i,2)=prediction((i-1)*3+2);
    test_label(i,3)=prediction((i-1)*3+3);
end



    
fileID = fopen(processed_pred_filename,'w');    
for i=1:N/3
    test_rank(i,:)=floor(tiedrank(test_label(i,:)));
    fprintf(fileID, '%d %d %d\n', test_rank(i,1), test_rank(i,2), test_rank(i,3));
end

fclose(fileID); 

for i=1:N/3
    for j=1:3
        if test_rank(i,j)==3
            selected_camera(i)=j;
        end
    end
end


fileID1 = fopen(single_processed_pred_filename,'w'); 
for i=1:N/3
    fprintf(fileID1, '%d', test_rank(i,1));
end

selected_pred_cam=test_rank(:,1);
count=0;
for i=1:N1
    if(selected_pred_cam(i)==selected_gt_cam(i))
        count=count+1;
    end
end

correct_percentage=count/N1


