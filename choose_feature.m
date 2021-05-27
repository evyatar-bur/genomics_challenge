function [min_error,ind] = choose_feature(features,train_data,train_labels,saved_indexes)
% This function recieves a matrix containing training data, optional 
% additional features and a vector containing labels, and returns the 
% index of the additional feature that gives the lowest error rate, and the error rate.

%% Spliting training data to 5 folds
data_valid = cell(1,5);
data_train = cell(1,5);

labels_valid = cell(1,5);
labels_train = cell(1,5);

features_train = cell(1,5);
features_valid = cell(1,5);

for i = 1:5
    
    rand_num_valid = randperm(size(train_data,1));
    
    data_valid{i} = train_data(rand_num_valid(1:round(size(train_data,1)*0.2)),:);
    data_train{i} = train_data(rand_num_valid(round(size(train_data,1)*0.2)+1:end),:);
    
    labels_valid{i} = train_labels(rand_num_valid(1:round(size(train_data,1)*0.2)));
    labels_train{i} = train_labels(rand_num_valid(round(size(train_data,1)*0.2)+1:end));    
    
    if ~isempty(features)
        
        features_valid{i} = features(rand_num_valid(1:round(size(train_data,1)*0.2)),:);
        features_train{i} = features(rand_num_valid(round(size(train_data,1)*0.2)+1:end),:);
        
    end
end

%% Finding optional additional feature

% Iterating all features and creating models to find the best feature

model = @(learn_data,learn_labels,valid_data,valid_labels)sum(predict(fitcsvm(learn_data,learn_labels,'KernelFunction','linear'),valid_data)~=valid_labels);

% Preallocating error rate vector
Error_rate_vec = ones(5,119)*100;

for valid_ind = 1:5
    for feature = 1:119
        
        if ~ismember(feature,saved_indexes)
    
            X_train = data_train{valid_ind}(:,feature);
            Y_train = labels_train{valid_ind};
        
            X_valid = data_valid{valid_ind}(:,feature);
            Y_valid = labels_valid{valid_ind};
        
            % Concatenate current feature with optional feature
            X_train = cat(2,features_train{valid_ind},X_train);
            X_valid = cat(2,features_valid{valid_ind},X_valid);
        
            P = model(X_train,Y_train,X_valid,Y_valid);
            Error_rate = (P/length(Y_valid))*100 ;

            Error_rate_vec(valid_ind,feature) = Error_rate; 
        
        end
    end
end

% Finding the minimum error and the feature used to get it
[min_error,ind] = min(mean(Error_rate_vec));


end

