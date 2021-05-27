%% Creating mutation location histogram
clc
clear

%% Counting occurrnces of each mutation region in train data

% Read data from training set
gene_cell = readcell('TRAIN_set_data.xlsx');

% Create mutataion map
gene_map = containers.Map;

for i = 2:length(gene_cell(:,8))
    if isKey(gene_map,gene_cell{i,8})
        gene_map(gene_cell{i,8}) = gene_map(gene_cell{i,8})+1;
    else
        gene_map(gene_cell{i,8}) = 1;
    end
end

%% Counting occurrnces of each mutation region in test data
% Read data from test set
gene_cell = readcell('TEST_set_data.xlsx');

for i = 2:length(gene_cell(:,7))
    if isKey(gene_map,gene_cell{i,7})
        gene_map(gene_cell{i,7}) = gene_map(gene_cell{i,7})+1;
    else
        gene_map(gene_cell{i,7}) = 1;
    end
end


%% Creating histogram

bar(1:length(values(gene_map)),cell2mat(values(gene_map)))
    
title('Mutation region histogram')
xlabel('Mutation region')
ylabel('Number of mutations')

xticks(1:16)
xticklabels(keys(gene_map));

set(gca,'TickLabelInterpreter','none','FontSize',8)
