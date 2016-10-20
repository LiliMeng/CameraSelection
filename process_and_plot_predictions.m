close all;
clear all;

prediction=load('/home/lci/workspace/CVPR2017/svm_rank/featureC3D/predictionsC50')

[N,d]=size(prediction);

for i=1:N/3
    test_label(i,1)=prediction((i-1)*3+1);
    test_label(i,2)=prediction((i-1)*3+2);
    test_label(i,3)=prediction((i-1)*3+3);
end



    
fileID = fopen('/home/lci/workspace/CVPR2017/rankSVM_refined_c3d/test_rankC50.txt','w');    
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

plot(selected_camera)
    
