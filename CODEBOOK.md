# Codebook

# Data

The data was download from: ![Data Link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

# Variables

1. ```URL``` is a link to download the data from
2. ```path``` stores the local path to workspace for easier access to the files
3. ```xTrain``` ```yTrain``` ```subjectTrain``` contain the training data.
4. ```xTest``` ```yTest``` ```subjectTest``` contain the test data.
5. ```featuresData``` contains the features data
6. ```activityLabelsData``` contains the activity label data
7. ```train``` is a dataset made by merging all training datasets
8. ```test``` is a dataset made by merging all testing datasets
9. ```dataSet``` is a dataset made by merging ```train``` ```test```. It has even the updated descriptive names for the activities.
10. ```columnNames``` contains the column names of ```dataSet```
11. ```meanAndStandardDeviation``` defines vectors for mean and standard deviation
12. ```setForStats``` is a subset of ```dataset```
13. ```tidyData``` contains the tidy cleaned data