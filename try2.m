clc
clear

% Read data from file 
gene_cell = readcell('TRAIN_set_features.xlsx');


%%




train_data = cell2mat(gene_cell(2:end,3:end));
train_labels = cell2mat(gene_cell(2:end,2));

data_valid = cell(1,5);
data_train = cell(1,5);

labels_valid = cell(1,5);
labels_train = cell(1,5);

for i = 1:5
    
    rand_num_valid = randperm(size(train_data,1));
    
    data_valid{i} = train_data(rand_num_valid(1:round(size(train_data,1)*0.2)),:);
    data_train{i} = train_data(rand_num_valid(round(size(train_data,1)*0.2)+1:end),:);
    
    labels_valid{i} = train_labels(rand_num_valid(1:round(size(train_data,1)*0.2)));
    labels_train{i} = train_labels(rand_num_valid(round(size(train_data,1)*0.2)+1:end));    
    
end
%%


model = @(learn_data,learn_labels,valid_data,valid_labels)sum(predict(fitcsvm(learn_data,learn_labels,'KernelFunction','linear'),valid_data)~=valid_labels);

Error_rate_vec = zeros(5,119);

for valid_ind = 1:5
    for feature = 1:119
    
        X_train = data_train{valid_ind}(:,feature);
        Y_train = labels_train{valid_ind};
        
        X_valid = data_valid{valid_ind}(:,feature);
        Y_valid = labels_valid{valid_ind};
        
        
        P = model(X_train,Y_train,X_valid,Y_valid);

        Error_rate = (P/length(Y_valid))*100 ;

        Error_rate_vec(valid_ind,feature) = Error_rate; 
    end
end


[min_error,ind] = min(mean(Error_rate_vec));
