Getting-and-Cleaning-Data
=========================

Introduction 
=========================
 This repository contains the course project for the Coursera course Getting and Cleaning Data, 
 which is the 3rd course in the Data Science Specialization offered by the John Hopkins University.
 
The Raw Data
=========================
 There were basically 2 folders - test and train which contained 3 major files.
 First was the X_train.txt or the X_test.txt file which contained the measurements of the features.
 Second was the y_test.txt or y_train.txt file which had the activity labels
 Third was the subject_test.txt or subject_train.txt which had the test subjects.
 
The Script
=========================
 run_analysis.R merges the train and test datasets together, extracts only the measurements on the mean and 
 standard deviation for each measurement, uses descriptive activity names to name the activities in the data set,
 appropriately labels the data set with descriptive variable names and thus creates and independent,tidy dataset
 with the average of each variable for each activity and each subject.
 
 Prerequisites for the script to run are :
 1. UCI HAR Dataset must have been extracted
 2. It should be stored in the current working directory with the folder name UCI HAR Dataset
 
The Code Book
=========================
 It explains the transformations performed and the resukting data and variables.
