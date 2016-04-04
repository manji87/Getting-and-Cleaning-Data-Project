# Getting and Cleaning Data - Project

This codebook describes the data, the variables, and any transformations or work that is performed to clean up the data used in the "run_analysis.R" program.

## Data Source

Original dataset represents data collected from the accelerometers from the Samsung Galaxy S smartphone.

Data is obtained by the following procedure

* Group of 30 volunteers within ages 19-48 years have performed 6 activities (Namely, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S smartphone.
* Its embedded accelerometer and gyroscope, captures 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
* Data has been labeled manually.
* The obtained data is then randomly partitioned into train (70%) and test (30%) datasets.
* The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
* The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity.
* The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
* From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Reference : http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Extracted Datasets
* `features_info.txt`: Shows information about the variables used on the feature vector.
* `features.txt`: List of all features.
* `activity_labels.txt`: Links the class labels with their activity name.
* `train/X_train.txt`: Training dataset.
* `train/y_train.txt`: Training activity numbers.
* `test/subject_train.txt` : Test subject who performed the activity. Ranges from 1 to 30.
* `test/X_test.txt`: Test dataset.
* `test/y_test.txt`: Test activity numbers.
* `train/subject_train.txt`: Train subject who performed the activity. Ranges from 1 to 30. 

## Variables
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ,
tGravityAcc-XYZ,
tBodyAccJerk-XYZ,
tBodyGyro-XYZ,
tBodyGyroJerk-XYZ,
tBodyAccMag,
tGravityAccMag,
tBodyAccJerkMag,
tBodyGyroMag,
tBodyGyroJerkMag,
fBodyAcc-XYZ,
fBodyAccJerk-XYZ,
fBodyGyro-XYZ,
fBodyAccMag,
fBodyAccJerkMag,
fBodyGyroMag,
fBodyGyroJerkMag.

The set of variables are the means, stds of each measurement above  

* mean(): Mean value of the feature
* std(): Standard deviation of the feature

##Description of abbreviations of measurements
* leading t or f is based on time or frequency measurements.
* Body = related to body movement.
* Gravity = acceleration of gravity
* Acc = accelerometer measurement
* Gyro = gyroscopic measurements
* Jerk = sudden movement acceleration
* Mag = magnitude of movement
* mean() and std() are calculated for each subject for each activity for each mean and std measurements for all features.

##Created variables in "run_analysis.R"

* `data_train_X` : data from "train//X_train.txt"
* `data_test_X` : data from "test//X_test.txt"
* `features` : data from "features.txt" with column names "Index","Feature_label"
* `f_labels` : 2nd column of `features` converted to character
* `f_label_split` : Split the feature names in `f_labels` with "-" sign
* `f_label_sub` : Logical vecter for `f_label_split` which is TRUE if mean() or std() is present in the feature.
* `data_X` : dataset obtained by merging `data_train_X` & `data_test_X` with column names `f_labels` 
* `f_data_X_mean_std` : from `data_X` filterd out the columns that has names that has only mean() and std() in them
* `f_data_X_mean_std_label` : the column names of `f_data_X_mean_std`
* `raw_data.txt` : Data for of 3-axial signals in the X, Y and Z directions with mean() and std() estimates.
* `subject_train` : data from "test//subject_train.txt"
* `subject_test` : data from "test//subject_test.txt"
* `subject` : merged data from `subject_train` & `subject_test` with column name "Subject"
* `data_train_Y` : data from "train//subject_train.txt"
* `data_test_Y` : data from "test//subject_test.txt"
* `activity` : merged data from `data_train_Y` & `data_test_Y` with column name "act_lab"
* `act_labels` : activity label data from "activity_labels.txt" with column names "act_lab","Activity"
* `activity_labeled` : joined datasets `activity`, `act_labels` ,by column "act_lab" and making the 1st column null so that only the activity names are in the dataframe
* `data_all` : binding the columns in `f_data_X_mean_std`, `activity_labeled`, `subject`
* `melt_all_by_act_sub` : Melted `data_all` by "Subject" & "Activity"
* `mean_all_by_act_sub` : Mean of `data_all` by each "Subject" & "Activity" combination
* `all_col_names` : Names of all columns in `mean_all_by_act_sub`
* `tidy_col_names` : tidy column names for `mean_all_by_act_sub` dataset
* `tidy_data.txt` : Final output tidy dataset

## Transformations

* Train and Test datasets are merged of the whole data set creating one dataset without train/test division
* Features that have measurements of mean and std were extracted out
* Activity numbers are replaced by the Avtivity names
* The Feature names are renamed according to the tidy data naming rules
* Final tidy dataset is writtien as a text file named 'tidy_data.txt'
