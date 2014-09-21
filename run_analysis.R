#This script does the following : 
# 1. Merges the train and test datasets to create one single dataset
# 2. Extracts only the mean and standard deviation for each measurement
# 3, Uses descriptive activity names to name the activities in the dataset
# 4. Appropriately labels the data set with descriptive variable names
# 5. Creates an independent dataset with an average of each variable for each
#    activity and each subject

require(data.table)
require(reshape2)

# Reading Test dataset from file(s)
dataTest <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
subjectsTest <- read.table("./UCI HAR Dataset/test/subject_test.txt",header = FALSE)
activityTest <- read.table("./UCI HAR Dataset/test/y_test.txt",header = FALSE)

# Reading Train dataset from file(S)
dataTrain <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
subjectsTrain <- read.table("./UCI HAR Dataset/train/subject_train.txt",header = FALSE)
activityTrain <- read.table("./UCI HAR Dataset/train/y_train.txt",header = FALSE)

#Reading the features list (data column names) from file
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

#Reading the activity labels (types of activities subjects did)
activityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")

#Extracting the required features (mean,std) from the data set
extractionFeatures <- grepl("mean|std",features)
names(dataTrain) <- features
dataTrain <- dataTrain[,extractionFeatures]

names(dataTest) <- features
dataTest <- dataTest[,extractionFeatures]

# Adding activity labels
activityTrain[,2] = activityLabels[activityTrain[,1]]
names(activityTrain) <- c("Activity_ID","Activity_Label")
names(subjectsTrain) <- "Subject"

activityTest[,2] = activityLabels[activityTest[,1]]
names(activityTest) <- c("Activity_ID","Activity_Label")
names(subjectsTest) <- "Subject"

# Binding/Merging Data
bindTest <- cbind(as.data.table(subjectsTest),activityTest,dataTest)
bindTrain <- cbind(as.data.table(subjectsTrain),activityTrain,dataTrain)
dataMerged <- rbind(bindTest,bindTrain)

#Melting the original dataset to create the desired tidy dataset
id_labels = c("subject", "Activity_ID", "Activity_Label")
data_labels = setdiff(colnames(data), id_labels)
melt_data = melt(data, id = id_labels, measure.vars = data_labels)

# Apply mean function to dataset using dcast function
tidy_data = dcast(melt_data, subject + Activity_Label ~ variable, mean)

# Writng the tidy dataset to file
write.table(tidy_data, file = "./tidy_data.txt",row.name = FALSE)