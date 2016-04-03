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
