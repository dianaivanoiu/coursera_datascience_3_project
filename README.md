# Coursera Data Science Specialization - Getting and Cleaning Data project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

## Review Criteria 

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.

## Instructions

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## dataset 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## run_analysis.R script

This script downloads and unzips the dataset locally, and follows the given instructions: it merges the training and test sets (1), extracts only the measurements regarding the mean and standard deviations of each measurement (2), it uses descriptive activity descriptions for the activities variable in the merged dataset (3), it also appropriately gives labels to the variable names in the dataset (4), and it outputs a new independent dataset called tidy.txt in your current directory that represents the average of each variable for each activity and each subject (5). 

## tidy.txt 

The output of the script run_analysis.R

## codebook.md 

A file describing the dataset and the workflow undertaken on this dataset in order to clean it. 



