%% Finding features for the model

clc
clear

% Reading training data from file 
gene_cell = readcell('TRAIN_set_features.xlsx');

load('chrom_features.mat')

train_data = cell2mat(gene_cell(2:end,3:end));
train_data = cat(2,train_data,chrom_features);

train_labels = cell2mat(gene_cell(2:end,2));

%% Finding first feature

% Find best first feature
[min_error,feature_ind] = choose_feature([],train_data,train_labels,[]);


% Keep data of the best feature, and its index
good_train_data = train_data(:,feature_ind);
saved_indexes = feature_ind;

min_error_vec = min_error;


%% Finding more features
for i = 1:6
    
    % Find best features
    [min_error,feature_ind] = choose_feature(good_train_data,train_data,train_labels,saved_indexes);

    % Updating the best features, and its indexes
    good_train_data = cat(2,good_train_data,train_data(:,feature_ind));
    saved_indexes(end+1) = feature_ind;
    
    % Keeping minimum error vector
    min_error_vec(end+1) = min_error;
    
end