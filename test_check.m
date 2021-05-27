%% Testing model
clc
clear

%% Loading test data
% Reading test data from file 
test_gene_cell = readcell('TEST_set_features.xlsx');
test_data = cell2mat(test_gene_cell(2:end,2:end));

% Extracting best features
test_data = test_data(:,[10,8,3,108,11,62]);

%% Loading train data

% Reading training data from file 
train_gene_cell = readcell('TRAIN_set_features.xlsx');


train_data = cell2mat(train_gene_cell(2:end,3:end));
train_labels = cell2mat(train_gene_cell(2:end,2));

% Extracting best features
train_data = train_data(:,[10,8,3,108,11,62]);

%% Using model to predict test labels

model = @(learn_data,learn_labels,test_data)predict(fitcsvm(learn_data,learn_labels,'KernelFunction','linear'),test_data);

test_prediction = model(train_data,train_labels,test_data);



