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
testpath <- "./data/UCI HAR Dataset/test/X_test.txt"
trainpath <- "./data/UCI HAR Dataset/train/X_train.txt"

#reads the data sets into variables 'testdata' and 'traindata'
testdata <- read.table(testpath)
traindata <- read.table(trainpath)

#check dimensions of training and test sets
dim(testdata)
dim(traindata)

#write merged 'dataset' into dataset.txt file
write.table(dataset, file = "dataset.txt", row.names = FALSE)

checkdataset <- read.table("./data/")
#merge training and test sets into 'dataset'
dataset <- rbind(traindata, testdata)

#check dimension of 'dataset':
dim(dataset)
#check that dimensions of training and test sets add up to dimension of merged 'dataset'
dim(traindata)[1]+dim(testdata)[1]-dim(dataset)[1]






