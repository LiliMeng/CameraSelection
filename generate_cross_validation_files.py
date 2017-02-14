# -*- coding: utf-8 -*-
"""
Created on Thu Feb  9 18:05:14 2017

@author: jimmy

camera selection cross validation

"""

import numpy as np

# read feature labels
feature_file = 'data/c3d_camera1.txt'
label_file   = 'data/camera1_label.txt'
save_folder = 'camera1/'
fold = 10


def saveFnFeature(fnFeature, file_name):
    f = open(file_name, 'w')
    f.write('%d\t %d\n' % fnFeature.shape)

    (N, M) = fnFeature.shape
    for i in range(0, N):
        f.write('%d ' % fnFeature[i, 0])
        for j in range(1, M):
            f.write('%f ' % fnFeature[i, j])
        f.write('\n')
    f.close()
    print 'fn_feature shape', (N, M)
    print 'save_name', file_name
    
fn_features = np.loadtxt(feature_file, skiprows = 1)
fn_labels = np.loadtxt(label_file, skiprows = 1)

assert(fn_features.shape[0] == fn_labels.shape[0])

rows = fn_features.shape[0]
avg_fold = rows/fold
for i in range(fold):
    train_index = [x for x in range(rows) if x/avg_fold != i]
    cv_index    = [x for x in range(rows) if x/avg_fold == i]    
    
    # split training and cross validation data
    train_x = fn_features[train_index,:]
    train_y = fn_labels[train_index,:]
    cv_x = fn_features[cv_index,:]
    cv_y = fn_labels[cv_index,:]
    
    # save data
    saveFnFeature(train_x, save_folder + 'train_x' + '_' + str(i) + '_' + str(fold) + '.txt')
    saveFnFeature(train_y, save_folder + 'train_y' + '_' + str(i) + '_' + str(fold) + '.txt')
    
    saveFnFeature(cv_x, save_folder + 'cv_x' + '_' + str(i) + '_' + str(fold) + '.txt')
    saveFnFeature(cv_y, save_folder + 'cv_y' + '_' + str(i) + '_' + str(fold) + '.txt')
    
     
    

    
    
    


