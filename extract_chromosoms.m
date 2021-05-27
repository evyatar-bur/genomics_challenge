%% Testing model
clc
clear

%% Loading train data

% Reading training data from file 
train_gene_cell = readcell('TRAIN_set_data.xlsx');

patiant_cell = cell(845,2);
counter = 2;

for i = 2:length(train_gene_cell(:,2))
    
    chrom_str = train_gene_cell{i,4}(4:end);
    
    if chrom_str == 'X'
        chrom_str = '23'; 
    end
    
    if all(strcmp(patiant_cell{counter-1,1},train_gene_cell{i,2}))
        
        chrom_vec = patiant_cell{counter-1,2};
        
        chrom_vec(str2double(chrom_str)) = chrom_vec(str2double(chrom_str)) + 1;
        
        patiant_cell{counter-1,2} = chrom_vec;
        
    else
        
        chrom_vec = zeros(1,23);
        chrom_vec(str2double(chrom_str)) = 1;
        
        patiant_cell{counter,1} = train_gene_cell{i,2};
        patiant_cell{counter,2} = chrom_vec;
        
        counter = counter + 1;
    end
end

chrom_features = cell2mat(patiant_cell(:,2));

clearvars -except chrom_features

save('chrom_features.mat','chrom_features')
