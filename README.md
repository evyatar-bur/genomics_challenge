# genomics_challenge README file

 In this code project we use a labeled data set of mutations given to us, 
 and try to train a model that will successfully classify between two types of cancer (LGG and UCEC).
 
 This README file will contain an explanation of each code that this project contains, and how to use it:
 
 1) test_prediction.m:
 
    This code uses the features we have chosen from the training data set and the given labels,
    and creates a model that is used to predict the labels of the test group using the features from the test dataset.
    
    When running this code, the prediction given by the model will be saved to the variable - 'Test_Prediction'
      
      
 2) feature_extraction.m:
 
    This code iterates over the different possible features given to us (and the features we extracted),
    and returns the indexes of the best features, that gave the minimal error rate, and the error rates
    that we got using those features.
    
    We used this code in order to see what is the minimal error rate we are able to achieve, 
    and we chose the first six features we got, because we saw that after adding more features
    the error rate did not drop.
    
    ### WARNING ###
    
    Running this code will take a lot of time to run, and therefore we recommend not to do so!!!
    
    
3) choose_feature.m:

    This code is a function used in feature_extraction.m code, that computes the best feature to add to a
    given set of features in order to get the minimal error rate, and returns the index of that feature and 
    the error rate we achieved using it with the given feature set.


4) extract_chromosoms.m:

    This code uses the file 'TRAIN_set_data.xlsx', and computes the number of mutations each patient has
    in each chromosome, to be used as 23 different features. This data is exported to the file 'chrom_features.mat'.
    
    Eventually, when choosing the best features we realized that these features do not preduce the best results,
    and therefore we did not use them when predicting the test labels.
    
    
5) mutation_histogram.m:

    This code loads data from the files 'TRAIN_set_data.xlsx' and 'TEST_set_data.xlsx', and using a dictionary, 
    counts the number of mutations in each region, and finally creates a histogram of the mutation locations.
    
    

 