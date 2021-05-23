clc
clear

% Read data from training set
gene_cell = readcell('TRAIN_set_data.xlsx');


%% Counting occurrnces of each mutation region

gene_map = containers.Map;

for i = 2:length(gene_cell(:,8))
    if isKey(gene_map,gene_cell{i,8})
        gene_map(gene_cell{i,8}) = gene_map(gene_cell{i,8})+1;
    else
        gene_map(gene_cell{i,8}) = 1;
    end
end

%% Creating histogram

bar(1:length(values(gene_map)),cell2mat(values(gene_map)))
    
xticks(1:16)
xticklabels(keys(gene_map))