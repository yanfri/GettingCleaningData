Getting and Cleaning Data course project
========================================

**CODE BOOK**
=============

The original data set was generated in an experiment on human activity recognition using smartphones (see below).
The data set has been transformed according to the instructions given for the course project of the course on _Gettting and Cleaning Data_ at [Coursera](https://class.coursera.org/getdata-007/human_grading/view/courses/972585/assessments/3/submissions). The R script has to perform the following tasks:
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

The raw data zipped file has been extracted and saved in the working directory as a separate data folder:
`./data/UCI HAR Dataset`.

Listing of the different data processing steps:
-----------------------------------------------

1. The raw data set was dowloaded from the [referenced website](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) with R using the `download.file()` function
2. The dowloaded zip file was extracted manually into folder "./data/UCI HAR Dataset/"
3. The training and test sets were read into variables `trainset` and `testset` using the `read.table()` function
4. Dimensions of `trainset` and `testset` were checked to ensure that merging both data set was possible: 7352 rows x 561 cols and 2947 rows x 561 cols
5. `trainset` and `testset` were merged into `dataset` (dimensions of merged `dataset` was checked to correspond to sum of both separate training and test sets: 10299 rows x 561 cols)
6. Column labels were read from the file `./data/UCI HAR Dataset/features.txt` and the columns labele with either `mean()` or `std()` were identified a logical vector for selecting these columns was created
7. The columns of `dataset` containing either `mean()` or `std()` were selected using the logical vector created in previous step
8. Column labels were extracted from the features (found in the features.txt file) using the same logical vector created in step 6 and the abbreviations used in to label the variables/features were extended by using the function `sub()` and saved into a label vector `colLab`
9. The label vector `colLab` was then assigned to the column names of the data set containing only measures with regard to mean or standard deviation
10. Subject ID's of individual measures were read from 'subject_train/test.txt' into vectors and then merged into 'subjects'
11. Activity codes of individual measures were read from 'Y_train/test.txt' files into vectors and then merged into 'activities'
12. 


`dataset` was written into 'dataset.txt' file


Taken from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Human Activity Recognition Using Smartphones Data Set**
--------------------------------------------------------------
Download: Data Folder, Data Set Description

**Abstract**: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
     
### Source:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Universit√  degli Studi di Genova, Genoa I-16145, Italy.
activityrecognition '@' smartlab.ws
www.smartlab.ws

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

### Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING UPSTAIRS, WALKINGDOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


### Attribute Information:

For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 


Variables
=========

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ  
tGravityAcc-XYZ  
tBodyAccJerk-XYZ  
tBodyGyro-XYZ  
tBodyGyroJerk-XYZ  
tBodyAccMag  
tGravityAccMag  
tBodyAccJerkMag  
tBodyGyroMag  
tBodyGyroJerkMag  
fBodyAcc-XYZ  
fBodyAccJerk-XYZ  
fBodyGyro-XYZ  

The set of variables that were estimated from these signals are: 

mean(): Mean value  
std(): Standard deviation  


