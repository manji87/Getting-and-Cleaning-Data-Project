# Getting and Cleaning Data - Project
This contains the procedure to build a tidy dataset from the data collected from the accelerometers from the Samsung Galaxy S smartphone

The program "run_analysis.R" will get the data from the working directory, which contains the data that are in the original human - activity - recognition using smart phones, and build up a tidy dataset, "tidy_data.txt" ready for further analysis.

##Initializing
Before starting to run the program, the following settings should be done.

1. Get data from the data source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Set the working directory to the location where the downloaded data are saved
3. load in the libraries "reshape2" and "plyr" to the environment
 
##Procedure

The following is a basic outline of how the "run_analysis.R" program works.

1.  Reads in the train and test data sets and bind them together to get "data_X".
2.  Reads in the "features.txt" to assign the variable names for data in "data_X".
3.  Filterouts the columns from "data_X" that only have mean and std in their features.
4.  Creates the file "raw_data.txt" that has the mean and std in features.
5.  Reads in the train and test Subjects and bind them together to indicate the subject number for each observation.
6.  Reads in the train and test Activities and bind them together to indicate the activity number for each observation.
7.  Replaces the activity number by the Activity name.
8.  Creates the tidy dataset indicating to which categories of Activity and Subject each line belongs to.
9.  Melts the tidy dataset according to Activity and Subject.
10. Finds the mean for the data in the tidy dataset that belongs to each Activity & Subject combination for each Feature.
11. Creates and Saves the final tidy dataset by the file name "tidy_data.txt".
