%% Finding features for the model

clc
clear

% Reading training data from file 
gene_cell = readcell('TRAIN_set_features.xlsx');


train_data = cell2mat(gene_cell(2:end,3:end));
train_labels = cell2mat(gene_cell(2:end,2));

%% Finding first feature

% Find best first feature
[min_error,feature_ind] = choose_feature([],train_data,train_labels,[]);

% Keep data of the best feature, and its index
good_train_data = train_data(:,feature_ind);
saved_indexes = feature_ind;

min_error_vec = min_error;


