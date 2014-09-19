Getting and Cleaning Data course project
========================================

**CODE BOOK**
=============

Listing of the different data processing steps:

1. The raw data set was dowloaded from the [referenced website](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) with R using the `download.file()` function
2. The dowloaded zip file was extracted manually into folder "./data/UCI HAR Dataset/"
3. The training and test sets were read into variables `trainset` and `testset` using the `read.table()` function
4. Dimensions of `trainset` and `testset` were checked: 7352 rows x 561 cols and 2947 rows x 561 cols
5. `trainset` and `testset` were merged into `dataset` (dimensions of merged `dataset` was checked to correspond to sum of both separate training and test sets: 10299 rows x 561 cols)
6. `dataset` was written into 'dataset.txt' file



