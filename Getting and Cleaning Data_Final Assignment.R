# FINAL ASSIGNMENT #

setwd("C://Users/Mark/Desktop/Coursera/Data Science specialization/Getting and Cleaning Data_032816/")
if(!dir.exists("Final Assignment")){dir.create("Final Assignment")}
setwd("./Final Assignment")
# Downloaded data for assignmenet and put into new directory
# Data are available at - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# 1. Merges the training and the test sets to create one data set.
# Import train data
Subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt")
# Merge train Subject, activity, and outcome data
train <- cbind(Subject_train, Y_train, X_train)

# Import test data
Subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt")
# Merge test Subject, activity, and outcome data
test <- cbind(Subject_test, Y_test, X_test)

# Merge test and train data into a single data frame
alldata <- rbind(train,test)


# 4. Appropriately labels the data set with descriptive variable names.
# Read in the features key 
features <- read.table("UCI HAR Dataset/features.txt")
# Use the features key to translate values (1-561) into descriptive variables          
colnames(alldata) <- c("Subject", "Activity", as.character(features$V2))

# 3. Uses descriptive activity names to name the activities in the data set
# Read in the activity_labels key 
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
# Use the activity_labels key to translate values (1-6) into descriptive variables          
alldata[["Activity"]] <- activities[ match(alldata[['Activity']], activities[['V1']] ) , 'V2']


# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
alldata2 <- alldata[, c(1, 2, grep("mean()", colnames(alldata)), grep("std()", colnames(alldata)))]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Melt the data
library(reshape2)
alldataMelt <- melt(alldata2, id = c("Subject", "Activity"))
# Cast the data and calculate the mean of each variable by Subject and Activity
alldataCast <- dcast(alldataMelt, Subject + Activity ~ variable, mean)
alldataCast