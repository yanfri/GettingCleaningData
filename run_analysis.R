#R script for course project (Getting and Cleaning Dat @ Coursera.org)
setwd("./Sciences/Courses/GettingCleaningData/Project/")

#downloads data sets into data folder
if (!file.exists("data")){
     dir.create("data")
}

dataURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataURL, destfile = "./data/smartwear.zip")
downloadDate <- date()

#unzips downloaded file
gzfile("./data/smartwear.zip")
unzip("./data/smartwear.zip", unzip = getOption("unzip"))
ls("smartwear.zip")

#unzip does not work for me => unzipped manually
#into data folder './data/UCI HAR Dataset/'
#set path of training and test sets
testfile <- "./data/UCI HAR Dataset/test/X_test.txt"
trainfile <- "./data/UCI HAR Dataset/train/X_train.txt"

#reads the data sets into variables 'testdata' and 'traindata'
testdata <- read.table(testfile)
traindata <- read.table(trainfile)

#checks dimensions of training and test sets
dim(testdata)
dim(traindata)

#writes merged 'dataset' into dataset.txt file
write.table(dataset, file = "dataset.txt", row.names = FALSE)

checkdataset <- read.table("./data/")
#merges training and test sets into 'dataset'
dataset <- rbind(traindata, testdata)

#checks dimension of 'dataset':
dim(dataset)
#checks that dimensions of training and test sets add up to dimension of merged 'dataset'
dim(traindata)[1]+dim(testdata)[1]-dim(dataset)[1]

#reads labels
testlabelsfile <- "./data/UCI HAR Dataset/test/y_test.txt"
trainlabelsfile <- "./data/UCI HAR Dataset/train/y_train.txt"

testlabels <- read.table(testlabelsfile)
trainlabels <- read.table(trainlabelsfile)

#reads features
featuresfile <- "./data/UCI HAR Dataset/features.txt"
features <- read.table(featuresfile)
features <- features[,2]

#select measures/features containing mean 
meanselect <- grepl("mean()", features, ignore.case = T, fixed = T)
stdselect <- grepl("std()", features, ignore.case = T, fixed = T)


meanstdSelect <- as.logical(meanselect+stdselect)

featuresSelect <- features[as.logical(meanstdSelect)]

meanstdSelectDataset <- dataset[, meanstdSelect]



