# Codebook for tidy.txt output of run_analysis.R script 

This codebook briefly explains the dataset tidy.txt 

## Study description 

A full description of the dataset is found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Quoted from the link above:** 

- This is data collected from the accelerometers of the Samsung Galaxy S smartphone. 
- The experiment has been carried out on 30 volunteers aged 19-48 years old.
- Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II on their waist.
- Using its embedded accelerometer and gyroscope, the 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. 
- The experiments have been video-recorded to label the data manually. 
- The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
- The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 
2.56 sec and 50% overlap (128 readings/window).
- The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
- The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
- From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Dataset description

The dataset is found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

By running the script run_analysis.R the dataset is downloaded and unzipped in the current working directorty. 
The dataset is called "UCI HAR Dataset" and contains the following files: 

'README.txt' - info about the dataset\
'activity_labels.txt' - table that includes the activity descriptions for the activity vector in y_test.txt and y_train.txt\
'features_info.txt' - info about the variable names found in the features.txt\
'features.txt' - list of all features (measurements undertaken)\
'test/subject_test.txt' - vector representing the id of the volunteer who performed the activity in the test set\
'test/X_test.txt' - the values in the test dataset for all the features\
'test/y_test.txt' - a vector of the ids of the activities corresponding to each measurement in the test dataset\
'train/subject_train.txt' - vector representing the id of the volunteer who performed the activity in the train set\
'train/X_train.txt' - the values in the train dataset for all the features\
'train/y_train.txt' - a vector of the ids of the activities corresponding to each measurement in the train dataset

- the test and train directories also each contain a directory 'Initial Signals'

## Transformations 

This is a description of the transformations undertaken on the dataset in the run_analysis.R script 
base R and the dplyr package are used

1. One full dataset is created by merging together the data in the test and train directories: 
subject (subject_test and subject_train), activity (y_test and y_train) and measured features (X_test and X_train).

2. A new dataset called mean_std was created by selecting only the information regarding to the subject, activity and the mean and standard deviation measurements.

3. A dataframe of the activity_labels.txt was created in order to merge it with the mean_std obtained at 1. so that all the activities performed in the mean_std data frame have a description.

4. The variable names for the measurements in the mean_std data frame are given by the features.txt vector. 
These are further given more descriptive, consistent and readable names by keeping everything lower case and by substituting certain abbreviations for the full names. 

5. A new dataframe called tidy is produced by only taking the average for each measurement(feature) grouped by subject id and activity type. This is further written to a .txt file called tidy.txt

## Description of tidy.txt dataset 

variables:

1 activity_description - the activity description\
2 subject - the volunteer id who performed the activity\
3 activity - the activity id of the corresponding activity description\
4 time_body_accelerometer_mean-x\
5 time_body_accelerometer_mean-y\
6 time_body_accelerometer_mean-z\
7 time_gravity_accelerometer_mean-x\
8 time_gravity_accelerometer_mean-y\
9 time_gravity_accelerometer_mean-z\
10 time_body_accelerometer_jerk_mean-x\
11 time_body_accelerometer_jerk_mean-y\
12 time_body_accelerometer_jerk_mean-z\
13 time_body_gyroscope_mean-x\
14 time_body_gyroscope_mean-y\
15 time_body_gyroscope_mean-z\
16 time_body_gyroscope_jerk_mean-x\
17 time_body_gyroscope_jerk_mean-y\
18 time_body_gyroscope_jerk_mean-z\
19 time_body_accelerometer_magnitude_mean\
20 time_gravity_accelerometer_magnitude_mean\
21 time_body_accelerometer_jerk_magnitude_mean\
22 time_body_gyroscope_magnitude_mean\
23 time_body_gyroscope_jerk_magnitude_mean\
24 frequency_body_accelerometer_mean-x\
25 frequency_body_accelerometer_mean-y\
26 frequency_body_accelerometer_mean-z\
27 frequency_body_accelerometer_meanfreq-x\
28 frequency_body_accelerometer_meanfreq-y\
29 frequency_body_accelerometer_meanfreq-z\
30 frequency_body_accelerometer_jerk_mean-x\
31 frequency_body_accelerometer_jerk_mean-y\
32 frequency_body_accelerometer_jerk_mean-z\
33 frequency_body_accelerometer_jerk_meanfreq-x\
34 frequency_body_accelerometer_jerk_meanfreq-y\
35 frequency_body_accelerometer_jerk_meanfreq-z\
36 frequency_body_gyroscope_mean-x\
37 frequency_body_gyroscope_mean-y\
38 frequency_body_gyroscope_mean-z\
39 frequency_body_gyroscope_meanfreq-x\
40 frequency_body_gyroscope_meanfreq-y\
41 frequency_body_gyroscope_meanfreq-z\
42 frequency_body_accelerometer_magnitude_mean\
43 frequency_body_accelerometer_magnitude_meanfreq\
44 frequency_body_accelerometer_jerk_magnitude_mean\
45 frequency_body_accelerometer_jerk_magnitude_meanfreq\
46 frequency_body_gyroscope_magnitude_mean\
47 frequency_body_gyroscope_magnitude_meanfreq\
48 frequency_body_gyroscope_jerk_magnitude_mean\
49 frequency_body_gyroscope_jerk_magnitude_meanfreq\
50 anglet_body_accelerometer_mean_gravity\
51 anglet_body_accelerometer_jerk_mean_gravity_mean\
52 anglet_body_gyroscope_mean_gravity_mean\
53 anglet_body_gyroscope_jerk_mean_gravity_mean\
54 anglex_gravity_mean\
55 angley_gravity_mean\
56 anglez_gravity_mean\
57 time_body_accelerometer_std-x\
58 time_body_accelerometer_std-y\
59 time_body_accelerometer_std-z\
60 time_gravity_accelerometer_std-x\
61 time_gravity_accelerometer_std-y\
62 time_gravity_accelerometer_std-z\
63 time_body_accelerometer_jerk_std-x\
64 time_body_accelerometer_jerk_std-y\
65 time_body_accelerometer_jerk_std-z\
66 time_body_gyroscope_std-x\
67 time_body_gyroscope_std-y\
68 time_body_gyroscope_std-z\
69 time_body_gyroscope_jerk_std-x\
70 time_body_gyroscope_jerk_std-y\
71 time_body_gyroscope_jerk_std-z\
72 time_body_accelerometer_magnitude_std\
73 time_gravity_accelerometer_magnitude_std\
74 time_body_accelerometer_jerk_magnitude_std\
75 time_body_gyroscope_magnitude_std\
76 time_body_gyroscope_jerk_magnitude_std\
77 frequency_body_accelerometer_std-x\
78 frequency_body_accelerometer_std-y\
79 frequency_body_accelerometer_std-z\
80 frequency_body_accelerometer_jerk_std-x\
81 frequency_body_accelerometer_jerk_std-y\
82 frequency_body_accelerometer_jerk_std-z\
83 frequency_body_gyroscope_std-x\
84 frequency_body_gyroscope_std-y\
85 frequency_body_gyroscope_std-z\
86 frequency_body_accelerometer_magnitude_std\
87 frequency_body_accelerometer_jerk_magnitude_std\
88 frequency_body_gyroscope_magnitude_std\
89 frequency_body_gyroscope_jerk_magnitude_std

- variables 4 to 89 represent averages per group of activity and subject 
- for more info about each measurement type consult README.txt and the features_info.txt in the unzipped dataset directory 

