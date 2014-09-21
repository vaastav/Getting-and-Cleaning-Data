CodeBook
=========================

Data Source
=========================
The source of the dataset is http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection
=========================
This is a brief gist of how the data was measured and what it represents from the original source.
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person
performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 
3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been
video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body 
acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore 
a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating 
variables from the time and frequency domain.

Check the README.txt file of the dataset for further details about this dataset. 

Derived Dataset
==================
 for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:
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
    fBodyAccMag
    fBodyAccJerkMag
    fBodyGyroMag
    fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are:

    mean(): Mean value
    std(): Standard deviation

Transformation
=================

The first step in the script is to load the data into tables using read.table() from the data.table package. After the
datasets have been loaded, the activity labels and the features are read from the respective files.
The second step involves extraction of mean and standard deviation for further processing. Then the column names of
the Activity tables and Subjects tables are set. 
Third Step involves combining the whole Test dataset using cbind and Train dataset using cbind.
Fourth Step is the merging of the datasets Test and Train using rbind.
Fifth step involves melting and casting the datset with avergae values for each subject for every variable.
The last step is writing it to the file tidy_data.txt
