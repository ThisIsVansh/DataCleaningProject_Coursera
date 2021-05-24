# Getting and Cleaning Data Project John Hopkins Coursera
# Author: Vansh Jain

# Loading the necessary packages
library("data.table")

# Merging the data into one dataset

## Downloading the files

### Defining the path
path <- getwd()

### Downloading the data
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
download.file(URL, file.path(path, "dataFiles.zip"))

### Unzipping the folder
unzip(zipfile = "dataFiles.zip", exdir = "./data")

## Reading the datasets

### Reading the training datasets
xTrain <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subjectTrain <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

### Reading the testing datasets
xTest <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subjectTest <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

### Reading the feature dataset
featuresData <- read.table('./data/UCI HAR Dataset/features.txt')

### Reading activity labels dataset
activityLabelsData <- read.table('./data/UCI HAR Dataset/activity_labels.txt')

## Assigning column names
colnames(xTrain) <- featuresData[,2]
colnames(xTest) <- featuresData[,2]

colnames(yTrain) <- "ActivityID"
colnames(yTest) <- "ActivityID"

colnames(subjectTrain) <- "SubjectID"
colnames(subjectTest) <- "SubjectID"

colnames(activityLabelsData) <- c("ActivityID", "ActivityType")

## Merging Datasets
train <- cbind(yTrain, subjectTrain, xTrain)
test <- cbind(yTest, subjectTest, xTest)
dataSet <- rbind(train, test)

# Extracting the measurements on the mean and standard deviation for each measurement

## Extracting column names
columnNames <- colnames(dataSet)

## Defining ID, mean and standard deviation
meanAndStandardDeviation <- (grepl("ActivityID", columnNames) |
                               grepl("SubjectID", columnNames) |
                               grepl("Mean", columnNames) |
                               grepl("StandardDeviation", columnNames))

## Subsetting the dataset
setForStats <- dataSet[, meanAndStandardDeviation == TRUE]

# Name the activities using descriptive names
dataSet <- merge(setForStats, activityLabelsData,
                 by = 'ActivityID',
                 all.x = TRUE)

# Making and Storing Tidy DataSet

## Creating the Tidy Data Set
tidyData <- aggregate(. ~SubjectID + ActivityID, dataSet, mean)
tidyData <- tidyData[order(tidyData$SubjectID, tidyData$ActivityID), ]

## Storing the tidy data set
write.table(tidyData, "TidyDataSet.txt", row.name = FALSE)
