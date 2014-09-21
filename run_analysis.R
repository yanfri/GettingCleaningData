#R script for course project (Getting and Cleaning Dat @ Coursera.org)
setwd("./Sciences/Courses/GettingCleaningData/Project/")

#download data sets into data folder
if (!file.exists("data")){
     dir.create("data")
}

dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, destfile = "./data/smartwear.zip")
downloadDate <- date()

#unzip downloaded file
#gzfile("./data/smartwear.zip")
#unzip("./data/smartwear.zip", unzip = getOption("unzip"))
#ls("smartwear.zip")

#unzip does not work for me => unzipped manually into data folder './data/UCI HAR Dataset/'

#set path of training and test sets
trainfile <- "./data/UCI HAR Dataset/train/X_train.txt"
testfile <- "./data/UCI HAR Dataset/test/X_test.txt"

#read the data sets into variables 'testdata' and 'traindata'
traindata <- read.table(trainfile)
testdata <- read.table(testfile)

#check dimensions of training and test sets (for merging purpose)
dim(traindata)
dim(testdata)

#merge training and test sets into 'dataset'
dataset <- rbind(traindata, testdata)

#check dimension of 'dataset':
dim(dataset)
#check that dimensions of training and test sets add up to dimension of merged 'dataset' / formula should equal 0
dim(traindata)[1]+dim(testdata)[1]-dim(dataset)[1]

#read features
featuresfile <- "./data/UCI HAR Dataset/features.txt"
features <- read.table(featuresfile)
features <- features[,2]

#select measures/features containing mean()
meanselect <- grepl("mean()", features, ignore.case = T, fixed = T)

#select measures/features containing standard deviation (std()) 
stdselect <- grepl("std()", features, ignore.case = T, fixed = T)

#select columns of dataset containing mean or std
meanstdSelect <- as.logical(meanselect+stdselect)

meanstdSelectDataset <- dataset[, meanstdSelect]

#select column labels (measuring mean or SD features) from the list of features
columnLabels <- features[meanstdSelect]

#increase information contained in labels
colLab <- sub("tB", "timeSignal-B", columnLabels)
colLab <- sub("tG", "timeSignal-G", colLab)
colLab <- sub("fB", "frequencySignal-B", colLab)
colLab <- sub("BodyAccJerk", "Jerk-", colLab)
colLab <- sub("BodyAcc", "BodyAcceleration-", colLab)
colLab <- sub("BodyGyro", "BodyAngularVelocity-", colLab)
colLab <- sub("GravityAcc", "GravityAcceleration", colLab)
colLab <- sub("Mag", "Magnitude", colLab)
colLab <- gsub("mean", "Average", colLab)
colLab <- gsub("std", "StandardDeviation", colLab)
colLab <- sub("\\()", "", colLab)
colLab <- sub("--", "-", colLab)
colLab <- sub("-X", "-in_X_direction", colLab)
colLab <- sub("-Y", "-in_Y_direction", colLab)
colLab <- sub("-Z", "-in_Z_direction", colLab)

#assign new labels in 'colLab' to column names of the selected data set
colnames(meanstdSelectDataset) <- colLab

#read subject ID's from 'subject_train/test.txt' into vectors which are then combined into 'subjects'
trainSubjects  <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
testSubjects <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
subjects <- rbind(trainSubjects, testSubjects)

#read activity ID's from 'Y_train/test.txt' files into vectors which are then combined into 'activities'
trainActivity <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
testActivity <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
activities <- rbind(trainActivity, testActivity)

#add subject ID's and activity to individual measures
meanstdSelectDataset$subjects <- subjects
meanstdSelectDataset$activity <- activities

#apply subsetting to measures according to subject ID and activity
library(plyr)
data <- arrange(meanstdSelectDataset, subjects, activity)
group <- paste("Subject", data[, "subjects"], "-Activity", data[,"activity"], sep = "")
data <- cbind(group, data)

#writes tidy 'dataset' into dataset.txt file
write.table(tidydataset, file = "dataset.txt", row.names = FALSE)
