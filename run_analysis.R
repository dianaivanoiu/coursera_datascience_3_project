## download and unzip dataset
dataset <- "UCI_HAR_Dataset.zip"
if(!file.exists(dataset)){
     url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
     download.file(url, dataset, method="curl")
}
if(!file.exists("UCI HAR Dataset")){
     unzip(dataset)
}

## load required packages
library(dplyr)

## 1. merges the training and test data sets to create on data set 
col_names <- read.table("./UCI HAR Dataset/features.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, col.names = "subject")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names = col_names[,2])
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = as.factor(c("activity"))) 

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, col.names = "subject")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names = col_names[,2])
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = as.factor(c("activity")))

test <- cbind(subject_test, y_test, X_test)
train <- cbind(subject_train, y_train, X_train)
full_dataset <- rbind(test,train)

## 2. extracts only the measurements on the mean and standard deviation for each measurement
mean_std <- select(full_dataset, subject, activity, contains("mean"),contains("std"))

## 3. uses descriptive activity names to name the activities in the data set
activities <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, col.names = c("activity", "activity_description"))
mean_std <- merge(mean_std, activities, by="activity")
mean_std$activity_description <- as.factor(mean_std$activity_description)
mean_std <- select(mean_std, subject, activity_description, activity, everything())

## 4. appropriately labels the data set with descriptive variable names 
names(mean_std) <- tolower(names(mean_std))
names(mean_std) <- gsub("^t", "time", names(mean_std))
names(mean_std) <- gsub("^f", "frequency", names(mean_std))
names(mean_std) <-gsub("acc", "_accelerometer", names(mean_std))
names(mean_std) <-gsub("gyro", "_gyroscope", names(mean_std))
names(mean_std) <-gsub("mag", "_magnitude", names(mean_std))
names(mean_std) <- gsub("body", "_body", names(mean_std))
names(mean_std) <-gsub("_body_body", "_body", names(mean_std))
names(mean_std) <- gsub("jerk", "_jerk", names(mean_std))
names(mean_std) <- gsub("mean", "_mean", names(mean_std))
names(mean_std) <- gsub("gravity", "_gravity", names(mean_std))
names(mean_std) <- gsub("std", "_std", names(mean_std))
names(mean_std) <- gsub("\\.$", "", names(mean_std))
names(mean_std) <- gsub("\\.\\.\\.", "-", names(mean_std))
names(mean_std) <- gsub("\\.", "", names(mean_std))

## 5. from the data set in step 4, creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject 
tidy <- group_by(mean_std, activity_description, subject) %>% summarise_all(mean)
write.table(tidy, file = "tidy.txt")


