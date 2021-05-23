clc
clear

gene_table = readtable('TRAIN_set_features.xlsx');


%%
gene_cell = table2cell(gene_table);

train_data = cell2mat(gene_cell(:,3:end));

train_labels = cell2mat(gene_cell(:,2));

valid_data = train_data(1:100);

valid_labels = train_labels(1:100);

train_data = train_data(101:end);

train_labels = train_labels(101:end);

model = @(train_data,train_labels,valid_data,valid_labels)sum(predict(fitcsvm(train_data,train_labels,'KernelFunction','linear'),valid_data)~=valid_labels);

P = model(train_data,train_labels,valid_data,valid_labels);

%Error_rate =(sum(predict_label~=true_lable)/number_of_patients)*100: